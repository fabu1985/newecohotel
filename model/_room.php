<?php

Class _Room{
	private $dbc;
	private $id;
	private $number;
	private $price;
	private $status;
	private $active;
	private $last_update;
	private $category_id;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save(){
		$query = 'INSERT INTO room(
		number,
		price,
		status,
		active, 
		category_id) values (
		"'.$this->number.'", 
		"'.$this->price.'",
		0, 
		1, 
		"'.$this->category_id.'")';
		if ($this->dbc->query($query)){
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
}


public function saveservice($habitacion, $servicio){
	$precio = 0;
	//$fecha = date('Y-m-1',time());
	$fecha = date('Y-m-d');
	$nuevafecha = strtotime ( '-0 day' , strtotime ( $fecha ) ) ;
	$nuevafecha = date ( 'Y-m-d' , $nuevafecha );
	if($servicio == 'Wifi'){
		$precio = '15';
	}
	if($servicio == 'Desayuno'){
		$precio = '60';
	}
	if($servicio == 'Almuerzo'){
		$precio = '90';
	}
	if($servicio == 'Merienda'){
		$precio = '60';
	}
	if($servicio == 'Cena'){
		$precio = '120';
	}
	$query = "INSERT INTO services(
		habitacion,
		servicio,
		precio,
		fecha) values ('$habitacion', '$servicio', '$precio', '$nuevafecha')";
		if ($this->dbc->query($query)){
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
}

	public function update(){
		$query = '';
		if (isset($this->category_id) && isset($this->price)) {
		    $query = 'UPDATE `room` SET  
			`price`= '.$this->price.',
			`category_id`= '.$this->category_id.' 
			WHERE number = '.$this->number;
		}else{
			/*$query = 'UPDATE `room` SET  
			`status`= '.$this->status.'
			WHERE number = '.$this->number;*/
		}
		echo $query;
		if ($this->dbc->query($query)){
		}else{
//			echo var_dump($this->dbc);
			echo mysql_errno($this->dbc) . ": " . mysql_error($this->dbc) . "\n";
			die('Error de Conexion con la DB: '.$query);
		}
}
	public function buscar($param=''){
		$query = 'SELECT  	`r`.`number`,
							`cat`.`description` as `category`,							  
							`r`.`price`,
							`r`.`status`,
							`r`.`last_update`
					    FROM (`room` `r` join `category` `cat`)
					    where (`r`.`category_id` = `cat`.`id`) 
					   
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

	public function listaServicios($desde='', $hasta=''){
		$query = 'SELECT s.* from services s where fecha >= "'.$desde.'" and fecha <= "'.$hasta.'" order by id desc';
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

	public function listaServiciosRegistrados($param=''){
		$query = 'SELECT s.* from services s where fecha = curdate() order by habitacion asc';
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
			$disp = array();
			$registration = new _registration();

			$roomlist = Ftn::toArray($result1);
			//echo Ftn::totable($roomlist);
			foreach ($roomlist as $key => $room) {
				$regRoom = $registration->ver($room["room_id"]);
				if(!empty($regRoom)){
					$roomDisp=true;
					foreach ($regRoom as $key => $reg) {
						$to = Ftn::difDate($fechaHasta, $reg['since']);
						$since = Ftn::difDate($reg['to'], $fechaDesde);
						if ($to>0 || $since>0 || $reg['status']==2){
							
						}else{
							$roomDisp=false;
						}
					}
					if($roomDisp){$disp[]=$room;}else{}
				}else{
					$disp[]=$room;
				}
			}

		}else{
			die('Error de Conexion con la DB: '.$query);
		}
		if (!empty($disp)){
			return $disp;
		}else{
			return false;
		}
		
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

	public function vernum($param='*'){
			$query = "SELECT $param FROM room 
			";
		if ($result = $this->dbc->query($query)){
			
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function verdesc($description, $param='*'){
			$query = "SELECT $param FROM category 
			WHERE description = $description order by $description desc";
		if ($result = $this->dbc->query($query)){
			$this->dbc->close();
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function verdesc2($description, $param='*'){
			$query = "SELECT $param FROM category 
			WHERE description = $description order by $description desc";
		if ($result = $this->dbc->query($query)){
			$this->dbc->close();
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function free($param='1')
	{
		$query = "SELECT COUNT(*) AS total
					FROM room
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
					FROM room
					WHERE  `status` =0
					AND  `active` =1";
		if ($result = $this->dbc->query($query)){
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function deleteService($id){
		$query = "DELETE FROM `services`  WHERE `id`=$id";
		if ($this->dbc->query($query)){
			return "success";
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

	public function setPrice($price){
					$this->price = $price;
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