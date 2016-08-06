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
          <a class="navbar-brand" href="{link}">SAR - Eco Hotel La Luna</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="{link}main/reservar"><i class="fa fa-building-o"></i> Consultar Disponibilidad</a></li>
            <li style="padding-left: 16px; color: green;"><b>OPCIONES DE ADMINISTRADOR</b></li>
            <li  class="active"><a href="{link}admin"><i class="fa fa-edit"></i> Reservas Pendientes</a></li>
            <li><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
            <li><a href="{link}admin/user"><i class="fa fa-users"></i> Usuarios</a></li>
            <li><a href="{link}admin/habitaciones"><i class="fa fa-building-o"></i> Habitaciones</a></li>
            <li><a href="{link}admin/reporte"><i class="fa fa-edit"></i> Reportes</a></li>
            <li><a href="{link}main/profile"><i class="fa fa-user"></i> Perfil</a></li>
            <li><a href="{link}login/logout"><i class="fa fa-power-off"></i> Log out</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Eco Hotel La Luna {username}<b class="caret"></b></a>
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
            <h1><small class="titleSmall">Gestión de Reservas</small></h1>
          </div>
        </div><!-- /.row -->
        
        <div class="row">
           <div class="col-lg-12">
              <div class="alert alert-success">
                <a class="alert-link" href="#"></a> Ud. podrá gestionar la información de las reservas confirmadas y las pendientes de confirmación.
              </div>
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Reservas Pendientes</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>
                        <th>N° </th>
                        <th>N° Habitación </th>
                        <th>Check in </th>
                        <th>Check out </th>
                        <th>Total a Pagar</th>
                        <th>Confirmar <i class="fa "></i></th>
                      </tr>
                    </thead>
                    <tbody id="resultado">
                      [listaPendientes]
                      <tr>
                        <td>{nro}</td>
                        <td>{habitacion}</td>
                        <td>{check_in}</td>
                        <td>{check_out}</td>
                        <td>${precio}</td>
                        <td>
                          <a href="#">
                            <i class="fa fa-check-circle-o fa-1x col-lg-4 confirm" tag="{nro}"></i>
                          </a>
                          <a href="#">
                            <i class="fa fa-trash-o fa-1x col-lg-4 decline" tag="{nro}"></i>
                          </a>
                        </td>
                      </tr>
                      [listaPendientes]
                    </tbody>
                  </table>
                </div>
            </div><!-- /.row -->
            </div>
            </div>
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->