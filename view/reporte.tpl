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
            <li style="padding-left: 16px; color: green;"><b>OPCIONES DE ADMINISTRADOR</b></li>
            <li><a href="{link}admin"><i class="fa fa-edit"></i> Reservas Pendientes</a></li>
            <li><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
            <li><a href="{link}admin/user"><i class="fa fa-users"></i> Usuarios</a></li>
            <li><a href="{link}admin/habitaciones"><i class="fa fa-building-o"></i> Habitaciones</a></li>
            <li class="active"><a href="{link}admin/reporte"><i class="fa fa-edit"></i> Reportes</a></li>
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
    <div style="width: 730px;  font-family:sans-serif;">
      {titulo}
      {primersemestre}
      <br><br>
      {segundosemestre}
    </div>
        <div class="row">
          <div class="col-lg-12">
            <h1><small class="titleSmall">Gestión de Reportes</small></h1>
          </div>
        </div><!-- /.row -->

        <div class="row">{errormsj}</div>
        <div class="row">
           <div class="col-lg-4">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Reportes</h3>
              </div>
              <div class="panel-body">
                <div>
                  <form role="form" action="{link}reporte/consultar" method="post">
                    <fieldset>
                      <div class="form-group">
                        <label>Fecha desde </label>
                        <input class="form-control" name="desde" type="date" autofocus required/>
                      </div>
                      <div class="form-group">
                        <label>Fecha hasta </label>
                        <input class="form-control" name="hasta" type="date" required/>
                      </div>
                      <div class="form-group">
                        <label>Tipo de Reporte</label>
                        <select class="form-control" name="treporte" required>
                          <option></option>
                          <option value="1">Reservas Activas</option>
                          <option value="2">Consumos</option>
                        </select>
                      </div>
                      <button type="submit" class="btn btn-lg btn-primary btn-block">Buscar</a>
                    </fieldset>
                  </form>
                </div>
              </div><!-- /.row -->
            </div>
          </div>
        <div class="row">
          <div class="col-lg-6">
          <div class="panel panel-success">
            <div class="panel-heading">
              <h3 class="panel-title"><i class="fa fa-list-ul"></i>Reservas Activas</h3>
            </div>
            <div class="panel-body">
              <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                  <thead>
                    <tr>
                      <th>N° Hab.</th>
                      <th>Check in</th>
                      <th>Check out</th>
                      <th>Total días</th>
                      <th>Precio total</th>
                    </tr>
                  </thead>
                  <tbody id="resultadoRA">
                    [listaActivas]
                    <tr>
                      <td>{habitacion}</td>
                      <td>{check_in}</td>
                      <td>{check_out}</td>
                      <td>{total_dias}</td>
                      <td>{precio_total}</td>
                    </tr>
                    [listaActivas]
                  </tdoby>
                </table>
                <a href="{link}web\ReservasActivas.csv" target="_blank"> Descargar</a>&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
          </div><!-- /.row -->
        </div>
        
        <div class="row">
          <div class="col-lg-9">
          <div class="panel panel-success">
            <div class="panel-heading">
              <h3 class="panel-title"><i class="fa fa-list-ul"></i>Consumos</h3>
            </div>
            <div class="panel-body">
              <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                  <thead>
                    <tr>
                      <th>Habitacion</th>
                      <th>Servicio</th>
                      <th>Precio</th>
                      <th>Fecha</th>
                    </tr>
                  </thead>
                  <tbody id="resultadoC">
                    [listaServicios]
                    <tr>
                      <td>{habitacion}</td>
                      <td>{servicio}</td>
                      <td>{precio}</td>
                      <td>{fecha}</td>
                    </tr>
                    [listaServicios]
                  </tdoby>
                </table>
              <a href="{link}web\ConsumoDeServicios.csv" target="_blank"> Descargar</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
          </div><!-- /.row -->
  