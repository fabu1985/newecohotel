<?php 
class login{

	public static function __autoload(){
		
	}

	public static function init(){
		
	}

	public static function _login(){
		$errorMsj = "<div class='alert alert-danger col-lg-9'>".
            					"<h4>Datos Incorrectos. Por favor ingrese nuevamente o contacte al administrador. <a href='http://".HOST."'>Intentar nuevamente</a></h4>".
        					"</div>";
		if (!empty($_POST)){
			$user = new _user();
		    if ($user1 = $user->login($_POST['email'], $_POST["password"])){
		    	session::setvalue('username', $user1[0]["nombre"]);
		    	session::setvalue('userid', $user1[0]["id"]);
		    	if ($user1[0]["usertype"] != 2){
		    		session::setvalue('usertype', 'user');
		    		header("location: ".HOME."main/reservar");
		    	}else{
		    		session::setvalue('usertype', 'admin');
		    		header("location: ".HOME."admin");
		    	}
		    }
		    else{
		    	
		    	echo $errorMsj;
		    	
		    }
		} else {
			echo $errorMsj;
		}
	}
	
	public static function logout(){
		session_destroy();
		header("location: ".HOME);
	}


}

 ?>