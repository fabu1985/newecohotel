<?php

Class _City{
	private $dbc;
	private $city_id;
	private $city;
	private $country_id;
	private $last_update;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save(){
		$query = 'INSERT INTO city(
		city_id, 
		city, 
		country_id, 
		last_update) values (
		$this->city_id, 
		$this->city, 
		$this->country_id, 
		$this->last_update)';}

	public function listar($param='*'){
			$query = 'SELECT '.$param.' FROM city where city_id <> 0
			ORDER BY city';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function ver($city_id, $param='*'){
			$query = "SELECT $param FROM city 
			WHERE city_id = $city_id";
		if ($result = $this->dbc->query($query)){
			$this->dbc->close();
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function setCity_id($city_id){
					$this->city_id = $city_id;
				}

	public function getCity_id(){
					return $this->city_id;
				}

	public function setCity($city){
					$this->city = $city;
				}

	public function getCity(){
					return $this->city;
				}

	public function setCountry_id($country_id){
					$this->country_id = $country_id;
				}

	public function getCountry_id(){
					return $this->country_id;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}
}
?>