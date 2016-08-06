<?php 
class User{
	
	private $dbc;
	private $id;
	private $first_name;
	private $last_name;	
	private $email;
	private $address_id;
	private $active;
	private $create_date;
	private $last_update;
	private $usertype;


	public static function __autoload(){
		$dbc = 	DB::connect();
	}

	public static function init(){
		header("location: ".HOME);
	}

	public static function save(){
		$user = new _user();
		$error = 0;
		$errorMsj = "";
		if (!empty($_POST)){
			if (!form::validateEmail($_POST["email"])){
				$error = 1;
				$errorMsj .= "El E-mail ingresado es inválido.</br>";
			}else{
				$user->setEmail($_POST["email"]);
			}
			if (!form::validatePass($_POST["password"], $_POST["re-password"])){
				$error = 1;
				$errorMsj .= "El Password ingresado no coincide.</br>";
			}else{
				$user->setPassword(ftn::crypt($_POST["password"]));
			}
			if (strlen($_POST["apellido"])<2){
				$error = 1;
				$errorMsj .= "El Apellido ingresado no es válido<br/>";
			}else{
				$user->setLast_name($_POST["apellido"]);
			}
			if (strlen($_POST["nombre"])<2){
				$error = 1;
				$errorMsj .= "El Nombre ingresado no es válido<br/>";
			}else{
				$user->setFirst_name($_POST["nombre"]);
			}
			if ($error == 1){
				$errorMsj = "<div id='mensajeerror' class='alert alert-danger col-lg-9'>".
            					"<h4>".$errorMsj."</h4>".
        					"</div>";
				$data=array(
				"errorMsj" => $errorMsj,
				"nombre" => $_POST["nombre"],
				"apellido" => $_POST["apellido"],
				"email" => $_POST["email"]
				);
				if(session::getvalue('usertype') == 'admin'){
					view::parse("user", $data);
				}else{
					view::parse("login", $data);
				}
			}else{
				if(@$_POST["usertype"] == ''){
					$user->setUserType(1);
				}
				else {
					$user->setUserType($_POST["usertype"]);
				}
				if($user->save()){
					//User::sendEmailToUser($_POST["email"]);
				};
				$data=array(
				"errorMsj" => "<center><div class='alert alert-success col-lg-9' style='width: 100%;'>".
            					"<h3>Recibimos su solicitud de registro exitosamente.</h3>".
            					"<p>Le enviamos un email a <b>".$_POST["email"]."</b> para seguir con los pasos de la activacion de su cuenta.</p>".
        					"</div></center>"
				);
				if(@$_POST["usertype"] == ''){
					view::parse("login", $data);
				}
				else {
					view::parse("user", $data);
				}
			}
		}else{
			$data=array(
				"errorMsj" => "<div class='alert alert-danger col-lg-9'>".
            					"<h3>Debe completar el formulario para continuar</h3>".
        					"</div>"
			);
			
			
		}
	}

	public static function updatepass(){
		$user = new _user();
		if (!empty($_POST)){
			if (!form::validatePass($_POST["password"], $_POST["re-password"])){
				session::setvalue("mensaje", "<h4>El Password ingresado no coincide.</h4>");
			}else{
				$user->setPassword($_POST["password"]);
				$user->updatepass(session::getvalue('userid'));
				session::setvalue("mensaje", "<h4>Actualización Correcta.</h4>");
			}
		}
		header("location:".HOME."main/profile");
	}

	public static function updateAddress(){
		$address = new _address();
		if (isset($_POST) && !empty($_POST)){
				$ad=$_POST['address'];
				$ph=$_POST['phone'];
				$zi=$_POST['zip'];
				$dc=$_POST['district'];
				$cid=$_POST['city'];

				$address->updateaddress($ad,$ph,$zi,$dc,$cid); 
				session::setvalue("mensaje", "<h4>Actualización Correcta.</h4>");
			}else{
				session::setvalue("mensaje", "<h4>Error.</h4>");
			}
		header("location:".HOME."main/profile");
	}
}
?>