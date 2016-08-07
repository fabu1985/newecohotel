<?php

Class _Category{
	private $dbc;
	private $id;
	private $description;
	private $prize;
	private $last_update;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save(){
		$query = 'INSERT INTO category(
		id,	
		description, 
		price) values (
		50,
		"'.$this->description.'", 
		"'.$this->price.'")';}

	public function listar($param='*'){
			$query = 'SELECT '.$param.' FROM category 
			ORDER BY id DESC';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function ver($id, $param='*'){
			$query = "SELECT $param FROM category 
			WHERE id = $id";
		if ($result = $this->dbc->query($query)){
			$this->dbc->close();
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function setId($id){
					$this->id = $id;
				}

	public function getId(){
					return $this->id;
				}

	public function setDescription($description){
					$this->description = $description;
				}

	public function getDescription(){
					return $this->description;
				}

	public function setPrice($price){
					$this->price = $price;
				}

	public function getPrice(){
					return $this->price;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}
}
?>