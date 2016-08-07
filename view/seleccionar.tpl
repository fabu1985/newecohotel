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
            <li class="active"><a href="{link}main/reservar"><i class="fa fa-building-o"></i> Consultar Disponibilidad</a></li>
            <li style="padding-left: 16px; color: green; {hideAdminOptions}"><b> OPCIONES DE ADMINISTRADOR</b></li>
            <li style="{hideAdminOptions}"><a href="{link}admin"><i class="fa fa-edit"></i> Reservas Pendientes</a></li>
            <li style="{hideAdminOptions}"><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
            <li><a href="{link}admin/user" style="{hideAdminOptions}"><i class="fa fa-users"></i> Usuarios</a></li>
            <li style="{hideAdminOptions}"><a href="{link}admin/habitaciones"><i class="fa fa-building-o"></i> Habitaciones</a></li>
            <li style="{hideAdminOptions}"><a href="{link}admin/reporte"><i class="fa fa-edit"></i> Reportes</a></li>
            <li><a href="{link}main/misreservas"><i class="fa fa-user"></i> Mis  Reservas</a></li>
            <li><a href="{link}main/profile"><i class="fa fa-user"></i> Perfil</a></li>
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
           <div class="col-lg-9">
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
                        <th>Confirma </th>
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
                          <td style="text-align:center;">
                            <i class="fa fa-thumbs-o-up savers" url="{link}reservar/confirmar" tag="{room_id}" habitacion="{nro}" precio="{precio_total}"></i>
                          </td>
                      </tr>
                      [listaHab]
                  </table>
                </div>
            </div>    
          </div>
        </div>
      </div><!-- /.row -->  
    </div><!-- /#page-wrapper -->