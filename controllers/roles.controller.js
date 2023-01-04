import { pool } from "../database/db.js";

// OBTENER ROLES
export const getRoles = async (req, res) => {
  try {
    const [result] = await pool.query("Select * from rol where status != 0");
    res.json({ data: result });
  } catch (error) {
    //console.log(error);
    return res.status(500).json({
      error: error.message,
    });
  }
};

// OBTENER ROL ESPECIFICO
export const getRole = async (req, res) => {
  try {
    const { id } = req.params;
    const [result] = await pool.query(
      "Select * from rol where idrol = ? and status != 0",
      [id]
    );
    res.json(result[0]);
  } catch (error) {
    //console.log(error);
    return res.status(500).json({
      error: error.message,
    });
  }
};

// INSERTAR ROL
export const insertRole = async (req, res) => {
  try {
    const { nombre, descripcion } = req.body;
    const [rows] = await pool.query(
      "SELECT nombrerol FROM rol WHERE nombrerol = ? AND status =! 0",
      [nombre]
    );
    if (rows.length > 0) throw new Error("El rol ya existe");
    const [result] = await pool.query(
      "INSERT INTO rol (nombrerol, descripcion) VALUES (?,?)",
      [nombre, descripcion]
    );
    if (result.affectedRows > 0) {
      res.json({ data: "Rol insertado correctamente." });
    } else {
      throw new Error("Error al insertar rol");
    }
  } catch (error) {
    return res.status(500).json({
      error: error.message,
    });
  }
};

// INSERTAR ROL
export const updateRole = async (req, res) => {
  try {
    const { idrol } = req.params;
    const { nombre, descripcion, status } = req.body;
    const [rows] = await pool.query(
      "SELECT nombrerol FROM rol WHERE nombrerol = ? AND status not in (0) and idrol != ?",
      [nombre, idrol]
    );
    // console.log("Filas", rows.length);
    // return;
    if (rows.length > 0) throw new Error("Este nombre de rol ya existe");
    const [result] = await pool.query(
      "UPDATE rol SET nombrerol = ? , descripcion = ?, status = ? WHERE idrol = ?",
      [nombre, descripcion, status, idrol]
    );
    if (result.affectedRows > 0) {
      res.json({ data: "Rol actualizado correctamente." });
    } else {
      throw new Error("Error al actualizar el rol");
    }
  } catch (error) {
    return res.status(500).json({
      error: error.message,
    });
  }
};

// ELIMINAR ROL
export const deleteRole = async (req, res) => {
  try {
    const { idrol } = req.params;
    const [rows] = await pool.query(
      "SELECT count(idpersona) as personas FROM persona WHERE rolid = ? AND status not in (0)",
      [idrol]
    );
    const usuarios = rows[0]["personas"];

    if (usuarios > 0) {
      throw new Error(
        "No se puede eliminar el rol por que tiene usuarios relacionados."
      );
    } else {
      const [result] = await pool.query(
        "UPDATE rol SET status = 0 WHERE idrol = ? and status not in (0)",
        [idrol]
      );
      if (result.affectedRows > 0) {
        res.json({ data: "Rol eliminado correctamente." });
      } else {
        throw new Error("No se encontró el rol.");
      }
    }
  } catch (error) {
    return res.status(500).json({
      error: error.message,
    });
  }
};
