<?php 
class Main{
	public static function __autoload(){
		$dbc = 	DB::connect();
	}

	public static function createDB(){
		new ORM(DB::connect());
	}

	public static function init(){
		@$activationCode = split("=", $_SERVER['REQUEST_URI'])[1];
		if($activationCode != ""){
			$user = new _user();
			$user->activateAccount($activationCode);
		}
		//View::parse("login");
		session::setvalue("usertype","notlogin");
		View::parse("home");
	}

	public static function reservar(){
		$reserva = new _reserva();
		$hab = new _room();
		$mensaje = (isset($_SESSION["errormsj"])?session::getvalue('errormsj'):"");
		$data = array(
			"errormsj" => $mensaje,
			"username" => session::getValue("username")
			);
		if(session::getvalue("usertype")=="notlogin"){
			View::parse("disphome", $data);
		}else{
			View::parse("disp", $data);
		}
		session::setvalue("errormsj",null);
	}

	public static function Profile(){
		$user = new _user();
		$mensaje = (null!==(session::getvalue("mensaje")) ? session::getvalue("mensaje") : "");
		$lista = $user->ver(session::getValue("userid"));
		$city = new _city();
		$listaCity = $city->listar();
		$data = array(
			"mensaje" => $mensaje,
			"username" => session::getValue("username"),
			"last_name" => $lista[0]['last_name'],
			"first_name" => $lista[0]['first_name'],
			"address" => $lista[0]['address'],
			"district" => $lista[0]['district'],
			"phone" => $lista[0]['phone'],
			"email" => $lista[0]['email'],
			"cityId" => $lista[0]['city_id'],
			"cityName" => $lista[0]['city'],
			"postal_code" => $lista[0]['postal_code'],
			"listaProv" => $listaCity
			);
		session::setvalue("mensaje",null);
		View::parse("profile",$data);
	}

	public static function misreservas(){
		$reserva = new _Reserva();
		$listaActivas = $reserva->ver(1);
		$listaPendientes = $reserva->ver(0);
		$data = array(
			"listaActivas" => $listaActivas,
			"listaPendientes" => $listaPendientes,
			"username" => session::getValue("username")
		);
		View::parse("misreservas",$data);
	}

	public static function IrLogin(){
		@$activationCode = split("=", $_SERVER['REQUEST_URI'])[1];
		if($activationCode != ""){
			$user = new _user();
			$user->activateAccount($activationCode);
		}
		View::parse("login");
	}
}

 ?>