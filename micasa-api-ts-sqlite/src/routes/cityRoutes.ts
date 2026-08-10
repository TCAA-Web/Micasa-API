import { Router } from 'express';
import { getRecord, getRecords } from '../controllers/cityController.js';

const routes = Router();
routes.get('/', getRecords);
routes.get('/:id', getRecord);

export const cityRoutes = routes;
