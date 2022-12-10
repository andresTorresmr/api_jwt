import express from "express";
import { PORT } from "./database/config.js";
import router from "./routes/auth.route.js";
import cookieParser from "cookie-parser";
const app = express();
app.use(express.json());
app.use(cookieParser());

//RUTAS
app.use("/api/v1/", router);

//ejemplo de login
app.use(express.static("public"));

app.listen(PORT, () => console.log("🔥🔥🔥🔥 http://localhost:" + PORT));
