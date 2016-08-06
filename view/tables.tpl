<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SAR - Eco Hotel La Luna</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
  </head>

  <body>

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
          <a class="navbar-brand" href="index.html">SAR - Hotel La Luna</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li class="active"><a href="index.html"><i class="fa fa-Reservas"></i> Reservas</a></li>
            <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i> Habitaciones</a></li>
            <li><a href="forms.html"><i class="fa fa-edit"></i> Clientes</a></li>
            <li><a href="forms.html"><i class="fa fa-power-off"></i> Log out</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown messages-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Mensajes <span class="badge">7</span> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">7 Mensajes Nuevos</li>
                <li class="message-preview">
                  <a href="#">
                    <span class="avatar"><img src="http://placehold.it/50x50"></span>
                    <span class="name">Hotel Luna:</span>
                    <span class="message">Hola Buenas tardes, Quisiera averiguar el precio...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li class="message-preview">
                  <a href="#">
                    <span class="avatar"><img src="http://placehold.it/50x50"></span>
                    <span class="name">Hotel Luna:</span>
                    <span class="message">Hola Buenas tardes, Quisiera averiguar el precio...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li class="message-preview">
                  <a href="#">
                    <span class="avatar"><img src="http://placehold.it/50x50"></span>
                    <span class="name">Hotel Luna:</span>
                    <span class="message">Hola Buenas tardes, Quisiera averiguar el precio...</span>
                    <span class="time"><i class="fa fa-clock-o"></i> 4:34 PM</span>
                  </a>
                </li>
                <li class="divider"></li>
                <li><a href="#">Ver Bandeja <span class="badge">7</span></a></li>
              </ul>
            </li>
            <li class="dropdown alerts-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> Avisos <span class="badge">3</span> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Consultas <span class="label label-default">Consultas</span></a></li>
                <li><a href="#">Reservas <span class="label label-primary">Reservas</span></a></li>
                <li><a href="#">Pagos Acreditados <span class="label label-success">Pagos</span></a></li>
                <li><a href="#">Informaci&oacute;n <span class="label label-info">Info</span></a></li>
                <li><a href="#">Clientes <span class="label label-warning">Clientes</span></a></li>
                <li><a href="#">Importante! <span class="label label-danger">Importante!</span></a></li>
                <li class="divider"></li>
                <li><a href="#">Ver todos</a></li>
              </ul>
            </li>
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Hotel Luna <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="fa fa-user"></i> Perfil</a></li>
                <li><a href="#"><i class="fa fa-envelope"></i> Mensajes<span class="badge">7</span></a></li>
                <li><a href="#"><i class="fa fa-gear"></i> Configuraci&oacute;n</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <h1>Habitaciones <small>Precios y Categorias</small></h1>
            <ol class="breadcrumb">
              <li><a href="index.html"><i class="fa fa-dashboard"></i> Reservas</a></li>
              <li class="active"><i class="fa fa-table"></i> Habitaciones</li>
            </ol>
            <div class="alert alert-info alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <a class="alert-link" href="">Informaci&oacute;n</a> Ingrese aqui toda la informaci&oacute;n necesaria de las habitaciones del Hotel.
            </div>
          </div>
        </div><!-- /.row -->

        <div class="row">
          <div class="col-lg-6">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-money"></i> Lista de Habitaciones</h3>
              </div>
              <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped tablesorter">
                <thead>
                  <tr>
                    <th>N&uacute;mero <i class="fa fa-sort"></i></th>
                    <th>Categor&iacute;a <i class="fa fa-sort"></i></th>
                    <th>Disponibilidad <i class="fa fa-sort"></i></th>
                    <th>Precios <i class="fa fa-sort"></i></th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="active">
                    <td>001</td>
                    <td>Doble Individual</td>
                    <td>5</td>
                    <td>$321.33</td>
                  </tr>
                  <tr class="success">
                    <td>002</td>
                    <td>Doble Matrimonial</td>
                    <td>10</td>
                    <td>$234.12</td>
                  </tr>
                  <tr class="warning">
                    <td>003</td>
                    <td>Triple</td>
                    <td>5</td>
                    <td>$416.34</td>
                  </tr>
                  <tr class="danger">
                    <td>004</td>
                    <td>Cuadruple</td>
                    <td>3</td>
                    <td>$644.43</td>
                  </tr>
               
                </tbody>
              </table>
            </div>
          </div>
          
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

    <!-- Page Specific Plugins -->
    <script src="js/tablesorter/jquery.tablesorter.js"></script>
    <script src="js/tablesorter/tables.js"></script>

  </body>
</html>