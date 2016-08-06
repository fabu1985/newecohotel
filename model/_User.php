<?php

Class _User{
	private $dbc;
	private $first_name;
	private $last_name;
	private $email;
	private $password;
	private $address_id;
	private $user_id;
	private $usertype;


	public function __construct(){
		$this->dbc = DB::Connect();
	}

	private function generateActivationCode($email){
		$key = md5(mt_rand(1000,999999).$email);
		return $key;
	}

	public function login($email, $pass){

		$query = 'SELECT CONCAT( last_name,  \', \', first_name ) AS  "nombre",
						usertype,
						id
					FROM user
					WHERE email =  "'.$email.'"
					AND PASSWORD =  "'.md5($pass).'" and activationcode="actived"
				';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				return $query;
			}
		}

	public static function sendEmailToUser($userEmail, $activationCode){
		$to = $userEmail;
		$subject = 'Bienvenido a Eco Hotel La Luna';
		$headers = "From: soporte@ecohotelluna.com \r\n";
		$headers .= "Reply-To: soporte@ecohotelluna.com \r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
		$message = '<html><body>';
		$message .= '<h1>Bienvenido a Eco Hotel la Luna</h1>';
		$message .= '<p>Gracias por registrarte. Para acceder a tu cuenta debes primero activar la cuenta, puedes hacerlo desde el siguiente enlace</p>';
		$message .= '<p><a href="http://ecohotel.centuris.com.ar/main/?activar='.$activationCode.'">http://ecohotel.centuris.com.ar/main/?activar='.$activationCode.'</a></p>';
		$message .= '<p>Disfrute de su estadia!</p>';
		$message .= '</body></html>';
		mail($to, $subject, $message, $headers);
	}

	public function save(){
		$activationCode = $this->generateActivationCode($this->email);
		$query = 'INSERT INTO user(
					first_name, 
					last_name, 
					email, 
					password, 
					usertype,
					activationcode,
					active) 
				  values (
					"'.$this->first_name.'", 
					"'.$this->last_name.'", 
					"'.$this->email.'", 
					"'.md5($this->password).'",
					"'.$this->usertype.'",
					"'.$activationCode.'",
					1)';
		if ($this->dbc->query($query)){
			$address = new _address();
			$id=$this->dbc->insert_id;
			if($address->save($id)){
				$this->sendEmailToUser($this->email, $activationCode);
				return true;
			}else{
				die('Error de Conexion con la DB. Intente de nuevo más tarde. 
					(Die funcioon Save user). Id: '.$id);	
			}
			
		}else{
			die('Error de Conexion con la DB. Intente de nuevo más tarde.'.$query);
		}
	}

	public function activateAccount($activationCode){
		$query =  'UPDATE `user` SET `activationcode`= "actived" 
		where `activationcode` = "'.$activationCode.'"';
		if ($this->dbc->query($query)){
		  $this->dbc->close();
		}else{
			
			die("Error");
		}
	}

	public function updatepass($id){
		$query =  'UPDATE `user` SET `password`= "'.md5($this->password).'" 
		where `id` = '.$id.'';
		if ($this->dbc->query($query)){
		  $this->dbc->close();
		}else{
			die('Error de Conexion con la DB: '.$query);
		}
	}

	public function listar(){
			$query = 'SELECT  concat(`cu`.`last_name`,\', \',`cu`.`first_name`) AS `nombre`,
							  `cu`.`email`,
							  `cu`.`last_update`,
							   case `cu`.`usertype` when 1 then \'Cliente\' else \'Administrador\' end usertype
					   FROM `user` `cu`';
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function buscar($param){
			$query = 'SELECT  concat(`cu`.`last_name`,\', \',`cu`.`first_name`) AS `nombre`,
							  `cu`.`email`,							  
							  `ad`.`address`,
							  `ad`.`phone`,
							  `ci`.`city`,
							  `co`.`country`,
							  `cu`.`last_update`
					   FROM (((`user` `cu` join `address` `ad`) join `city` `ci`) join `country` `co`) 
					   where ((`cu`.`address_id` = `ad`.`address_id`) 
					   	and (`ad`.`city_id` = `ci`.`city_id`) 
					   	and (`ci`.`city_id` = `co`.`country_id`) 
					   	and (`cu`.`active` = 1)) 
						and (`cu`.`last_name` like \''.$param.'%\'
						OR `cu`.`first_name` like \''.$param.'%\'  
						OR `cu`.`email` like \''.$param.'%\')
						order by nombre asc'; 
			if ($result = $this->dbc->query($query)){
				$this->dbc->close();
				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}

		}

	public function ver($id){
		$query = 'SELECT  `cu`.`last_name`,
						  `cu`.`first_name`,
						  `cu`.`email`,							  
						  `ad`.`address`,
						  `ad`.`district`,
						  `ad`.`phone`,
						  `ad`.`postal_code`,
						  `ci`.`city_id`,
						  `ci`.`city`,
						  `co`.`country`,
						  `cu`.`last_update`
					   FROM (((`user` `cu` join `address` `ad`) join `city` `ci`) join `country` `co`) 
					   where (('.$id.' = `ad`.`user_id`) 
					   	and (`ad`.`city_id` = `ci`.`city_id`) 
					   	and (`ci`.`country_id` = `co`.`country_id`) 
					   	and (`cu`.`active` = 1)
					   	and ('.$id.' = `cu`.`id`))';

$result = $this->dbc->query($query);
			if ($result){
				$this->dbc->close();

				return Ftn::toArray($result);
			}else{
				die('Error de Conexion con la DB: '.$query);
			}
		}

	public function setId($id){
					$this->id = $id;
				}

	public function getId(){
					return $this->id;
				}

	public function setFirst_name($first_name){
					$this->first_name = $first_name;
				}

	public function getFirst_name(){
					return $this->first_name;
				}

	public function setLast_name($last_name){
					$this->last_name = $last_name;
				}

	public function getLast_name(){
					return $this->last_name;
				}

	public function setEmail($email){
					$this->email = $email;
				}

	public function getEmail(){
					return $this->email;
				}

	public function setPassword($password){
					$this->password = $_POST['password'];
				}

	public function getPassword(){
					return $this->password;
				}

	public function setActive($active){
					$this->active = $active;
				}

	public function getActive(){
					return $this->active;
				}

	public function setCreate_date($create_date){
					$this->create_date = $create_date;
				}
	public function setUserType($usertype) {
		$this->usertype = $usertype;
	}

	public function getCreate_date(){
					return $this->create_date;
				}

	public function setLast_update($last_update){
					$this->last_update = $last_update;
				}

	public function getLast_update(){
					return $this->last_update;
				}

	public function setAddress_id($address_id){
					$this->address_id = $address_id;
				}

	public function getAddress_id(){
					return $this->address_id;
				}
}
?>