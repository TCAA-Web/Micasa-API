import { Router } from 'express';
import { getRecord, getRecords } from '../controllers/staffController.js';

const routes = Router();
routes.get('/', getRecords);
routes.get('/:id', getRecord);

export const staffRoutes = routes;
