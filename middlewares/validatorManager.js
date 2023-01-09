import { validationResult, body } from "express-validator";

export const validations = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({
      errors: errors.array(),
    });
  }
  next();
};

export const bodyRegisterValidator = [
  body("email", "Formato de email inválido").trim().isEmail().normalizeEmail(),
  body("password", "Algo salió mal").trim().notEmpty(),
  validations, //SIEMPRE PONER ESTE PARA QUE VALIDE TODO EL BODY
];

//VERIFICA QUE EL CAMPO DE NOMBRE NO ESTÉ VACÍO
export const bodyRoleValidator = [
  body("nombre", "El nombre del rol no puede ir vacío").trim().notEmpty(),
  validations,
];
