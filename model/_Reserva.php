<?php

Class _Reserva{
	private $dbc;
	private $nro;
	private $nombre;
	private $habitacion;
	private $checkIn;
	private $checkOut;
	private $precio;


	public function __construct(){
		$this->dbc = DB::Connect();
	}


	
	public function listar($estado=0, $desde='', $hasta=''){
			$query = 'SELECT 
				nro, 
				user_id, 
				(select 
					concat(u.first_name, \' \', u.last_name) 
				from user u 
				where u.id=r.user_id) nombre, 
				room_id, 
				habitacion, 
				estado, 
				check_in, 
				check_out, 
				precio, 
				DATEDIFF(check_out,check_in) as total_dias, 
				(c.price * DATEDIFF(check_out,check_in) * (IF(c.id = 1, 1, IF(c.id=2, 1.2, IF(c.id=3, 1.5, 1))))) as precio_total 
				FROM reserva r 
				INNER JOIN category c 
					on c.id=r.habitacion 
				where estado = '.$estado;
			if ($desde != '' && $hasta != ''){
				$whereDates = ' and check_in >= "'.$desde.'" and check_out <= "'.$hasta.'"';
				$query = $query.$whereDates;
			}
			$query = $query.' ORDER BY nro DESC';
			if ($result = $this->dbc->query($query)){
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function buscar($param){
			$query = 'SELECT nro, user_id, (select concat(u.first_name, \' \', u.last_name) from user u where u.id=r.user_id) nombre, 
room_id, habitacion, estado, check_in, check_out, precio, 
DATEDIFF(check_out,check_in) as total_dias, 
(c.price * DATEDIFF(check_out,check_in) * 
 (IF(c.id = 1, 1, IF(c.id=2, 1.2, IF(c.id=3, 1.5, 1))))
) as precio_total 
FROM reserva r INNER JOIN category c on c.id=r.habitacion where 
				nombre like \''.$param.'%\' 
				OR nombre like \'%, '.$param.'%\'
			ORDER BY nro DESC';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}


	public function ver($param=0){
			$query = "SELECT nro, user_id, (select concat(u.first_name, ' ', u.last_name) from user u where u.id=r.user_id) nombre, 
room_id, habitacion, estado, check_in, check_out, precio, 
DATEDIFF(check_out,check_in) as total_dias, 
(c.price * DATEDIFF(check_out,check_in) * 
 (IF(c.id = 1, 1, IF(c.id=2, 1.2, IF(c.id=3, 1.5, 1))))
) as precio_total 
FROM reserva r INNER JOIN category c on c.id=r.habitacion 
			WHERE  estado = $param
			AND user_id = ".SESSION::getvalue('userid');
			$result = $this->dbc->query($query);
		if ($result){
			return Ftn::toArray($result);
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function setNro($nro){
					$this->nro = $nro;
				}

	public function getNro(){
					return $this->nro;
				}

	public function setNombre($nombre){
					$this->nombre = $nombre;
				}

	public function getNombre(){
					return $this->nombre;
				}

	public function setHabitacion($habitacion){
					$this->habitacion = $habitacion;
				}

	public function getHabitacion(){
					return $this->habitacion;
				}

	public function setCheckIn($checkIn){
					$this->checkIn = $checkIn;
				}

	public function getCheckIn(){
					return $this->checkIn;
				}

	public function setCheckOut($checkOut){
					$this->checkOut = $checkOut;
				}

	public function getCheckOut(){
					return $this->checkOut;
				}

	public function setPrecio($precio){
					$this->precio = $precio;
				}

	public function getPrecio(){
					return $this->precio;
				}
}
?>