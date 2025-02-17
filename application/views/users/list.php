<?php 


?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lista de Usuarios</title>
	<link href="<?php echo base_url().'assets\bootstrap5\css\bootstrap.min.css'?>" rel="stylesheet" >
	<link href="<?php echo base_url().'assets\css\styles.css'?>" rel="stylesheet" >
	<script type="text/javascript" src= "<?php echo base_url().'assets\bootstrap5\js\bootstrap.min.js'?>"></script>

	<script type="text/javascript" src= "<?php echo base_url().'assets\js\functions.js'?>"></script>
</head>
<body>
	<main class="d-flex flex-wrap border border-1 justify-content-around bg-info">
		<div class="w-25 border border-1 text-center p-3">
			<label>LOGO</label>
		</div>
		<div class="w-50 border border-1 text-center p-2"> 
			<h1>Lista de Usuarios</h1> 
		</div>
		<div class="w-10 border border-1 text-center">
			<label>Log-In/Log-Out <br> Acerca de... <br> Contacto</label>
		</div>
	</main>
	<section id="listaUsuarios">
		<div class="row container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="p-2 input-group ">
				  <input type="text" class="form-control" id="busqueda">
				  <button class="btn btn-success" type="submit" >Buscar</button>
				</div>
			</div>
			<div class="col-lg-2 p-2">
				<button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#modalAgregarUsuario">
				    Agregar
				</button>
			</div>
			<hr>
		</div>
		<div class="container mb-2">
		    <label for="numRegistros">Mostrar: </label>
		    <select id="numRegistros" class="form-select w-auto d-inline">
		        <option value="5">5</option>
		        <option value="10">10</option>
		        <option value="25">25</option>
		    </select>
		    <label> registros</label>
		</div>

		<div>
			<table  class="container table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody id="usuarios"></tbody>
			</table>
		</div>
	</section>
</body>
<div class="modal fade" id="modalAgregarUsuario" tabindex="-1" aria-labelledby="modalTitulo" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitulo">Agregar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <form id="formAgregarUsuario">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="tel" class="form-control" id="telefono">
                    </div>
                    <button type="submit" class="btn btn-success">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>

</html>
<script type="text/javascript">
	function datos(id) {
		// Carga el array de PHP como un objeto JavaScript
		let info = <?php echo json_encode($allUsers); ?>;

		// Verifica si la estructura de datos es válida
		if (!Array.isArray(info)) {
			alert("Error: Los datos no son un array válido.");
			return;
		}

		// Buscar el usuario por ID
		let resultado = info.find(user => user.user_id == id);

		// Mostrar resultado
		if (resultado) {
			alert("Usuario encontrado: " + JSON.stringify(resultado, null, 2));
		} else {
			alert("Usuario no encontrado.");
		}
	}


		document.addEventListener("DOMContentLoaded", () => {
		    const tabla = document.getElementById("usuarios");
		    const inputBusqueda = document.getElementById("busqueda");
		    const selectRegistros = document.getElementById("numRegistros");

		    let usuarios = <?php echo json_encode($allUsers); ?>;
		    let registrosAMostrar = parseInt(selectRegistros.value); 

		    mostrarUsuarios(usuarios.slice(0, registrosAMostrar));

		    function mostrarUsuarios(lista) {
		        tabla.innerHTML = "";
		        lista.forEach(user => {
		            let fila = `<tr>
		                <td>${user.user_id}</td>
		                <td>${user.first_name}</td>
		                <td>${user.last_name}</td>
		                <td><button class='btn btn-success' onclick='datos(${user.user_id})'>VER USUARIO</button></td>
		            </tr>`;
		            tabla.innerHTML += fila;
		        });
		    }

		    // Filtrar Usuarios en Tiempo Real
		    inputBusqueda.addEventListener("input", () => {
		        const texto = inputBusqueda.value.toLowerCase();
		        const filtrados = usuarios.filter(user => user.first_name.toLowerCase().includes(texto));
		        mostrarUsuarios(filtrados.slice(0, registrosAMostrar));
		    });

		    // Cambiar Número de Registros a Mostrar
		    selectRegistros.addEventListener("change", () => {
		        registrosAMostrar = parseInt(selectRegistros.value);
		        mostrarUsuarios(usuarios.slice(0, registrosAMostrar));
		    });
		});
	</script>


<script>
    document.getElementById("formAgregarUsuario").addEventListener("submit", function(event) {
        event.preventDefault(); // Evita el envío estándar del formulario

        // Obtener los valores del formulario
        let formData = new FormData(this);

        // Enviar datos con Fetch a CodeIgniter
        fetch("<?php echo site_url('addUser'); ?>", {
            method: "POST",
            body: formData
        })
        .then(response => response.json()) // Convertir respuesta a JSON
        .then(data => {
            if (data.success) {
                alert("Usuario agregado correctamente");
                location.reload(); // Recargar la tabla de usuarios
            } else {
                alert("Error al agregar usuario: " + data.message);
            }
        })
        .catch(error => console.error("Error en la solicitud:", error));

        // Cerrar el modal
        let modal = bootstrap.Modal.getInstance(document.getElementById('modalAgregarUsuario'));
        modal.hide();

        // Limpiar el formulario
        this.reset();
    });

</script>




