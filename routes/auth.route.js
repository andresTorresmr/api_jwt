import express from "express";
import { requireToken } from "../middlewares/requireToken.js";
import {
  getUsers,
  getUsersByRole,
  getUser,
  insertUser,
  updateUser,
  deleteUser,
  loginUser,
  refreshToken,
  logout,
} from "../controllers/auth.controller.js";
import { requireRefreshToken } from "../middlewares/requireRefreshToken.js";
import { bodyRegisterValidator } from "../middlewares/validatorManager.js";
import { permissionCheckCreate } from "../middlewares/permissionCheck.js";
import { USERS } from "../database/config.js";

const router = express.Router();

router.get("/users/", requireToken, getUsers);

// VER TODOS LOS USUARIOS DE UN ROL ESPECÍFICO
router.get("/users/role/:id", getUsersByRole);

// VER UN USUARIO ESPECÍFICO
router.get("/users/:id", requireToken, getUser);

// INSERTAR USUARIOS
router.post(
  "/users/insert/",
  requireToken,
  bodyRegisterValidator,
  permissionCheckCreate([USERS]),
  insertUser
);

// ACTUALIZAR USUARIOS
router.patch("/users/update/:id", updateUser);

// BORRAR USUARIOS
router.post("/users/delete/:id", deleteUser);

// LOGIN
router.post("/users/login/", loginUser);

router.get("/refresh/", requireRefreshToken, refreshToken);

router.get("/logout", logout);
export default router;
