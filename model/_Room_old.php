<?php

Class _Room_old{
	private $dbc;
	private $id;
	private $number;
	private $status;
	private $active;
	private $last_update;
	private $category_id;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save(){
		$query = 'INSERT INTO room(
		id, 
		number, 
		status, 
		active, 
		last_update, 
		category_id) values (
		$this->id, 
		$this->number, 
		$this->status, 
		$this->active, 
		$this->last_update, 
		$this->category_id)';}

	public function buscar($param=''){
		$query = 'SELECT  	`r`.`number`,
							`cat`.`description` as `category`,							  
							`cat`.`prize`,
							`r`.`status`,
							`r`.`last_update`
					    FROM (`room` `r` join `category` `cat`)
					    where (`r`.`category_id` = `cat`.`id`) 
					   	and (`r`.`active` = 1)
					   	and (`cat`.`id` like "'.$param.'%")
						order by `r`.`number` asc';
			if ($result = $this->dbc->query($query)){
				$lista = Ftn::toArray($result);
				foreach ($lista as $key => $value) {
					foreach ($value as $key2 => $value2){
						if ($key2 == 'status'){
							$lista[$key][$key2] = ($value2 == '0') ? "Libre" : "Ocupada";
						}
					}
				}
				return $lista;
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function verDisponible($fechaDesde, $fechaHasta, $categoria){
		$query = 'SELECT  	`r`.`id` as room_id,
							`r`.`number` as nro,
							`cat`.`description` as `categoria`,							  
							`cat`.`prize` as precio,
							`r`.`status` as estado,
							`r`.`last_update` as "ultimo cambio"
					    FROM `room` `r`, `category` `cat`
					    where `r`.`category_id` = `cat`.`id`
					   	and `r`.`active` = 1
					   	and `cat`.`id` = "'.$categoria.'"
						order by `r`.`number` asc';
		if ($result1 = $this->dbc->query($query)){
			$result1=Ftn::toArray($result1);
			if (!empty($result1)){
				$return=array();
				foreach ($result1 as $key => $value) {
					$query = "SELECT * FROM `REGISTRATION` 
								WHERE `room_id` =".$value['room_id'];
					if ($result2 = $this->dbc->query($query)){
						$result2=Ftn::toArray($result2);
						if (!empty($result2)){
							$add=false;
							foreach ($result2 as $key2 => $value2) {
								if (($fechaHasta<$value2['since'] || $fechaDesde>$value2['to'])){
									$add=true;
									echo "<br/>Fecha Hasta: ".$fechaHasta."<br/>Since: ".$value2['since'];
									echo "</br>Fecha Desde: ".$fechaHasta."<br/>To: ".$value2['to'];
								}
							}
							if ($add){
								$return[]=$value;
								$add=false;
							}
						}else{
							$return[]=$value;
						}	
					}else{
						die("Error de Conexion con la DB");
					}
				}
			} 
			else{
				die('Sin datos');	
			}

		}else{
			die('Error de Conexion con la DB: '.$query);
		}
		//return $return;
	}


	public function ver($id, $param='*'){
			$query = "SELECT $param FROM room 
			WHERE id = $id";
		if ($result = $this->dbc->query($query)){
			
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function free($param='1')
	{
		$query = "SELECT COUNT( * ) AS total
					FROM ROOM
					WHERE  `status` =0
					AND  `active` =1
					AND  `category_id` =$param";
		if ($result = $this->dbc->query($query)){
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function totalFree()
	{
		$query = "SELECT COUNT( * ) AS total
					FROM ROOM
					WHERE  `status` =0
					AND  `active` =1";
		if ($result = $this->dbc->query($query)){
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

	public function setNumber($number){
					$this->number = $number;
				}

	public function getNumber(){
					return $this->number;
				}

	public function setStatus($status){
					$this->status = $status;
				}

	public function getStatus(){
					return $this->status;
				}

	public function setActive($active){
					$this->active = $active;
				}

	public function getActive(){
					return $this->active;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}

	public function setCategory_id($category_id){
					$this->category_id = $category_id;
				}

	public function getCategory_id(){
					return $this->category_id;
				}
}
?>