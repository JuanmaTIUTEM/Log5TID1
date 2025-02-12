<?php 

class MUsers extends CI_Model{

	public function init($database){
		$this->db = $this->load->database($database, TRUE); 
	}

	public function getUsersData(){
		//Variable para cadena de consulta
		$query = "SELECT * FROM vwallusersdata;";
		//Almacena el resultado obtenido de la consulta
		$result = $this->db->query($query);
		if($result){
			$res = $result->result_array(); //convierte el resultado en un array, y despues lo almacena en la variable
			return $res;//retornamos el resultado en modo array
		}else{
			return $res['msg'] = "NO hay registros!";
		}

	}

}


 ?>