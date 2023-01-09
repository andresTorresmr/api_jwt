import { pool } from "../database/db.js";

// OBTENER ROLES
export const getPayments = async (req, res) => {
  try {
    const [result] = await pool.query(
      "SELECT p.idpago,calle.nombre as 'calle', n.numero,p.productoid,DATE_FORMAT(p.fecha_pago, '%d-%m-%Y') as fechaPago,p.pago,p.comentario,p.fecha_opcional,d.nombre,c.nombre as categoria ,n.nombres,n.apellidos,d.precio FROM pago p INNER JOIN producto d ON p.productoid = d.idproducto INNER JOIN  categoria c ON d.categoriaid = c.idcategoria INNER JOIN persona n ON p.personaid = n.idpersona INNER JOIN calle ON calle.idCalle = n.calleId WHERE p.pago = 1"
    );
    res.json({ data: result });
  } catch (error) {
    //console.log(error);
    return res.status(500).json({
      error: error.message,
    });
  }
};
