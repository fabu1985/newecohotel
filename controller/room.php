<?php 
class Room{
	public static function __autoload(){
		$dbc = 	DB::connect();
	}
	public static function init(){
		header("location: ".HOME);
	}
	private $dbc;
	private $id;
	private $first_name;
	private $last_name;
	private $email;
	private $address_id;
	private $active;
	private $create_date;
	private $last_update;
	
	public static function save(){
		$room = new _room();
		$error = 0;
		$errorMsj = "";
		if (!empty($_POST)){
			if (!form::validateInt($_POST["numero"])){
				$error = 1;
				$errorMsj .= "El número ingresado no es válido.</br>";
			}else{
				$room->setNumber($_POST["numero"]);
			}
			if ($_POST["description"]<1){
				$error = 1;
				$errorMsj .= "El tipo de habitación ingresado no es válido<br/>";
			}else{
				$room->setCategory_id($_POST["description"]);
			}
			$room->setPrice($_POST["precio"]);
			if ($error == 1){
				$errorMsj = "<div class='alert alert-danger col-lg-9'>".
				"<h4>".$errorMsj."</h4>".
				"</div>";
				$data=array(
					"errorMsj" => $errorMsj
					);
				view::parse("room", $data);
			}else{
				$room->save();
				header("location:".HOME."admin/habitaciones");
			}
		}else{
			$data=array(
				"errorMsj" => "<div class='alert alert-danger col-lg-9'>".
				"<h3>Debe ingresar el número y tipo de habitación</h3>".
				"</div>"
				);
			view::parse("room", $data);
		}
	}

	public static function saveservice(){
		$room = new _room();
		$room->saveservice(@$_POST["habitacion"], @$_POST["service"]);
		header("location:".HOME."admin/room");
	}

	public static function update(){
		$room = new _room();
		$error = 0;
		$errorMsj = "";
		if (!empty($_POST)){
			$pageServices = true;
			$room->setNumber($_POST["numero"]);
			if (isset($_POST["status"])) {
				$room->setStatus($_POST["status"]);
				$pageServices = true;
			}
			if(isset($_POST["description"])){
				$room->setCategory_id($_POST["description"]);	
				$pageServices = false;
			}
			if (isset($_POST["precio"])) {
				$room->setPrice($_POST["precio"]);
				$pageServices = false;
			}
			
			if ($error == 1){
				$errorMsj = "<div class='alert alert-danger col-lg-9'>".
				"<h4>".$errorMsj."</h4>".
				"</div>";
				$data=array(
					"errorMsj" => $errorMsj
					);
				view::parse("room", $data);
			}else{
				$room->update();
				if ($pageServices) {
					header("location:".HOME."admin/room");
				}else{
					header("location:".HOME."admin/habitaciones");
				}
				
			}
		}else{
			$data=array(
				"errorMsj" => "<div class='alert alert-danger col-lg-9'>".
				"<h3>Debe ingresar el número y tipo de habitación</h3>".
				"</div>"
				);
			view::parse("room", $data);
		}
	}

}
?>