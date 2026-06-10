import express from "express";
import cors from "cors";
import { DEFAULTS } from "./config.js";
import RouterProductos from "./routes/routerProducto.js";
import {
  errorHandlerMiddleware,
  notFoundMiddleware,
} from "./middlewares/errorMiddleware.js";

const PORT = process.env.PORT || DEFAULTS.PORT;

const app = express();

// Permitir CORS desde cualquier origen
//app.use(cors());
app.use(cors({ origin: "*" }));

// Middleware para parsear JSON en el body de las solicitudes
app.use(express.json());

app.use("/productos", RouterProductos);
//app.use(notFoundMiddleware);
//app.use(errorHandlerMiddleware);

if (process.env.NODE_ENV !== "production") {
  // Levantar el servidor
  app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
  });
}

export default app;