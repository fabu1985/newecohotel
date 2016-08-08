<?php

Class _Registration{
	private $dbc;
	private $id;
	private $since;
	private $to;
	private $date;
	private $status;
	private $last_update;
	private $room_id;
	private $user_id;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	public function save(){
		

	$insertreserva = "INSERT INTO reserva(
		`user_id`, 
		`name`, 
		`room_id`, 
		`habitacion`, 
		`status_res`,
    `check_in`,
     `check_out`, 
		`precio`) values (
		'".SESSION::getvalue('userid')."', 
		'', 
		'$this->room_id',
		$this->habitacion,
		0, 
		'$this->since',
		'$this->to',
		'$this->precio'
		)";
        $this->dbc->query($insertreserva);
        $idReserva = $this->dbc->insert_id;
        $query = "INSERT INTO registration(
	    `id`, 
		`since`, 
		`to`, 
		`date`, 
		`status`, 
		`last_update`, 
		`room_id`, 
		`user_id`) values ('$idReserva',
		'$this->since', 
		'$this->to', 
		'".date('Y-m-d')."',
		0, 
		'".date('Y-m-d')."',
		$this->room_id, 
		".SESSION::getvalue('userid')."
		)";




		if ($this->dbc->query($query)){
					
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function listar($param='*'){
			$query = 'SELECT * FROM registration 
			ORDER BY nro DESC';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function ver($id, $param='*'){
			$query = "SELECT $param FROM registration 
			WHERE room_id = $id";
		if ($result = $this->dbc->query($query)){
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function updateStatus($id, $status){
		$query = "UPDATE `registration` set `status`=$status where `id`=$id";
		$query2 = "UPDATE `reserva` set `status_res`=$status where `nro`=$id";
		$this->dbc->query($query2);
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

	public function setSince($since){
					$this->since = $since;
				}

	public function getSince(){
					return $this->since;
				}

	public function setTo($to){
					$this->to = $to;
				}

	public function getTo(){
					return $this->to;
				}

	public function setDate($date){
					$this->date = $date;
				}

	public function getDate(){
					return $this->date;
				}

	public function setStatus($status){
					$this->status = $status;
				}

	public function getStatus(){
					return $this->status;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}

	public function setRoom_id($room_id){
					$this->room_id = $room_id;
				}

	public function getRoom_id(){
					return $this->room_id;
				}

	public function setUser_id($user_id){
					$this->user_id = $user_id;
				}

	public function getUser_id(){
					return $this->user_id;
				}
}
?>