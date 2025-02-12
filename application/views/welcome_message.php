<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Practica 1 CodeIgniter</title>
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
			<h1>Bienvenido!</h1> 
		</div>
		<div class="w-10 border border-1 text-center">
			<label>Log-In/Log-Out <br> Acerca de... <br> Contacto</label>
		</div>
	</main>
	<section id="usuarios">
		<div class="d-flex justify-content-center p-3 border border-2" >
			<div>
				<form action="<?php echo site_url('listaUsers') ?>" method="GET">
					<button type="submit">Ver Lista de Usuarios</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>