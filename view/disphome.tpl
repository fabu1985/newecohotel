       <div id="wrapper2">
      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <a class="navbar-brand" href="{link}">SAR - Eco Hotel La Luna</a>
        </div>
     
      </nav>
      <br><br>
        <div class="row">
            <div class="col-md-12">
            <div class="col-md-1"></div>  
            <div class="col-md-10">
            <div class="col-md-2" >
              <button type="submit" class="btn btn-lg btn-success btn-block side-menu" data-toggle="modal" data-target="#quienessomos">Quiénes Somos</button>  
            </div>
             <div class="col-md-2">
               <button type="submit" class="btn btn-lg btn-success btn-block side-menu" data-toggle="modal" data-target="#ubicacion">Ubicación</button> 
            </div>
            <div class="col-md-2" >
              <button type="submit" class="btn btn-lg btn-success btn-block side-menu" data-toggle="modal" data-target="#servicios">Servicios</button>  
            </div>
             <div class="col-md-2">
               <button type="submit" class="btn btn-lg btn-success btn-block side-menu" data-toggle="modal" data-target="#mision">Misión y Visión</button>
            </div>
            <div class="col-md-2">
               <a style="font-size: 12px;font-weight: normal !important;" href="{link}main/reservar" class="btn btn-lg btn-success btn-block side-menu" >Consultar Disponibilidad</a> 
            </div>
            <div class="col-md-2" >
              <a style="font-size: 12px;font-weight: normal !important;" href="{link}main/IrLogin" class="btn btn-lg btn-success btn-block side-menu" >Iniciar Sesión</a> 
            </div>
            </div>
            <div class="col-md-1"></div>
            </div>
        </div>



      <div class="row">
          <h4>{errorMsj}</h4>
      </div>
      <div id="page-login">
        <div class="row">
            <div class="col-md-12">
            <div class="col-md-1"></div> 
            <div class="col-md-4">
                <div class="row">
		            {errormsj}
		            <div class="col-md-">
		                <div class="login-panel panel panel-primary">
		                    <div class="panel-heading">
		                        <h3 class="panel-title">Consultar Disponibilidad </h3>
		                    </div>
		                    <div class="panel-body">
		                        <form role="form" action="{link}reservar/verdisponible" method="post">
		                            <fieldset>
		                                <div class="form-group">
		                                    <label>Fecha desde </label>
		                                    <input class="form-control" name="desde" type="date" autofocus required>
		                                </div>
		                                <div class="form-group">
		                                    <label>Fecha hasta </label>
		                                    <input class="form-control" name="hasta" type="date" required>
		                                </div>
		                                <div class="form-group">
		                                    <label>Tipo de Habitación </label>
		                                    <select class="form-control" name="categoria" required>
		                                                <option></option>
		                                                <option value="1">Simple</option>
		                                                <option value="2">Doble</option>
		                                                <option value="3">Triple</option>
		                                    </select>
		                                </div>
		                                <button type="submit" class="btn btn-lg btn-primary btn-block">Buscar</a>
		                            </fieldset>
		                        </form>
		                    </div>
		                </div>

		            </div>  
		        </div>    
            </div>
            <div class="col-md-6" >
                <div>
		            <div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-list-ul"></i>  Seleccionar Habitación</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
							  <table class="table table-bordered table-hover">
							    <thead>
							      <tr>
							        <th>N° </th>
							        <th>Categoría </th>
							        <th>Check in </th>
							        <th>Check out </th>
							        <th>Cantidad de dias</th>
							        <th>Precio total</th>
							      </tr>
							    </thead>
							    <tbody id="resultado">
							      [listaHab]
							      <tr>
							          <td>{nro}</td>
							          <td>{categoria}</td>
							          <td id="since{room_id}">{fechaDesde}</td>
							          <td id="to{room_id}">{fechaHasta}</td>
							          <td>{total_dias}</td>
							          <td>${precio_total}</td>
							      </tr>
							      [listaHab]
							  </table>
							</div>
						</div>    
		          </div>
            </div>
            <div class="col-md-1"></div>
            </div>
        </div>
        

      </div><!-- /#page-wrapper -->