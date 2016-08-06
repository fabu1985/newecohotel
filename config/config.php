<?php 
$online = ($_SERVER['SERVER_NAME'] != "localhost") ? true : false;

if ($online)
	{
	
	define("HOST", "ecohotel.centuris.com.ar");
	define("SERVER_ROOT", $_SERVER['DOCUMENT_ROOT']);
	define("HOME", 'http://'.HOST."/");
	define("FILE_PATH",'http://'.HOST.'/web/uploads/');
	define("IMG",'http://'.HOST.'/web/images/');
	define("CSS", "http://".HOST."/web/css/");
	define("JS", "http://".HOST."/web/js/");
	define("LINK", "http://".HOST."/");
	define("CONT", 1);

	/*define("HOST", "http://ecohotel.centuris.com.ar/");
	define("SERVER_ROOT", $_SERVER['DOCUMENT_ROOT']);
	define("HOME", "");
	define("FILE_PATH",'');
	define("IMG_PATH",'');
	define("CSS", HOST."/web/css/");
	define("JS", HOST."/web/js/");
	define("LINK", HOST."");
	define("CONT", 1);*/

	define("DB_HOST", "localhost");
	define("DB_USER", "b9000080_eco");
	define("DB_PASS", "HotelEco123");
	define("DB_NAME", "b9000080_hotel");
	}	else 
	{
	define("HOST", "localhost/ecohotel");
	define("SERVER_ROOT", $_SERVER['DOCUMENT_ROOT'].'/ecohotel');
	define("HOME", 'http://'.HOST."/");
	define("FILE_PATH",'http://'.HOST.'/web/uploads/');
	define("IMG",'http://'.HOST.'/web/images/');
	define("CSS", "http://".HOST."/web/css/");
	define("JS", "http://".HOST."/web/js/");
	define("LINK", "http://".HOST."/");
	define("CONT", 2);

	define("DB_HOST", "localhost");
	define("DB_USER", "root");
	define("DB_PASS", "");
	define("DB_NAME", "reserva");
	}



define("CIFRADO", MCRYPT_RIJNDAEL_256);
define("MODO", MCRYPT_MODE_ECB);

define("CARPETA_ARCHIVO", SERVER_ROOT."/web/uploads/");

include ("db.php");
include ("includes.php");
?>