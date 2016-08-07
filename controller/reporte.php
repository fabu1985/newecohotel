<?php 

class Reporte{
	public static function __autoload(){
		$dbc = 	DB::connect();
	}

	public static function createDB(){
		new ORM(DB::connect());
	}

	public static function init(){
		header("location: ".HOME."main/reporte");
	}

	public static function consultar(){
		if (!empty($_POST)){
			$desde = $_POST["desde"];
			$hasta = $_POST["hasta"];
			$treporte = $_POST["treporte"];
			$interval = Ftn::difDate($desde, $hasta);
			if($interval>0){
				$sep = ';';
				$space = array('','','','','');
				$footerFile  = array(
					'Jefe de Reserva:', 
					session::getValue('username'),
					'Fecha:',
					date('d-m-Y',time()),
					);
				if($treporte == 1){
					$reserva = new _reserva();
					$listaActivas = $reserva->listar(1,$desde,$hasta);
					if(sizeof($listaActivas)>0){
						$data = array(
						"listaActivas" => $listaActivas
						);
						$headerFile  = array(
								'Nro_Habitación',
								'Check in',
								'Check out',
								'Total dias',
								'Precio total'
								);
						$fp = fopen('web/ReservasActivas.csv', 'w');
						fputcsv($fp,  $headerFile, $sep);
						foreach ($listaActivas as $list) {
							$linea  = array(
								$list['habitacion'],
								$list['check_in'],
								$list['check_out'],
								$list['total_dias'],
								$list['precio_total']
								);
						    fputcsv($fp,  $linea, $sep);
						}
						fputcsv($fp,  $space, $sep);
						fputcsv($fp,  $footerFile, $sep);
						fclose($fp);

						View::parse("reporte", $data);
					}else{
						$errorMsj = 
						"<div class='alert alert-danger col-lg-8'>
							<p>No se obtuvieron resultados para mostrar.</p>
						</div>";
			    		$data = array(
							"errormsj" => $errorMsj
							);
			    		View::parse("reporte",$data);
					}
				}else if($treporte == 2){
					$hab = new _room();
					$listaServicios = $hab->listaServicios($desde,$hasta);
					if(sizeof($listaServicios)>0){
						$data = array(
						"listaServicios" => $listaServicios
						);
						$fp = fopen('web/ConsumoDeServicios.csv', 'w');
						$headerFile  = array(
								'Nro_Habitación',
								'Servicio',
								'Precio',
								'Fecha'
								);
						fputcsv($fp,  $headerFile, $sep);
						foreach ($listaServicios  as $list) {
							$linea  = array(
								$list['habitacion'],
								$list['servicio'],
								$list['precio'],
								$list['fecha']
								);
							
						    fputcsv($fp,  $linea, $sep);			
						}
						fputcsv($fp,  $space, $sep);
						fputcsv($fp,  $footerFile, $sep);
						fclose($fp);
						View::parse("reporte", $data);
					}else{
						$errorMsj = 
						"<div class='alert alert-danger col-lg-8'>
							<p>No se obtuvieron resultados para mostrar.</p>
						</div>";
			    		$data = array(
							"errormsj" => $errorMsj
							);
			    		View::parse("reporte",$data);
					}
				}
			}else{
				$errorMsj = 
				"<div class='alert alert-danger col-lg-8'>
					<p><strong>La consulta no se pudo concretar por el siguiente motivo:</strong></p>
					<ul>
						<li>Las fechas están invertidas</li>
					</ul>
				</div>";
	    		$data = array(
					"errormsj" => $errorMsj
					);
	    		View::parse("reporte",$data);
			}
		}
		else{
			View::parse("reporte");
		}
	}	

}

 ?>