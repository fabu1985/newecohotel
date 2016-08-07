<?php
class Admin{
	public static function __autoload(){
		$dbc = 	DB::connect();

	}

	public static function createDB(){
		new ORM(DB::connect());
	}

	public static function init(){
		if(session::isAdmin()){
			$reserva = new _reserva();
			$hab = new _room();

			$singleFree = $hab->free(1);
			$doubleFree = $hab->free(2);
			$tripleFree = $hab->free(3);
			$totalFree = $hab->totalFree();

			$listaPendientes = $reserva->listar(0);
			$listaActivas = $reserva->listar(1);

			$listaServicios = $hab->listaServicios();
			
			$data = array(
				"listaPendientes" => $listaPendientes,
				"listaActivas" => $listaActivas,
				"totalFree" => $totalFree[0]['total'],
				"singleFree" => $singleFree[0]['total'],
				"doubleFree" => $doubleFree[0]['total'],
				"tripleFree" => $tripleFree[0]['total'],
				);
			View::parse("admin", $data);
		}else{
			header("location: ".HOME);
		}
		
	}

	public static function User($param){
		if(session::isAdmin()){
			$user = new _user();
			$lista = $user->listar($param);
			$data = array(
				"lista" => $lista,
				);
			View::parse("user", $data);
		}else{
			header("location: ".HOME);
		}
	}

	public static function Room(){
		if(session::isAdmin()){
			$room = new _room();
			$lista = $room->buscar();
			$listaServicios = $room->listaServicios();
			$listaServiciosRegistrados = $room->listaServiciosRegistrados();
			$category = new _category();
			$category2 = new _category();
			$numero = new _room();
		    $listaCat = $category->listar();
		    $listaCat2 = $category2->listar();
		    $listanum = $numero->vernum();
			$data = array(
				"lista" => $lista,
				"listaServicios" => $listaServicios,
				"listaServiciosRegistrados" => $listaServiciosRegistrados,
				"listaCateg" => $listaCat,
				"listaCateg2" => $listaCat2,
				"listanum" => $listanum,
				"listanum2" => $listanum,
			);
			View::parse("room", $data);
		}else{
			header("location: ".HOME);
		}
	}
	
	public static function Precios(){
		if(session::isAdmin()){
			$precio = new _category();
			$lista = $precio->listar();
			$data = array(
				"lista" => $lista,
			);
			View::parse("precios", $data);
		}else{
			header("location: ".HOME);
		}
	}

	public static function Habitaciones(){
		if(session::isAdmin()){
			$room = new _room();
			$lista = $room->buscar();
			$listaServicios = $room->listaServicios();
			$listaServiciosRegistrados = $room->listaServiciosRegistrados();
			$category = new _category();
			$category2 = new _category();
			$numero = new _room();
		    $listaCat = $category->listar();
		    $listaCat2 = $category2->listar();
		    $listanum = $numero->vernum();
			$data = array(
				"lista" => $lista,
				"listaServicios" => $listaServicios,
				"listaServiciosRegistrados" => $listaServiciosRegistrados,
				"listaCateg" => $listaCat,
				"listaCateg2" => $listaCat2,
				"listanum" => $listanum,
				"listanum2" => $listanum,
			);
			View::parse("habitaciones", $data);
		}else{
			header("location: ".HOME);
		}	
	}

	public static function Reporte(){
		if(session::isAdmin()){
			$primersemestre = new GoogChart();
			$segundosemestre = new GoogChart();
			$color = array(
				'#dcdf12',
				'#99C754',
				'#54C7C5',
				'#999999',
				'#0c0b0b'
			);
			$room = new _room();
			$arrayDatos = $room->obtenerDatosGrafica();

			$dataMultiple1 = array( 
				'WIFI' => array_slice($arrayDatos[0], 0 , 6),
				'Desayuno' => array_slice($arrayDatos[1], 0 , 6),
				'Almuerzo' => array_slice($arrayDatos[2], 0 , 6),
				'Merienda' => array_slice($arrayDatos[3], 0 , 6),
				'Cena' => array_slice($arrayDatos[4], 0 , 6)
			);

			$primersemestre->setChartAttrs( array(
				'type' => 'bar-vertical',
				'title' => 'Primer Semestre',
				'data' => $dataMultiple1,
				'size' => array( 950, 200 ),
				'color' => $color,
				'labelsXY' => true,
				));

			$dataMultiple2 = array( 
				'WIFI' => array_slice($arrayDatos[0], 6),
				'Desayuno' => array_slice($arrayDatos[1], 6),
				'Almuerzo' => array_slice($arrayDatos[2], 6),
				'Merienda' => array_slice($arrayDatos[3], 6),
				'Cena' => array_slice($arrayDatos[4], 6)
			);

			/* # Chart 2 # */
			$segundosemestre->setChartAttrs( array(
				'type' => 'bar-vertical',
				'title' => 'Segundo Semestre',
				'data' => $dataMultiple2,
				'size' => array( 950, 200 ),
				'color' => $color,
				'labelsXY' => true,
				));
			
			$data = array(
				"titulo" => '<br><h1><small class="titleSmall">Estadística de consumos del año actual</small></h1>',
				"primersemestre" => $primersemestre,
				"segundosemestre" => $segundosemestre
			);
			View::parse("reporte",$data);
		}else{
			header("location: ".HOME);
		}	
	}

	public static function eliminarServicio(){
		if (isset($_POST) && !empty($_POST['id'])){
			$servicio = new _room();
			$servicio->deleteService($_POST['id']);
		}else{
		}
	}
}

 ?>