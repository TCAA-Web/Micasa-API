import { Request, Response } from 'express';
import { prisma } from '../prisma.js';
import { imagePath } from '../utils/formatters.js';

export const getRecords = async (req: Request, res: Response) => {
  try {
    const data = await prisma.estate.findMany({
      select: {
        id: true,
        address: true,
        price: true,
        numRooms: true,
        floorSpace: true,

        city: {
          select: {
            name: true,
            zipcode: true
          }
        },

        type: {
          select: {
            name: true
          }
        },

        energyLabel: {
          select: {
            name: true
          }
        },

        estateImages: {
          select: {
            image: {
              select: {
                filename: true,
                author: true,
                description: true
              }
            }
          }
        }
      }
    });

    data.forEach(item => {
      item.estateImages.forEach(estateImage => {
        console.log(estateImage);
        
        estateImage.image.filename = imagePath(req, estateImage.image.filename);
      });
    });

    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch products' });
  }
};

export const getRecord = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const data = await prisma.estate.findUnique({
      where: { id: Number(id) },
    })
    if (!data) res.status(404).json({ error: 'Product not found' });
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch product' });
  }
};