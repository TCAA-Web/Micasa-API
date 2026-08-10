import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import path from 'path';
import { userRoutes } from './routes/userRoutes.js';
import { authRoutes } from './routes/authRoutes.js';
import { estateRoutes } from './routes/estateRoutes.js';
import { cityRoutes } from './routes/cityRoutes.js';
import { reviewRoutes } from './routes/reviewRoutes.js';
import { staffRoutes } from './routes/staffRoutes.js';

dotenv.config();
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }))
app.use(cors())
app.use(
  "/assets/images",
  express.static(path.join(process.cwd(), "assets", "images"))
);
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/estates', estateRoutes);
app.use('/api/cities', cityRoutes);
app.use('/api/reviews', reviewRoutes);
app.use('/api/staff', staffRoutes);

app.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});