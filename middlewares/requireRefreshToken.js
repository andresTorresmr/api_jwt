import { JWT_REFRESH } from "../database/config.js";
import jwt from "jsonwebtoken";
import { tokenVerificationErrors } from "../helpers/tokenManager.js";

export const requireRefreshToken = (req, res, next) => {
  try {
    const refreshTokenCookie = req.cookies.refreshToken;
    if (!refreshTokenCookie) throw new Error("No existe el token");
    const { uid } = jwt.verify(refreshTokenCookie, JWT_REFRESH);
    req.uid = uid;
    next();
  } catch (error) {
    console.log(error);
    return res
      .status(401)
      .json({ error: tokenVerificationErrors[error.message] });
  }
};
