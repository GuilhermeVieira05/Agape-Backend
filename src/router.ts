import { Router } from "express";

const router = Router()







router.get("/test", (req, res) => {
    res.json("Hello World!")
})


export {router}