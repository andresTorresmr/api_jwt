import express from "express";
import { body } from "express-validator";
import { validations } from "../middlewares/validations.js";
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

const router = express.Router();

router.get("/users/", requireToken, getUsers);

// VER TODOS LOS USUARIOS DE UN ROL ESPECÍFICO
router.get("/users/role/:id", getUsersByRole);

// VER UN USUARIO ESPECÍFICO
router.get("/users/:id", requireToken, getUser);

// INSERTAR USUARIOS
router.post(
  "/users/insert/",
  [
    body("email", "Formato de email inválido")
      .trim()
      .isEmail()
      .normalizeEmail(),
  ],
  validations,
  insertUser
);

// ACTUALIZAR USUARIOS
router.patch("/users/update/:id", updateUser);

// BORRAR USUARIOS
router.post("/users/delete/:id", deleteUser);

// LOGIN
router.post("/users/login/", loginUser);

router.get("/refreshh/", refreshToken);

router.get("/logout", logout);
export default router;
