import express from "express";
import {
  loginUser,
  refreshToken,
  logout,
} from "../controllers/auth.controller.js";
import { requireRefreshToken } from "../middlewares/requireRefreshToken.js";

const router = express.Router();

// LOGIN
router.post("/login/", loginUser);

router.get("/refresh/", requireRefreshToken, refreshToken);

//LOGOUT
router.get("/logout/", logout);
export default router;
