import { pool } from "../database/db.js";

export const permissionCheckCreate = (moduleName) => async (req, res, next) => {
  try {
    const id = req.uid;
    //console.log(id);
    const [result] = await pool.query(
      "Select rolid from persona where idpersona = ? ",
      [id]
    );
    const role = result[0]["rolid"];
    console.log(role);
    const module = [].concat(moduleName)[0];
    //console.log(module);
    const [rows] = await pool.query(
      "Select w from permisos where rolid = ? and moduloid = ? ",
      [role, module]
    );
    const permission = rows[0]["w"];

    if (permission === 0)
      throw new Error("No tienes permisos para ejecutar esta acción.");

    next();
  } catch (error) {
    console.log(error);
    return res.status(401).json({
      error: error.message,
    });
  }
};

export const permissionCheckRead = (moduleName) => async (req, res, next) => {
  try {
    const id = req.uid;
    //console.log(id);
    const [result] = await pool.query(
      "Select rolid from persona where idpersona = ? ",
      [id]
    );
    const role = result[0]["rolid"];
    console.log(role);
    const module = [].concat(moduleName)[0];
    console.log(module);
    const [rows] = await pool.query(
      "Select r from permisos where rolid = ? and moduloid = ? ",
      [role, module]
    );
    const permission = rows[0]["r"];
    console.log("Permisos: " + permission);
    if (permission === 0)
      throw new Error("No tienes permisos para ejecutar esta acción.");

    next();
  } catch (error) {
    console.log(error);
    return res.status(401).json({
      error: error.message,
    });
  }
};

export const permissionCheckUpdate = (moduleName) => async (req, res, next) => {
  try {
    const id = req.uid;
    //console.log(id);
    const [result] = await pool.query(
      "Select rolid from persona where idpersona = ? ",
      [id]
    );
    const role = result[0]["rolid"];
    console.log(role);
    const module = [].concat(moduleName)[0];
    //console.log(module);
    const [rows] = await pool.query(
      "Select u from permisos where rolid = ? and moduloid = ? ",
      [role, module]
    );
    const permission = rows[0]["u"];

    if (permission === 0)
      throw new Error("No tienes permisos para ejecutar esta acción.");

    next();
  } catch (error) {
    console.log(error);
    return res.status(401).json({
      error: error.message,
    });
  }
};

export const permissionCheckDelete = (moduleName) => async (req, res, next) => {
  try {
    const id = req.uid;
    //console.log(id);
    const [result] = await pool.query(
      "Select rolid from persona where idpersona = ? ",
      [id]
    );
    const role = result[0]["rolid"];
    console.log(role);
    const module = [].concat(moduleName)[0];
    //console.log(module);
    const [rows] = await pool.query(
      "Select d from permisos where rolid = ? and moduloid = ? ",
      [role, module]
    );
    const permission = rows[0]["d"];

    if (permission === 0)
      throw new Error("No tienes permisos para ejecutar esta acción.");

    next();
  } catch (error) {
    console.log(error);
    return res.status(401).json({
      error: error.message,
    });
  }
};
