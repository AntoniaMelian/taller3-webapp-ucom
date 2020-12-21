var botonPost = document.getElementById("btn-enviar");
botonPost.addEventListener("click", function () {
    //alert("hola");
  //Enviar parámetros para almacenar los datos del Servicio a través de POST
  const id_mascota = document.getElementById("mascota");
  const fecha = document.getElementById("fecha");
  const id_cliente = document.getElementById("cliente");
  const id_tipo_servicio = document.getElementById("servicio");
  const estado = document.getElementById("estado");

  let params = {
    id_mascota: id_mascota.value,
    fecha: fecha.value,
    id_cliente: id_cliente.value,
    id_tipo_servicio: id_tipo_servicio.value,
    estado: estado.value
  };
 
  axios( {
    method:'POST',
    //url:'http://localhost:3005/servicio/insertar',
    url:'/servicio/insertar',
    data: params,
    headers: { 
        'Content-Type': 'application/json'
      }
    })
    .then(function (res) {
      console.log("respuesta del servidor ", res);
      alert("El servicio se agrego correctamente");
    })
    .catch(function (err) {
      console.log("Error en la peticion POST");
      console.log(err);
      alert("Error no se pudo solicitar el servicio");

    })
    .finally(function () {});
});