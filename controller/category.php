<?php 
class Category{
	public static function __autoload(){
		$dbc = 	DB::connect();
	}
	public static function init(){
		header("location: ".HOME);
	}
	private $dbc;
	private $id;
	private $description;
	private $prize;
	private $last_update;
	
	public static function save(){
		$category = new _category();
		$error = 0;
		$errorMsj = "";
		if (!empty($_POST)){
			if (strlen($_POST["categoria"])<1){
				$error = 1;
				$errorMsj .= "El tipo de habitación ingresado no es válido<br/>";
			}else{
				$category->setDescription($_POST["categoria"]);
			}
			if (!form::validateInt($_POST["precio"])){
				$error = 1;
				$errorMsj .= "El número ingresado no es válido.</br>";
			}else{
				$category->setPrize($_POST["precio"]);
			}
			if ($error == 1){
				$errorMsj = "<div class='alert alert-danger col-lg-9'>".
				"<h4>".$errorMsj."</h4>".
				"</div>";
				$data=array(
					"errorMsj" => $errorMsj
					);
				view::parse("precios", $data);
			}else{
				$category->save();
				header("location:".HOME."admin/precios");
			}
		}else{
			$data=array(
				"username" => session::getValue("username"),
				"errorMsj" => "<div class='alert alert-danger col-lg-9'>".
				"<h3>Debe ingresar el número y tipo de habitación</h3>".
				"</div>"
				);
			view::parse("precios", $data);
		}
	}
	public static function update_status(){
		$room = new _room();
		$error = 0;
		$errorMsj = "";
		if (!empty($_POST)){
			$room->setStatus($_POST["status"]);
		}
		else {
			view::parse("room", $data);
		}
	}


}
?>