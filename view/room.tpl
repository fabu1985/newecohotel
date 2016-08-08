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
      <li  class="active"><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
      <li><a href="{link}admin/user"><i class="fa fa-users"></i> Usuarios</a></li>
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
            <h1><small class="titleSmall"><class="col-md-12">Gestión de Estado y Consumo de Habitaciones</small></h1>
           <!--h1><small>Habitaciones</small></h1-->
            <div class="alert alert-success">
              <a class="alert-link" href="#"></a> ESTADO DE HABITACIONES. Ud. podrá modificar el estado de una habitación, según corresponda.
            </div>
          </div>
        </div><!-- /.row -->
        <!-- row Panel Gestion -->
        <div class="row">
          <div class="col-lg-5">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Librar/Ocupar Habitaciones</h3>
              </div>
              <div class="panel-body">
                <form role="form" action="{link}room/update" method="post">
                  <div class="row">
                    <fieldset>
                      <div class="col-lg-6">
                        <div class="form-group input-group">
                          <label> Número </label>
                          <select required class="form-control" name="numero" id="room_numero">
                              <option></option>
                              [listanum]
                              <option value="{number}">{number}</option>
                              [listanum]
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group input-group">
                          <label> Disponibilidad </label>
                          <select class="form-control" name="status" id="room_status" required>
                              <option></option>
                              <option value="0">Libre</option>
                              <option value="1">Ocupada</option>
                          </select> 
                        </div>
                      </div>
                    </fieldset>
                  </div>
                    <div class="col-lg-6">
                      <button type="submit" class="btn btn-lg btn-primary btn-block">Guardar</button>
                    </div>
                    <div class="col-lg-6">
                      <button type="cancel" class="btn btn-lg btn-danger btn-block">Cancelar</button>
                    </div>
                  </div>                  
                </form>  
              </div>
            </div>
        <div class="col-lg-7">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Disponibilidad de Habitaciones</h3>
              </div>
              <div class="panel-body">
                <div class="col-lg-6">
                  <div class="form-group input-group">
                    <ul  id="where" class="dropdown-menu" role="menu" tag="room">
                      <li><a id="what" href="#" value="">Todas</a></li>
                      <li><a id="what" href="#" value="1">Single</a></li>
                      <li><a id="what" href="#" value="2">Double</a></li>
                      <li><a id="what" href="#" value="3">Triple</a></li>
                    </ul>
                  </div>
                </div>  
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>              
                        <th>Número </i></th>
                        <th>Categoría </i></th>
                        <th>Disponibilidad </i></th>
                      </tr>
                    </thead>
                    <tbody id="resultado">
                      [lista]
                      <tr id="room_{number}">
                        <td>{number}</td>
                        <td class="room_category">{category}</td>
                        <td class="room_status">{status}</td>
                      </tr>
                      [lista]               
                    </tbody>
                  </table>
                </div> <!-- Fin de la tabla -->
              </div> <!-- Fin del panel boby -->
            </div>
          </div>
        </div><!-- /.row Panel Habitaciones-->

        <div class="row">
          <div class="col-lg-12">
            <!--h1><small>Habitaciones</small></h1-->
            <div class="alert alert-success">
              <a class="alert-link" href="#"></a> REGISTRAR CONSUMOS. Ud. podrá registrar los consumos solicitados por nuestros húespedes.
            </div>
          </div>
        </div><!-- /.row -->        <!-- .row Título-->  
        <div class="row">
          <div class="col-lg-5">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Registrar Consumos por habitación</h3>
              </div>
              <div class="panel-body">
                <form role="form" action="{link}room/saveservice" method="post">
                  <div class="row">
                    <fieldset>
                      <div class="col-lg-3">
                        <div class="form-group">
                           <label> N° de Hab.</label>
                          <select class="form-control" name="room" required>
                              <option></option>
                              [listanum2]
                              <option value="{number}">{number}</option>
                              [listanum2]
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <label> Servicio </label>
                          <select class="form-control" name="service" required>
                            <option></option>
                            <option value="Wifi">Wifi</option>
                            <option value="Desayuno">Desayuno</option>
                            <option value="Almuerzo">Almuerzo</option>
                            <option value="Merienda">Merienda</option>
                            <option value="Cena">Cena</option>
                          </select>
                        </div>
                      </div>
                    </fieldset>
                  </div> <!-- /.row --> 
                  <div class="row">
                    <div class="col-lg-6">
                      <button type="submit" class="btn btn-lg btn-primary btn-block">Guardar</button>
                    </div>
                    <div class="col-lg-6">
                      <button type="submit" class="btn btn-lg btn-danger btn-block">Cancelar</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>  
          </div>

          <div class="col-lg-7">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Consumos por Habitación para la fecha actual</h3>
              </div>
              <div class="panel-body">
                <div class="col-lg-6">
                  <div class="form-group input-group">
                    <ul  id="where" class="dropdown-menu" role="menu" tag="room">
                      <li><a id="what" href="#" value="">Todas</a></li>
                      <li><a id="what" href="#" value="1">Single</a></li>
                      <li><a id="what" href="#" value="2">Double</a></li>
                      <li><a id="what" href="#" value="3">Triple</a></li>
                    </ul>
                  </div>
                </div>
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>              
                        <th>Habitacion </i></th>
                        <th>Servicio</i></th>
                        <th>Precio</i></th>
                        <th>Fecha </i></th>
                        <th>Eliminar <i class="fa "></i></th>
                     </tr>
                    </thead>
                    <tbody id="resultado">
                      [listaServiciosRegistrados]
                      <tr id="room_{number}">
                        <td>{room}</td>
                        <td>{service}</td>
                        <td>${priceservice}</td>
                        <td>{servicedate}</td>
                        <td>
                          <a href="#">
                            <i class="fa fa-trash-o fa-1x col-lg-4 declineservice" tag="{id}"></i>
                          </a>
                        </td>
                      </tr>
                      [listaServiciosRegistrados]               
                    </tbody>
                  </table>
                </div> <!-- Fin de la tabla -->
              </div>
            </div>
          </div><!-- Panel deshabilitar -->
        </div>

</div><!-- /#page-wrapper -->
