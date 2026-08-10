import { Router } from 'express';
import { Authenticate, getUserFromToken, refreshAccessToken } from '../controllers/authController.js';
import { Authorize } from '../middleware/authMiddleware.js';

const router = Router();
router.post("/login", Authenticate);
router.post("/refresh", refreshAccessToken);
router.get("/verify", Authorize, getUserFromToken);

export const authRoutes = router;
