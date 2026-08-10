import { Request, Response } from 'express';
import { prisma } from '../prisma.js';
import { imagePath } from '../utils/formatters.js';

export const getRecords = async (req: Request, res: Response) => {
  try {
    const data = await prisma.staff.findMany({
      select: {
        id: true,
        firstname: true,
        lastname: true,
        position: true,
        image: true,
        email: true,
        phone: true,
      }
    });

    const formattedData = data.map(item => ({
      ...item,
      image: imagePath(req,item.image)
    }))

    res.json(formattedData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch employees' });
  }
};

export const getRecord = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const data = await prisma.staff.findUnique({
      where: { id: Number(id) }
    })

    if (!data) {
      return res.status(404).json({ error: 'Employee not found' });
    }

    const formattedData = {
      ...data,
      image: imagePath(req, data.image)
    }    

    res.json(formattedData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch employee' });
  }
};