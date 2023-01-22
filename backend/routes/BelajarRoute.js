import express from "express";
import {
    getBuku,
    buatBuku,
    getBukuById,
    updateBuku,
    deleteBuku
} from "../controllers/Belajar.js";
import { verifyUser } from "../middleware/AuthUser.js";


const router = express.Router();

router.get('/belajar', verifyUser,getBuku);
router.get('/belajar/:id', verifyUser,getBukuById);
router.post('/belajar', verifyUser,buatBuku);
router.patch('/belajar/:id', verifyUser,updateBuku);
router.delete('/belajar/:id', verifyUser,deleteBuku);


export default router;