<?php 


?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lista de Usuarios</title>
	<link href="<?php echo base_url().'assets\bootstrap5\css\bootstrap.min.css'?>" rel="stylesheet" >
	<link href="<?php echo base_url().'assets\css\style.css'?>" rel="stylesheet" >
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
		<div>
			<table  class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<?php 

					foreach ($allUsers as $user) {
						echo "<tr>
						<td>".$user['user_id']."</td>
						<td>".$user['first_name']." </td>
						<td>".$user['last_name']."</td>
						<td>
							<button class='btn btn-success' onclick='datos(".$user['user_id'].")'>VER USUARIO</button>
						</td>
					</tr>";
						
					}
					 ?>
					
				</tbody>
			</table>
		</div>
	</section>
</body>
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
</script>
