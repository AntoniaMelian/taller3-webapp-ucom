var table = document.getElementById("tblListaventas");

function listaventasDemo() {
  console.log("listaventasDemo");
  axios
    .get("ventas/listar", {
      params: {
        status: ""
      },
      responseType: "json"
    })
    .then(function (res) {
      //cuando obtenemos una respuesta satisfactoria del lado del servidor
      //la peticion se proceso correctamente
      
      let listaventas = res.data;
     listaventas.forEach(function (value, index) {
        console.log("fila ", value);
    
        // Create an empty <tr> element and add it to the 1st position of the table:
        var row = table.insertRow(index + 1);
    
        // Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
    
        // Add some text to the new cells:
        cell1.innerHTML = "" + value.venta_id;
        cell2.innerHTML = "" + value.fecha_venta;
        cell3.innerHTML = "" + value.cliente_id;
        cell4.innerHTML = "" + value.monto_total;
        cell5.innerHTML = "" + value.nro_factura;
        cell6.innerHTML = "" + value.activo;
      });
    
      console.log(res);
      console.log("cantidad: " + res.data.length);
    })
    .catch(function (err) {
      //cuando hubo un error al procesar la peticion en el servidor
      console.log("Error en la peticion GET");
      console.log(err);
    })
    .finally(function () {
      //esta peticion siempre se ejecuta al finalizar el procesamiento del lado del servidor
      console.log("ejecutamos la funcion finally");
    });
  }

//Ejecutamos la función lista de ventas
listaventasDemo();
