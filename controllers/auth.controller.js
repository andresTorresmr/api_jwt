import { pool } from "../database/db.js";
import bycryptjs from "bcryptjs";
import { JWT_REFRESH } from "../database/config.js";
import {
  generateRefreshToken,
  generateToken,
  tokenVerificationErrors,
} from "../helpers/tokenManager.js";
import jwt from "jsonwebtoken";

// OBTENER USUARIOS
export const getUsers = async (req, res) => {
  try {
    if (req.uid === 64) {
      const [result] = await pool.query("Select * from persona");
      res.json({ data: result });
    } else {
      throw new Error("Usuario no tiene permisos para acceder a la ruta");
    }
  } catch (error) {
    //console.log(error);
    return res.status(500).json({
      error: error.message,
    });
  }
};

// OBTENER USUARIOS POR ROLES
export const getUsersByRole = async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await pool.query(
      "Select * from persona where rolid = ? and status = 1",
      [id]
    );
    if (result.length > 0) {
      res.json({ data: result });
    } else {
      res.status(404).json({
        data: "Datos no encontrados",
      });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }
};

// OBTENER USUARIO
export const getUser = async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await pool.query(
      "Select * from persona where idpersona = ?",
      [id]
    );
    if (rows.length > 0) {
      res.json({ data: rows[0] });
    } else {
      res.status(404).json({
        data: "Datos no encontrados",
      });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }
};

// INSERTAR USUARIO
export const insertUser = async (req, res) => {
  const {
    nombres,
    apellidos,
    telefono,
    email,
    calle,
    numero,
    password,
    rolid,
  } = req.body;
  try {
    const repeated =
      "SELECT * from persona WHERE email_user = ? and calle = ? and numero = ? and status != 0";
    const [result] = await pool.query(repeated, [email, calle, numero]);
    if (result.length > 0)
      return res.status(400).json({
        data: "El usuario ya está registrado",
      });

    const salt = await bycryptjs.genSalt(10);
    const hashpassword = await bycryptjs.hash(password, salt);
    const query =
      "INSERT INTO persona (nombres, apellidos, telefono, email_user, calle, numero, password, rolid) VALUES (?,?,?,?,?,?,?,?)";
    const [rows] = await pool.query(query, [
      nombres,
      apellidos,
      telefono,
      email,
      calle,
      numero,
      hashpassword,
      rolid,
    ]);
    res.json({
      data: "Usuario creado exitosamente.",
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }
};

// ACTUALIZAR USUARIO
export const updateUser = async (req, res) => {
  const {
    nombres,
    apellidos,
    telefono,
    email,
    calle,
    numero,
    password,
    rolid,
  } = req.body;
  try {
    const { id } = req.params;
    const query =
      "UPDATE persona SET nombres = IFNULL(?, nombres), apellidos = IFNULL(?, apellidos), telefono = IFNULL(?, telefono), email_user = IFNULL(?, email_user), calle = IFNULL(?, calle), numero = IFNULL(?, numero), password = IFNULL(?, password), rolid = IFNULL(?, rolid) WHERE idpersona = ?";
    const [result] = await pool.query(query, [
      nombres,
      apellidos,
      telefono,
      email,
      calle,
      numero,
      password,
      rolid,
      id,
    ]);

    if (result.affectedRows === 0) {
      res.status(404).json({
        data: "Usuario no encontrado",
      });
    } else {
      const [rows] = await pool.query(
        "Select * from persona where idpersona = ?",
        [id]
      );
      res.json({ data: "Datos actualizados correctamente", row: rows[0] });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }
};

//BORRAR USUARIO
export const deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await pool.query(
      "Update persona SET status = 0 WHERE idpersona = ? and status != 0",
      [id]
    );
    if (rows.affectedRows > 0) {
      res.json({ data: "Usuario eliminado exitosamente." });
    } else {
      res.status(404).json({
        data: "Usuario no encontrado",
      });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }
};

//LOGIN PRUEBA
export const loginUser = async (req, res) => {
  console.log(req.body);
  const { email, password } = req.body;
  try {
    const [rows] = await pool.query(
      "Select password, status, idpersona from persona where email_user = ?",
      [email]
    );

    //BUSCA SI REGRESA REGISTROS
    if (rows.length <= 0)
      return res.status(403).json({ msg: "Usuario no encontrado" });

    //VALIDA QUE NO ESTÉ INACTIVO
    const status = rows[0]["status"];
    if (status != 1) return res.status(403).json({ msg: "Usuario inactivo" });

    //COMPARA LA CONTRASEÑA DE LA BASE DE DATOS CON LA BRINDADA EN EL JSON
    const passwordDB = rows[0]["password"];
    const compare = await bycryptjs.compare(password, passwordDB);
    if (!compare) return res.status(403).json({ msg: "Contraseña incorrecta" });

    //CASO DE INICIO DE SESIÓN EXITOSO. PASA AL SIGUIENTE PROCESO
    const uid = rows[0]["idpersona"];
    //res.json({ msg: "Inicio de sesión exitoso" });

    //GENERAR JWT
    const { token, expiresIn } = generateToken(uid);
    generateRefreshToken(uid, res);

    return res.json({ token, expiresIn });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }

  // res.json();
};

export const refreshToken = (req, res) => {
  try {
    const { token, expiresIn } = generateToken(req.uid);
    return res.json({ token, expiresIn });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
    });
  }
};

export const logout = (req, res) => {
  res.clearCookie("refreshToken");
  res.json({ ok: true });
};
