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
            <li style="padding-left: 16px; color: green;"><b> OPCIONES DE ADMINISTRADOR</b></li>
            <li><a href="{link}admin"><i class="fa fa-edit"></i> Reservas Pendientes</a></li>
            <li><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
            <li  class="active"><a href="{link}admin/user"><i class="fa fa-users"></i> Usuarios</a></li>
            <li><a href="{link}admin/habitaciones"><i class="fa fa-building-o"></i> Habitaciones</a></li>
            <li><a href="{link}admin/reporte"><i class="fa fa-edit"></i> Reportes</a></li>
            <li><a href="{link}main/profile"><i class="fa fa-user"></i> Perfil</a></li>
            <li><a href="{link}login/logout"><i class="fa fa-power-off"></i> Log out</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Eco Hotel La Luna <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="fa fa-user"></i> Perfil</a></li>
                <li class="divider"></li>
                <li><a href="{link}login/logout"><i class="fa fa-power-off"></i> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

<div id="page-wrapper">

  <div class="row">
    <div class="col-lg-12">
      <h1><small class="titleSmall">Usuarios</small></h1>
      <div class="alert alert-success alert-dismissable" id="mensajeexitousuario">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <a class="alert-link" href="#"></a> Su usuario fue creado exitosamente. <a href="{link}admin/user">Volver</a>
      </div>
      <div class="alert alert-success alert-dismissable" id="usuariosAyuda">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <a class="alert-link" href="#"></a> Podrá gestionar la informacion de los usuarios.
      </div>
    </div>
  </div><!-- /.row -->
  
  <div id="usuariosCrear">
    <!--<div class="row" style="margin-bottom: 18px; margin-left: 0px;">
      
    </div>-->
    <div class="row">{errorMsj}</div>
    <div class="panel panel-primary col-lg-5">
      <div class="panel-body ">
        <button type="submit" id="botoncrearusuario" class="btn" style="margin-bottom: 18px;">Nuevo Usuario</button>
        <div style="display: none;" id="nuevousuario">
          <form role="form" action="{link}user/save" method="POST" style="width: 350px;">
              <fieldset>
                  <div class="form-group">
                      <label>Nombre </label>
                      <input class="form-control " required placeholder="Nombre" name="nombre" type="nombre" autofocus value="{nombre}"> 
                  </div>
                  <div class="form-group">
                      <label>Apellido</label>
                      <input class="form-control " required placeholder="Apellido" name="apellido" type="apellido" value="{apellido}">
                  </div>      
                  <div class="form-group">
                      <label> Email </label>
                      <input class="form-control " required placeholder="E-mail" name="email" type="email" value="{email}">
                  </div>
                  <div class="form-group">
                      <label> Contraseña </label>
                      <input class="form-control" required placeholder="Contraseña" name="password" type="password" value="">
                  </div>
                  <div class="form-group">
                      <label> Repetir la contraseña </label>
                      <input class="form-control"  required placeholder="Repita Contraseña" name="re-password" type="password" value="">
                  </div>
                  <div class="form-group">
                    <label>Tipo de usuario</label>
                    <select name="usertype" class="form-control">
                      <option value="2">Administrador</option>
                      <option value="1">Cliente</option>
                    </select>
                  </div>
                  <!-- Change this to a button or input when using this as a form -->
                  <button type="submit" class="btn" style="margin-bottom: 18px;">Guardar</button>
              </fieldset>
          </form>
        </div>
      </div>
    </div>
    <div class="row">
       <div class="col-lg-12">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list-ul"></i> Usuarios Activos</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped tablesorter">
                <thead>
                  <tr>              
                    <th>Apellido y Nombre</th>
                    <th>E-mail</th>
                    <th>Tipo de usuario</th>
                    <th>Última Actualización</th>
                  </tr>
                </thead>
                <tbody id="resultado">
                [lista]
                  <tr>
                    <td>{nombre}</td>
                    <td>{email}</td>
                    <td>{usertype}</td>
                    <td>{last_update}</td>
                  </tr>
                [lista]               
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div><!-- /.row -->

  </div>

</div><!-- /#page-wrapper -->
