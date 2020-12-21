var express = require('express');
var cors = require('cors');
var router = express.Router();
const axios = require('axios');

const jwt = require('express-jwt')

var PropertiesReader = require('properties-reader');

const db = require('../../db');

var _ = require('lodash');

const Router = require('express-promise-router')
const {
  Pool,
  Client
} = require('pg');


//Ejemplo de como recibir parametros en la petición GET, en este caso recibido el parametro id
router.get('/listar', cors(), async (req, res, next) => {
  console.log("listar todos los artículos ");

  let result = await db.listarArticulos(req.params.id);
  console.log("articulo", result.rows[0]);
  res.send(result.rows);

});




module.exports = router;
