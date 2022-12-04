import jwt from "jsonwebtoken";
import { JWT_SECRET } from "../database/config.js";

export const requireToken = (req, res, next) => {
  try {
    let token = req.headers?.authorization;
    if (!token) throw new Error("No Bearer");

    token = token.split(" ")[1];
    const { uid } = jwt.verify(token, JWT_SECRET);
    console.log(uid);
    req.uid = uid;
    next();
  } catch (error) {
    console.log(error);
    const TokenVerificationErrors = {
      "invalid signature": "La firma del token no es válida",
      "jwt expired": "Token expirado",
      "invalid token": "Token inválido",
      "No Bearer": "Utiliza el formato Bearer",
    };
    return res
      .status(401)
      .json({ error: TokenVerificationErrors[error.message] });
  }
};
