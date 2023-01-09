import express from "express";
import { getDefaulters } from "../controllers/defaulter.controller.js";

const roleDefaulter = express.Router();

// LOGIN
roleDefaulter.post("/", getDefaulters);

export default roleDefaulter;
