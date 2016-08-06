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
              <!--<button type="submit" class="btn btn-lg btn-success btn-block side-menu" data-toggle="modal" data-target="#contacto">Certificación LEED</button>  -->
              <a style="font-size: 12px;font-weight: normal !important;" href="{link}" class="btn btn-lg btn-success btn-block side-menu" >Home</a> 
            </div>
            </div>
            </div>
        </div>

      <div class="row">
          <h4>{errorMsj}</h4>
      </div>
      <div id="page-login">
        <div class="row">
            <div class="col-md-12">
            <div class="col-md-2"></div>    
            <div class="col-md-4">
                <div class="login-panel panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><b>Crear una cuenta</b></h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="{link}user/save" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <label> Ingrese su Nombre </label>
                                    <input class="form-control " placeholder="Nombre" name="nombre" type="nombre" autofocus> 
                                </div>
                                <div class="form-group">
                                    <label> Ingrese su Apellido</label>
                                    <input class="form-control " placeholder="Apellido" name="apellido" type="apellido">
                                </div>      
                                <div class="form-group">
                                    <label> Email </label>
                                    <input class="form-control " placeholder="E-mail" name="email" type="email">
                                </div>
                                <div class="form-group">
                                    <label> Cree una contraseña </label>
                                    <input class="form-control" placeholder="Contraseña" name="password" type="password">
                                </div>
                                <div class="form-group">
                                    <label> Repita la contraseña </label>
                                    <input class="form-control" placeholder="Repita Contraseña" name="re-password" type="password">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="terminos" type="checkbox" value="terminos">
                                        Acepto <a href="web\terminos.pdf" target="_blank">términos y condiciones</a>
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block">Registar</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4" >
                <div class="login-panel panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><b>Ingresa tus Datos</b></h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="{link}login/_login" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <label> Ingrese su e-mail </label>
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <label> Ingrese su contraseña </label>
                                    <input class="form-control" placeholder="Contraseña" name="password" type="password">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block">Ingresar</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
            </div>
        </div>

      </div><!-- /#page-wrapper -->