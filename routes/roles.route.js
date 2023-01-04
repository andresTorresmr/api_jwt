import express from "express";
import {
  deleteRole,
  getRole,
  getRoles,
  insertRole,
  updateRole,
} from "../controllers/roles.controller.js";
import { USERS } from "../database/config.js";
import {
  permissionCheckCreate,
  permissionCheckDelete,
  permissionCheckRead,
  permissionCheckUpdate,
} from "../middlewares/permissionCheck.js";
import { requireToken } from "../middlewares/requireToken.js";
import { bodyRoleValidator } from "../middlewares/validatorManager.js";

const roleRouter = express.Router();

// TODOS LOS ROLES
roleRouter.get("/", requireToken, permissionCheckRead([USERS]), getRoles);

// ROL POR ID
roleRouter.get("/:id", requireToken, permissionCheckRead([USERS]), getRole);

// INSERTAR ROL
roleRouter.post(
  "/insert",
  requireToken,
  bodyRoleValidator,
  permissionCheckCreate([USERS]),
  insertRole
);

roleRouter.put(
  "/update/:idrol",
  requireToken,
  bodyRoleValidator,
  permissionCheckUpdate([USERS]),
  updateRole
);

roleRouter.post(
  "/delete/:idrol",
  requireToken,
  permissionCheckDelete([USERS]),
  deleteRole
);

export default roleRouter;
