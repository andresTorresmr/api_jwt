import { config } from "dotenv";
config();

export const PORT = process.env.PORT || 5000;
export const DB_HOST = process.env.DB_HOST;
export const DB_USER = process.env.DB_USER;
export const DB_PASSWORD = process.env.DB_PASSWORD;
export const DB_NAME = process.env.DB_NAME;
export const DB_PORT = process.env.DB_PORT;
export const JWT_SECRET = process.env.JWT_SECRET;
export const JWT_REFRESH = process.env.JWT_REFRESH;
export const MODE = process.env.MODE;

export const SUPERUSER = process.env.SUPERUSER;

//CORS
export const ORIGIN1 = process.env.ORIGIN1;

//MODULES
export const USERS = process.env.MODULEUSER;
export const PAYMENTS = process.env.MODULEPAYMENTS;
export const MYPAYMENTS = process.env.MODULEMYPAYMENTS;
export const CATEGORY = process.env.MODULECATEGORY;
export const PRODUCTS = process.env.MODULEPRODUCTS;
export const ADMINS = process.env.MODULEADMINS;
