import jwt from "jsonwebtoken";
import { JWT_SECRET } from "../database/config.js";
import { tokenVerificationErrors } from "../helpers/tokenManager.js";

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

    return res
      .status(401)
      .json({ error: tokenVerificationErrors[error.message] });
  }
};
