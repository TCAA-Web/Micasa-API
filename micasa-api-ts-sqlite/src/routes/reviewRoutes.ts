import { Router } from 'express';
import { createRecord, deleteRecord, getRecord, getRecords, updateRecord } from '../controllers/reviewController.js';
import { Authorize } from '../middleware/authMiddleware.js';

const routes = Router();
routes.get('/', getRecords);
routes.get('/:id', getRecord);
routes.post('/', Authorize, createRecord);
routes.put('/:id', Authorize, updateRecord);
routes.delete('/:id', Authorize, deleteRecord);

export const reviewRoutes = routes;
