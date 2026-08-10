import type { Request } from 'express';

export const imagePath = (req: Request, filename: string) => {
    const protocol = req.secure ? 'https' : 'http';
    return `${protocol}://${req.get("host")}/assets/${filename}`
}