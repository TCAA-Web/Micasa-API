import { Request, Response } from 'express';
import { prisma } from '../prisma.js';

export const getRecords = async (req: Request, res: Response) => {
  try {
    const data = await prisma.review.findMany({
      select: {
        id: true,
        comment: true,
        numStars: true,
        createdAt: true,

        estate: {
          select: {
            address: true,
            city: {
              select: {
                zipcode: true,
                name: true
              }
            }
          }
        },

        user: {
          select: {
            firstname: true,
            lastname: true,
            email: true
          }
        },
      }
    });
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch reviews' });
  }
};

export const getRecord = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const data = await prisma.review.findUnique({
      where: {
        id: Number(req.params.id)
      },
      select: {
        id: true,
        comment: true,
        numStars: true,
        createdAt: true,
        estate: {
          select: {
            id: true,
            address: true,
            city: {
              select: {
                id: true,
                zipcode: true,
                name: true
              }
            }
          }
        },
        user: {
          select: {
            id: true,
            firstname: true,
            lastname: true,
            email: true
          }
        }
      }
    })
    if (!data) res.status(404).json({ error: 'Review not found' });
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch review' });
  }
};

export const createRecord = async (req: Request, res: Response) => {
  const userId = req.user?.id;

  const { subject, comment, numStars, estateId } = req.body;

  if (!userId || !subject || !comment || !numStars || !estateId) {
    res.status(400).json({ error: 'All fields are required' });
  }

  try {
    const data = await prisma.review.create({
      data: {
        userId: Number(userId),
        estateId: Number(estateId),
        subject,
        comment,
        numStars: Number(numStars),
        date: new Date(),
        isActive: true
      },
    });
    res.status(201).json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to create review' });
  }
}

export const updateRecord = async (req: Request, res: Response) => {
  const { id } = req.params;
  const { numStars, subject, comment, estateId } = req.body;

  try {
    const dataToUpdate: any = {
      numStars: Number(numStars),
      subject,
      comment,
      estateId: Number(estateId)
    };

    const data = await prisma.review.update({
      where: { id: Number(id) },
      data: dataToUpdate,
    });

    res.status(200).json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to update review' });
  }
};

export const deleteRecord = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    await prisma.review.delete({
      where: { id: Number(id) },
    });
    res.status(200).json({ message: 'Review deleted' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to delete review' });
  }
};
