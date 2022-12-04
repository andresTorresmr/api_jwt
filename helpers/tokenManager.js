import jwt from "jsonwebtoken";
import { JWT_SECRET } from "../database/config.js";

export const generateToken = (uid) => {
  const expiresIn = 60 * 15;
  try {
    const token = jwt.sign({ uid }, JWT_SECRET, { expiresIn });
    return { token, expiresIn };
  } catch (error) {
    return error;
  }
};
