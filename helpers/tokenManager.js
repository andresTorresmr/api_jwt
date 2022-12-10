import jwt from "jsonwebtoken";
import { JWT_SECRET, JWT_REFRESH, MODE } from "../database/config.js";

export const generateToken = (uid) => {
  const expiresIn = 60 * 15;
  try {
    const token = jwt.sign({ uid }, JWT_SECRET, { expiresIn });
    return { token, expiresIn };
  } catch (error) {
    return error;
  }
};

export const generateRefreshToken = (uid, res) => {
  const expiresIn = 60 * 60 * 24 * 30;
  try {
    const refreshToken = jwt.sign({ uid }, JWT_REFRESH, { expiresIn });
    res.cookie("refreshToken", refreshToken, {
      httpOnly: true,
      secure: !(MODE === "developer"),
      expires: new Date(Date.now() + expiresIn * 1000),
    });
  } catch (error) {
    console.log(error);
  }
};
