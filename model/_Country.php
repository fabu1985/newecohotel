<?php

Class _Country{
	private $dbc;
	private $country_id;
	private $country;
	private $last_update;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save(){
		$query = 'INSERT INTO country(
		country_id, 
		country, 
		last_update) values (
		$this->country_id, 
		$this->country, 
		$this->last_update)';}

	public function listar($param='*'){
			$query = 'SELECT '.$param.' FROM country 
			ORDER BY country_id DESC';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function ver($country_id, $param='*'){
			$query = "SELECT $param FROM country 
			WHERE country_id = $country_id";
		if ($result = $this->dbc->query($query)){
			$this->dbc->close();
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function setCountry_id($country_id){
					$this->country_id = $country_id;
				}

	public function getCountry_id(){
					return $this->country_id;
				}

	public function setCountry($country){
					$this->country = $country;
				}

	public function getCountry(){
					return $this->country;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}
}
?>