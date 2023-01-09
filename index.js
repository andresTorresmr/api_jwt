import express from "express";
import { ORIGIN1, PORT } from "./database/config.js";
import router from "./routes/auth.route.js";
import cookieParser from "cookie-parser";
import usersRouter from "./routes/users.route.js";
import roleRouter from "./routes/roles.route.js";
import roleDefaulter from "./routes/defaulter.route.js";
import routerPayments from "./routes/payments.route.js";
import cors from "cors";

const app = express();

const whiteList = [ORIGIN1];

app.use(
  cors()
  //     {
  //     origin: function (origin, callback) {
  //       if (whiteList.includes(origin)) {
  //         return callback(null, origin);
  //       }
  //       return callback("Error de CORS origin: " + origin + " No Autorizado");
  //     },
  //   })
);
app.use(express.json());
app.use(cookieParser());
//RUTAS ---------------------------------------------------------------------------------

app.use("/api/v1/", router);
//USERS
app.use("/api/v1/users/", usersRouter);
// ROLES
app.use("/api/v1/role/", roleRouter);
// MOROSOS
app.use("/api/v1/defaulter/", roleDefaulter);
// PAGOS
app.use("/api/v1/payments/", routerPayments);

//ejemplo de login
app.use(express.static("public"));

app.listen(PORT, () => console.log("🔥🔥🔥🔥 http://localhost:" + PORT));
