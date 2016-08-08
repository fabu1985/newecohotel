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
            <li><a href="{link}main/reservar"><i class="fa fa-building-o"></i> Consultar Disponibilidad</a></li>
            <li class="active"><a href="{link}main/misreservas"><i class="fa fa-user"></i> Mis  Reservas</a></li>
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
            <div class="panel panel-success">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Reservas Activas</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped">
                    <thead>
                      <tr>
                        <th>N°</th>
                        <th>Habitacion</th>
                        <th>Check in</th>
                        <th>Check out</th>
                        <th>Total dias</th>
                        <th>Precio total</th>
                      </tr>
                    </thead>
                    <tbody id="resultado">
                      [listaActivas]
                      <tr>
                        <td>{nro}</td>
                        <td>{habitacion}</td>
                        <td>{check_in}</td>
                        <td>{check_out}</td>
                        <td>{total_dias}</td>
                        <td>${precio_total}</td>
                      </tr>
                      [listaActivas]
                  </table>
                </div>
            </div><!-- /.row -->                        
            </div>
            </div>
        </div>
        <div class="row">
           <div class="col-lg-9">
            <div class="panel panel-danger">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Reservas Pendientes</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>
                        <th>Ticket</th>
                        <th>N° Habitacion</th>
                        <th>Check in</th>
                        <th>Check out</th>
                        <th>Total</th>
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
                      </tr>
                      [listaPendientes]
                  </table>
                </div>
                <div class="alert alert-info">
                  <a href="#" class="close" data-dismiss="alert"></a>
                  <p><strong>IMPORTANTE!</strong><p><br/>Para que su reserva tenga validez, deberá abonar el monto correspondiente a la misma. Una vez realizado el pago, la Administración de Ecohotel La Luna realizar la activación dentro de las 24 hs.<br>
                  <br>En caso, de que en el transcurso de las 24 hs su reserva continúa pendiente o fue cancelada, por favor informar por mail a reservas@laluna.com o comunicarse a nuestros teléfonos.<br>
                  <p><br/>De no realizarse el pago la administración puede cancelar su reserva. Para pagar haga click <a href="https://www.mercadopago.com.ar/money-transfer" target="_blank">aquí</a>,</p>
              </div>
              <div class="alert alert-info">
                  <a href="#" class="close" data-dismiss="alert">&times;</a>
                  <strong>Para que podamos informarle personalmente el estado de su reserva y brindarle nuestro mejor servicio recuerde actualizar su información de contacto en la sección de <a href="{link}main/profile">perfil</a></strong>
              </div>
            </div><!-- /.row -->              
            </div>
            </div>
        </div>
        </div><!-- /.row -->
      </div><!-- /#page-wrapper -->