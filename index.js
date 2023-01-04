import express from "express";
import { PORT } from "./database/config.js";
import router from "./routes/auth.route.js";
import cookieParser from "cookie-parser";
import usersRouter from "./routes/users.route.js";
import roleRouter from "./routes/roles.route.js";
const app = express();
app.use(express.json());
app.use(cookieParser());

//RUTAS ---------------------------------------------------------------------------------

app.use("/api/v1/", router);
//USERS
app.use("/api/v1/users/", usersRouter);
// ROLES
app.use("/api/v1/role/", roleRouter);

//ejemplo de login
app.use(express.static("public"));

app.listen(PORT, () => console.log("🔥🔥🔥🔥 http://localhost:" + PORT));
