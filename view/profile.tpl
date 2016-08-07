<div id="wrapper">
<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index.html">SAR - Eco Hotel La Luna</a>
  </div>


        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li style="padding-left: 16px; color: green; {hideAdminOptions}"><b> OPCIONES DE ADMINISTRADOR</b></li>
            <li style="{hideAdminOptions}"><a href="{link}admin"><i class="fa fa-edit"></i> Reservas Pendientes</a></li>
            <li style="{hideAdminOptions}"><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
            <li><a href="{link}admin/user" style="{hideAdminOptions}"><i class="fa fa-users"></i> Usuarios</a></li>
            <li style="{hideAdminOptions}"><a href="{link}admin/habitaciones"><i class="fa fa-building-o"></i> Habitaciones</a></li>
            <li style="{hideAdminOptions}"><a href="{link}admin/reporte"><i class="fa fa-edit"></i> Reportes</a></li>
            <li class="active"><a href="{link}main/profile"><i class="fa fa-user"></i> Perfil</a></li>
            <li><a href="{link}login/logout"><i class="fa fa-power-off"></i> Log out</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {username} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="{link}main/profile"><i class="fa fa-user"></i> Perfil</a></li>
                <li class="divider"></li>
                <li><a href="{link}login/logout"><i class="fa fa-power-off"></i> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

      <div class="row"></div>

      <div id="page-wrapper">
        <div class="row">
            <div class="col-md-6">
                {mensaje}
                <div class="login-panel panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title">Informacion Personal</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="{link}user/updatepass" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <label> Apellido </label>
                                    <input class="form-control " name="nombre" type="nombre" value= "{last_name}" disabled> 
                                </div>
                                <div class="form-group">
                                    <label> Nombre </label>
                                    <input class="form-control " name="nombre" type="nombre" value= "{first_name}" disabled> 
                                </div>
                                <div class="form-group">
                                    <label> E-mail </label>
                                    <input class="form-control" id="disabledInput" name="email" type="email" value = "{email}" disabled>
                                </div>
                                <div class="form-group">
                                    <label> Contraseña </label>
                                    <input class="form-control" name="password" type="password" value="" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label> Repita Contraseña </label>
                                    <input class="form-control" name="re-password" type="password" value="" autocomplete="off">
                                </div>
                                <button type="submit" class="btn btn-lg btn-danger btn-block">Guardar Cambios</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="login-panel panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Informacion de Residencia</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="{link}user/updateaddress" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <label> Direccion </label>
                                    <input class="form-control " name="address" value ="{address}" autocomplete="off"> 
                                </div>
                                <div class="form-group">
                                    <label> Telefono </label>
                                    <input class="form-control " name="phone" value = "{phone}" autocomplete="off" > 
                                </div>
                                <div class="form-group">
                                    <label> Codigo Postal </label>
                                    <input class="form-control " name="zip" type="nombre" value = "{postal_code}" autocomplete="off"> 
                                </div>
                                <div class="form-group">
                                    <label> Localidad </label>
                                    <input class="form-control " name="district" type="nombre" value = "{district}" autocomplete="off"> 
                                </div>
                                <div class="form-group">
                                    <label> Provincia </label>
                                    <select class="form-control" name="city">
                                        <option value="{cityId}" style="font-weight:bold">
                                            {cityName}
                                        </option>
                                        <option disabled style="background-color:#EEE"></option>
                                        [listaProv]
                                        <option value="{city_id}">{city}</option>
                                        [listaProv]
                                    </select> 
                                </div>
                                <button type="submit" class="btn btn-lg btn-success btn-block">Guardar Cambios</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>  
        </div>

      </div><!-- /#page-wrapper -->