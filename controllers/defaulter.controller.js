import { SUPERUSER } from "../database/config.js";
import { pool } from "../database/db.js";

// OBTENER ROLES
export const getDefaulters = async (req, res) => {
  try {
    const [products] = await pool.query(
      "SELECT idproducto,nombre,DATE_FORMAT(fechalim, '%d-%m-%Y') as Fecha_vencimiento FROM producto WHERE fechalim < DATE(NOW()) AND status = 1 AND limfecha=1"
    );
    const [users] = await pool.query(
      "SELECT idpersona,nombres,apellidos,calle,numero from persona where idpersona != ? and status = 1 ",
      [SUPERUSER]
    );

    for (const user of users) {
      //console.log("Nombre: " + user["nombres"]);
      for (const product of products) {
        //console.log(product);
        const [payments] = await pool.query(
          "SELECT p.personaid,p.productoid,prod.nombre from pago p inner join producto prod on p.productoid = prod.idproducto where p.productoid = ? and p.pago = 1",
          [product["idproducto"]]
        );
        console.log(payments);
      }
    }
    res.json({ data: users });
  } catch (error) {
    //console.log(error);
    return res.status(500).json({
      error: error.message,
    });
  }
};
