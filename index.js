import express from "express";
import { PORT } from "./database/config.js";
import router from "./routes/auth.route.js";
const app = express();
app.use(express.json());
app.use("/api/v1/", router);
app.listen(PORT, () => console.log("🔥🔥🔥🔥 http://localhost:" + PORT));
