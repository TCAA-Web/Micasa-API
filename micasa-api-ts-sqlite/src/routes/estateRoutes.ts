import { Router } from 'express';
import { getRecord, getRecords } from '../controllers/estateController.js';

const routes = Router();
routes.get('/', getRecords);
routes.get('/:id', getRecord);

export const estateRoutes = routes;
