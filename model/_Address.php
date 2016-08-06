<?php

Class _Address{
	private $dbc;
	private $user_id;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save($user_id){
		$query = 'INSERT INTO address(
		`user_id`) values ('.$user_id.')';
		
		if ($this->dbc->query($query)){
			$id = $this->dbc->insert_id;
			return true;
		}else{
			die('Error de Conexión con la base de datos. Vuelva a intentarlo más tarde.(Die funcion save Address');
		}
	}

	public function listar($param='*'){
			$query = 'SELECT '.$param.' FROM address 
			ORDER BY address_id DESC';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}
	public function updateAddress($address,$phone,$zip,$district,$city_id){
		$query = "UPDATE `address` set 
					`address`='".$address."',
					`phone`='".$phone."',
					`postal_code`='".$zip."',
					`district`='".$district."',
					`city_id`=".$city_id."
					where `user_id`=".SESSION::getvalue('userid');
		if ($this->dbc->query($query)){
			return "success";
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function ver($param='*'){
			$query = "SELECT $param FROM address 
			WHERE user_id = ".SESSION::get('userid');
		if ($result = $this->dbc->query($query)){
			$this->dbc->close();
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function setAddress_id($address_id){
					$this->address_id = $address_id;
				}

	public function getAddress_id(){
					return $this->address_id;
				}

	public function setAddress($address){
					$this->address = $address;
				}

	public function getAddress(){
					return $this->address;
				}

	public function setAddress2($address2){
					$this->address2 = $address2;
				}

	public function getAddress2(){
					return $this->address2;
				}

	public function setDistrict($district){
					$this->district = $district;
				}

	public function getDistrict(){
					return $this->district;
				}

	public function setCity_id($city_id){
					$this->city_id = $city_id;
				}

	public function getCity_id(){
					return $this->city_id;
				}

	public function setPostal_code($postal_code){
					$this->postal_code = $postal_code;
				}

	public function getPostal_code(){
					return $this->postal_code;
				}

	public function setPhone($phone){
					$this->phone = $phone;
				}

	public function getPhone(){
					return $this->phone;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}
}
?>