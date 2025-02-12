<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model("MUsers");

	}

	public function index()
	{
		$this->load->view('welcome_message');
	}


	public function listaUsers(){
		//$this->MUsers->init("libros");
		$info['allUsers'] = $this->MUsers->getUsersData();//forma correcta
		//$info2 = $this->MUsers->getUsersData(); //forma incorrecta
		//print_r($info);
		$this->load->view('users/list',$info);

	}
}
