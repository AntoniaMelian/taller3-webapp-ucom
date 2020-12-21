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
router.get('/obtener-por-id/:id_cliente/:id_tipo_servicio', cors(), async (req, res, next) => {
  console.log("obtener mascota por ID ", req.params.id_cliente);

  let result = await db.obtenerServiciosPorIDClienteIdTipoServicio(req.params.id_cliente,req.params.id_tipo_servicio);
  console.log("mascotas", result[0]);
  res.send(result.rows);

});

//Ejemplo de como insertar una solicitud de servicio, le pasamos los datos del req.body a la función insertarSolicitudServicio
router.post('/insertar',cors(),async(req,res,next)=>{
  console.log("insertar solicitud de servicio")
  var result={};
  console.log("params", req.body); 

  var solicitud_servicio=req.body;
  console.log(req.body);
  result= await db.insertarSolicitudServicio(solicitud_servicio);

  if(result.rows){
      console.log("Se insertó correctamente la solicitud de servicio");
      res.send(result.rows[0]);
  }else{
      res.send("No se pudo insertar");
      console.log('No se pudo insertar');
  }

});


router.get('/test',cors(), async (req, res, next) => {
  console.log("test")
  const client = new Client({
    user: 'postgres',
    host: '127.0.0.1',
    database: 'apigot',
    password: 'postgres',
    port: 5432,
  })
  client.connect()
  client.query('SELECT NOW()', (err, res) => {
    console.log(err, res)
    client.end()
    return res;
  })

  return "";
})




module.exports = router;
