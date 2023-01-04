import express from "express";
import { requireToken } from "../middlewares/requireToken.js";
import {
  getUsers,
  getUsersByRole,
  getUser,
  insertUser,
  updateUser,
  deleteUser,
} from "../controllers/auth.controller.js";
import { bodyRegisterValidator } from "../middlewares/validatorManager.js";
import {
  permissionCheckCreate,
  permissionCheckDelete,
  permissionCheckRead,
} from "../middlewares/permissionCheck.js";
import { USERS } from "../database/config.js";

const usersRouter = express.Router();

// VER TODOS LOS USUARIOS
usersRouter.get("/", requireToken, permissionCheckRead([USERS]), getUsers);

// VER TODOS LOS USUARIOS DE UN ROL ESPECÍFICO
usersRouter.get(
  "/role/:id",
  requireToken,
  permissionCheckRead([USERS]),
  getUsersByRole
);

// VER UN USUARIO ESPECÍFICO
usersRouter.get("/:id", requireToken, permissionCheckRead([USERS]), getUser);

// INSERTAR USUARIOS
usersRouter.post(
  "/insert/",
  requireToken,
  bodyRegisterValidator,
  permissionCheckCreate([USERS]),
  insertUser
);

// REGISTRO DE USUARIOS POR PRIMERA VEZ
usersRouter.post("/register/", bodyRegisterValidator, insertUser);

// ACTUALIZAR USUARIOS
usersRouter.patch("/update/:id", updateUser);

// BORRAR USUARIOS
usersRouter.post(
  "/delete/:id",
  requireToken,
  permissionCheckDelete([USERS]),
  deleteUser
);
export default usersRouter;
