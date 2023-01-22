import Buku from "../models/BelajarModel.js";
import User from "../models/UserModels.js";
import { Op } from "sequelize";

export const buatBuku = async(req, res) => {
    const { namabuku, harga, tipe } = req.body;
    try {
        await Buku.create({
            namabuku: namabuku,
            harga: harga,
            tipebuku: tipe,
            userId: req.userId
        });
        res.status(201).json({ msg: "Buku berhasil ditambahkan" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const getBuku = async(req, res) => {
    try{
        let response;
        if (req.role === "admin") {
            response = await Buku.findAll({
                attributes: ['uuid', 'namabuku', 'harga', 'tipebuku' ],
                include: [{
                    model: User,
                    attributes: ['name', 'email']
                }]
            });
        } else {
            response = await Buku.findAll({
                attributes: ['uuid', 'namabuku', 'harga', 'tipebuku'],
                where: {
                    userId: req.userId
                },
                include: [{
                    model: User,
                    attributes: ['name', 'email']
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const getBukuById = async(req, res) => {
    const buku = await Buku.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if (!buku) return res.status(404).json({ msg: "Data tidak ditemukan!" });
    try{
        let response;
        if (req.role === "admin") {
            response = await Buku.findOne({
                attributes: ['uuid', 'namabuku', 'harga', 'tipebuku'],
                where: {
                    id: buku.id
                },
                include: [{
                    model: User,
                    attributes: ['name', 'email']
                }]
            });
        } else {
            response = await Buku.findOne({
                attributes: ['uuid', 'namabuku', 'harga', 'tipebuku'],
                where: {
                    [Op.and]: [{ id: buku.id }, { userId: req.userId }]
                },
                include: [{
                    model: User,
                    attributes: ['name', 'email']
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const updateBuku = async(req, res) => {
    const buku = await Buku.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if (!buku) return res.status(404).json({ msg: "Data tidak ditemukan!" });
    const { namabuku, harga, tipe } = req.body;
    try {
        if (req.role === "admin") {
            await Buku.update({
                namabuku: namabuku,
                harga: harga,
                tipebuku: tipe,
            },{
                where: {
                id: buku.id
                }
            }
            );
        } else {
            if (req.userId !== buku.userId) return res.status(403).json({ msg: "Akses Terlarang" });
            await Buku.update({
                namabuku: namabuku,
                harga: harga,
                tipebuku: tipe,
            },
            {
                where: {
                    [Op.and]: [{ id: buku.id }, { userId: req.userId }]
                },
            }
            )
        }
        res.status(201).json({ msg: "Buku berhasil Update" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const deleteBuku = async(req, res) => {
    const buku = await Buku.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if (!buku) return res.status(404).json({ msg: "Data tidak ditemukan!" });
    try {
        await Buku.destroy({
            where: {
                id: buku.id
            }
        });
        res.status(201).json({ msg: "Buku berhasil dihapus" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

