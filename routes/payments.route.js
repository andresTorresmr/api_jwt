import express from "express";
import { getPayments } from "../controllers/payments.controller.js";
import { PAYMENTS } from "../database/config.js";
import { permissionCheckRead } from "../middlewares/permissionCheck.js";
import { requireToken } from "../middlewares/requireToken.js";

const routerPayments = express.Router();

// TODOS LOS PAGOS
routerPayments.get(
  "/",
  requireToken,
  permissionCheckRead([PAYMENTS]),
  getPayments
);

// PAGOS DE UN USUARIO ESPECIFICO
routerPayments.get(
  "/user/:id",
  requireToken,
  permissionCheckRead([PAYMENTS]),
  getPayments
);

export default routerPayments;
