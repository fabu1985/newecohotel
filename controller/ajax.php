<?php 
class Ajax{
	public static function __autoload(){
		$dbc = 	DB::connect();
	}

	public static function init(){
	
	}

	public static function search($class){
		if (isset($_POST) && !empty($_POST)){
			$object = new $class();
			$lista = $object->buscar($_POST['data']);
			echo ftn::intoTable($lista);
		}else{
			header("location:".HOME);
		}
	}
}
?>