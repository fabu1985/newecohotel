<?php 
class Reservar{
	public static function __autoload(){
		$dbc = 	DB::connect();
	}

	public static function createDB(){
		new ORM(DB::connect());
	}

	public static function init(){
		header("location: ".HOME."main/reservar");
	}

	public static function verDisponible_old(){
		if (!empty($_POST)){
			$room = new _room();
		    if($disp = $room->verDisponible($_POST["desde"], $_POST["hasta"], $_POST["categoria"] )){
		    	Session::setValue('hab', $disp);
		    	$_SESSION['res']['Desde']=$_POST["desde"];
		    	$_SESSION['res']['Hasta']=$_POST["hasta"];
		    //	echo var_dump($_SESSION['res']);
		    	header("location: ".HOME."reservar/seleccionar");
		    }else{
		    	$errorMsj = "<div class='alert alert-danger col-lg-9'>".
            					"<h4>No hay habitaciones disponibles para la fecha</h4>".
        					"</div>";
		    	Session::setvalue('errormsj', $errorMsj);
		    	header("location: ".HOME."main/reservar");	
		    }
		}else{
			header("location: ".HOME."main/reservar");
		}
	}

	public static function verDisponible(){
		if (!empty($_POST)){
			$since = $_POST["desde"];
			$to = $_POST["hasta"];
			$cat = $_POST["categoria"];
			$interval = Ftn::difDate($since, $to);
			$today = Ftn::difDate(date('Y-m-d'), $since);
			if($interval>0 && $interval<30 && $today>=0 && $today<=365){
				$room = new _room();
				$disp = $room->verDisponible($since, $to, $cat);
				if ($disp!==false){
					Session::setValue('hab', $disp);
			    	$_SESSION['res']['Desde']=$_POST["desde"];
			    	$_SESSION['res']['Hasta']=$_POST["hasta"];
			    	header("location: ".HOME."reservar/seleccionar");
				}else{
					$errorMsj = "<div class='alert alert-danger col-lg-12'>".
	            					"<p>No hay habitaciones disponibles para la fecha</p>".
	        					"</div>";
	        		if(session::getvalue("usertype")!="notlogin"){
						$data = array(
							"errormsj" => $errorMsj,
							"username" => session::getValue("username")
							);
						Session::setvalue('errormsj', $errorMsj);
			    		header("location: ".HOME."main/reservar");
			    	}else{	
						$data = array(
							"errormsj" => $errorMsj,
							"username" => session::getValue("username")
							);
			    		View::parse("disphome", $data);	
			    	}
			  	}

			}else{
				if($interval<=0){
					$errorMsj = "<div class='alert alert-danger col-lg-12'>
					<p><strong>La reserva no se pudo concretar por el siguiente 
								motivo:</strong></p>
					<ul>
						<li>Las fechas están invertidas</li>
					</ul>
  					</div>";
		    	Session::setvalue('errormsj', $errorMsj);
		    	header("location: ".HOME."main/reservar");}
		    else{		
	    		if($interval>30){
						$errorMsj = "<div class='alert alert-danger col-lg-12'>
						<p><strong>La reserva no se pudo concretar por el siguientes motivo:</strong></p>
						<ul>
							<li>La reserva no puede ser mayor a 30 días</li>
						</ul>
    					</div>";
			    	Session::setvalue('errormsj', $errorMsj);
			    	header("location: ".HOME."main/reservar");}
			    else{
			    	if($today<0){
							$errorMsj = "<div class='alert alert-danger col-lg-12'>
							<p><strong>La reserva no se pudo concretar por el siguientes motivo:</strong></p>
							<ul>
							<li>La fecha inicial es menor que la actual</li>
							</ul>
      					</div>";
				    	Session::setvalue('errormsj', $errorMsj);
				    	header("location: ".HOME."main/reservar");}
				    else{
				    	if($today>365){
								$errorMsj = "<div class='alert alert-danger col-lg-12'>
								<p><strong>La reserva no se pudo concretar por el siguientes motivo:</strong></p>
								<ul>
								<li>No puede efectuarse reservas con más de 1 año de anticipación</li>
								</ul>
        					</div>";
					    	Session::setvalue('errormsj', $errorMsj);
					    	header("location: ".HOME."main/reservar");}
							  }
					}
				}
			}
		}
		else{
			header("location: ".HOME."main/reservar");
		}
	}

	public static function seleccionar(){
		if (!empty($_SESSION['hab'])){

			$datetime1 = new DateTime($_SESSION['res']['Hasta']);
			$datetime2 = new DateTime($_SESSION['res']['Desde']);
			$interval = $datetime1->diff($datetime2);
			$total_dias = $interval->days;
			$coeficiente = 0;
			$categoriaHabitacion = $_SESSION['hab'][0]['categoria'];
			if($categoriaHabitacion == 'Single') {
				$coeficiente = 1;
			}
			else if($categoriaHabitacion == 'Double') {
				$coeficiente = 1.2;
			}
			else if($categoriaHabitacion == 'Triple') {
				$coeficiente = 1.5;
			}
			$precio_total = $total_dias * $_SESSION['hab'][0]['precio'] * $coeficiente; 
			$data=array(
				"username" => session::getValue("username"),
				'fechaDesde' => $_SESSION['res']['Desde'],
				'fechaHasta' => $_SESSION['res']['Hasta'],
				'listaHab'=> Session::getValue('hab'),
				'total_dias' => $total_dias,
				'precio_total' => $precio_total
			);
			if(session::getvalue("usertype")!="notlogin"){
				view::parse('seleccionar', $data);	
			}else{
				View::parse("disphome", $data);
			}
			Session::setValue('hab', '');
			Session::setValue('res', '');
		}else{
			header("location: ".HOME."main/reservar");
		}
	}

	public static function confirmar(){
		if (isset($_POST) && !empty($_POST['id'])){
			$reserva = new _registration();
			$reserva->setRoom_id($_POST['id']);
			$reserva->setSince($_POST['since']);
			$reserva->setto($_POST['to']);
			$reserva->habitacion = $_POST['habitacion'];
			$reserva->precio = $_POST['precio'];
			$reserva->save();
		}else{
		}
	}

	public static function guardar(){
		if (isset($_POST) && !empty($_POST['id'])){
			$reserva = new _registration();
			$reserva->updateStatus($_POST['id'], 1);
		}else{
		}
	}

	public static function declinar(){
		if (isset($_POST) && !empty($_POST['id'])){
			$reserva = new _registration();
			$reserva->updateStatus($_POST['id'], 2);
		}else{
		}
	}

}

 ?>