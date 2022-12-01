import { pool } from "../database/db.js";

// OBTENER USUARIOS
export const getUsers = async (req, res) => {
  try {
    const [result] = await pool.query("Select * from persona");
    res.json({ data: result });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      data: "Algo salió mal",
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
    const query =
      "INSERT INTO persona (nombres, apellidos, telefono, email_user, calle, numero, password, rolid) VALUES (?,?,?,?,?,?,?,?)";
    const [rows] = await pool.query(query, [
      nombres,
      apellidos,
      telefono,
      email,
      calle,
      numero,
      password,
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
