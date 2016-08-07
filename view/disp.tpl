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
            <li class="active"><a href="{link}main/reservar"><i class="fa fa-building-o"></i> Consultar Disponibilidad</a></li>
            <li><a href="{link}main/misreservas"><i class="fa fa-user"></i> Mis  Reservas</a></li>
            <li><a href="{link}login/logout"><i class="fa fa-power-off"></i> Log out</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {username}  <b class="caret"></b></a>
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
            {errormsj}
            <div class="col-md-5">
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

      </div><!-- /#page-wrapper -->