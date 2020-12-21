
var PropertiesReader = require('properties-reader');

var properties = PropertiesReader('app.properties');

var _ = require('lodash');
//conexion a la base de datos Postgres
const {
    Pool,
    Client
} = require('pg');

const Router = require('express-promise-router')


const pool = new Pool({
    host: properties.get('db.host'),
    database: properties.get('db.database'),
    port: properties.get('db.port'),
    user: properties.get('db.username'),
    password: properties.get('db.password'),
});



const SQL_OBTENER_LISTA_MASCOTA_POR_ID="select * from mascota where id_mascota=$1";
const SQL_OBTENER_LISTA_CLIENTE_POR_ID="select * from cliente where id_cliente=$1";
const SQL_OBTENER_LISTA_SERVICIO_POR_ID="select s.id_client ,c.nombre ,c.apellido ,s.fecha_servicio ,s.estado from servicio s left join cliente c on c.id_cliente =s.id_client left join tipo_servicio ts on ts.id_tipo_servicio =s.id_tipo_servicio where 1=1 and c.id_cliente =$1 and ts.id_tipo_servicio =$2 order by s.id_client asc, s.fecha_servicio desc, s.estado desc";
const SQL_ELIMINAR_MASCOTA_POR_ID="delete from mascota where id_mascota=$1";
const SQL_OBTENER_MASCOTA_POR_CATEGORIA="select * from mascota where id_categoria=$1";

const SQL_INSERTAR_MASCOTA="insert into mascota(nombre,id_categoria) values($1,$2) RETURNING id_mascota";
const SQL_INSERTAR_SOLICITUD_SERVICIO="insert into servicio(id_client,fecha_servicio,estado,id_mascota,id_tipo_servicio) values($1,$2,$3,$4,$5) RETURNING id_servicio";

const SQL_ACTUALIZAR_MASCOTA="update mascota set nombre=$1, id_categoria=$2 where id_mascota=$3";
const SQL_OBTENER_CATEGORIA_POR_ID="select * from categoria where id=$1";
const SQL_LISTAR_ARTICULOS="select * from articulo";
const SQL_LISTAR_VENTAS="select * from venta";

const SQL_OBTENER_MASCOTAS_POR_CLIENTE_Y_TIPO="select cm.id, "+
"c.id_cliente ,  "+
"c.nombre,"+
"c.apellido,"+ 
"m.id_mascota,  "+
"m.nombre, "+
"c3.id ,"+
"c3.nombre "+
"from cliente_mascota cm "+ 
"left join cliente c on c.id_cliente = cm.id_cliente " +
"left join mascota m on m.id_mascota =cm.id_mascota "+
"left join categoria c3 on c3.id =m.id_categoria "+ 
"where 2=2  and c.nombre=$1 and c3.nombre=$2 and m.nombre=$3";


const SQL_OBTENER_LISTA_MASCOTAS="select cm.id, "+
"c.id_cliente ,  "+
"c.nombre as nombre_cliente,"+
"c.apellido as apellido_cliente,"+ 
"m.id_mascota,  "+
"m.nombre as nombre_mascota, "+
"c3.id ,"+
"c3.nombre as tipo "+
"from cliente_mascota cm "+ 
"left join cliente c on c.id_cliente = cm.id_cliente " +
"left join mascota m on m.id_mascota =cm.id_mascota "+
"left join categoria c3 on c3.id =m.id_categoria "+ 
"where 2=2 ";

function insertarMascota(datos){
    console.log("db => insertarMascota ")
    console.log("datos =>", datos)
    try {
        const res = pool.query(SQL_INSERTAR_MASCOTA,[datos.nombre,datos.id_categoria]);
        console.log("res", res);
        return res;
    } catch(err) {
        console.log(err.stack)
        return err.stack;
    }
}

function listarArticulos(){
    console.log("db => listarArticulos");
    try {
        const res = pool.query(SQL_LISTAR_ARTICULOS,[]);
        console.log("res", res);
        return res;
    } catch(err) {
        console.log(err.stack)
        return err.stack;
    }
}

function listarVentas(){
    console.log("db => listarVentas");
    try {
        const res = pool.query(SQL_LISTAR_VENTAS,[]);
        console.log("res", res);
        return res;
    } catch(err) {
        console.log(err.stack)
        return err.stack;
    }
}

function insertarSolicitudServicio(datos){
    console.log("db => insertarSolicitudServicio ")
    console.log("datos =>", datos)
    try {
        const res = pool.query(SQL_INSERTAR_SOLICITUD_SERVICIO,[datos.id_cliente,datos.fecha,datos.estado,datos.id_mascota,datos.id_tipo_servicio]);
        console.log("res", res);
        return res;
    } catch(err) {
        console.log(err.stack)
        return err.stack;
    }
}

function actualizarMascota(datos){
    console.log("db => actualizarMascota ")
    console.log("datos =>", datos)
    try {
        const res = pool.query(SQL_ACTUALIZAR_MASCOTA,[datos.nombre,datos.id_categoria,datos.id_mascota]);
        console.log("res", res);
        return res;
    } catch(err) {
        console.log(err.stack)
        return err.stack;
    }
}

async function obtenerMascotasPorClienteTipo(parametros){
    console.log("parametros ", parametros)
    console.log("SQL ",SQL_OBTENER_MASCOTAS_POR_CLIENTE_Y_TIPO)
    const client = await pool.connect()
    try {
        const res = await client.query(SQL_OBTENER_MASCOTAS_POR_CLIENTE_Y_TIPO, [parametros.nombre_cliente,parametros.tipo_mascota,parametros.nombre_mascota])
        console.log(res.rows[0])
        return res.rows;
    } finally {
        client.release()
    }
}

module.exports = {
    obtenerMascotaPorID: (id)=>pool.query(SQL_OBTENER_LISTA_MASCOTA_POR_ID,[id]),
    obtenerServiciosPorIDClienteIdTipoServicio: (id_cliente,id_tipo_servicio)=>pool.query(SQL_OBTENER_LISTA_SERVICIO_POR_ID,[id_cliente,id_tipo_servicio]),
    obtenerClientePorID: (id)=>pool.query(SQL_OBTENER_LISTA_CLIENTE_POR_ID,[id]),
    obtenerListaMascotas: ()=>pool.query(SQL_OBTENER_LISTA_MASCOTAS,[]),
    insertarMascota: insertarMascota,
    insertarSolicitudServicio: insertarSolicitudServicio,
    eliminarMascota: (id)=>pool.query(SQL_ELIMINAR_MASCOTA_POR_ID,[id]),
    obtenerMascotasPorCategoria: (id_categoria)=>pool.query(SQL_OBTENER_MASCOTA_POR_CATEGORIA,[id_categoria]),
    obtenerMascotasPorClienteTipo:obtenerMascotasPorClienteTipo ,
    actualizarMascota: actualizarMascota,
    obtenerCategoriaPorID: (id)=>pool.query(SQL_OBTENER_CATEGORIA_POR_ID,[id]),
    listarArticulos: listarArticulos,
    listarVentas: listarVentas
}
