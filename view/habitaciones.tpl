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
      <li style="padding-left: 16px; color: green;"><b> OPCIONES DE ADMINISTRADOR</b></li>
      <li><a href="{link}admin"><i class="fa fa-edit"></i> Reservas Pendientes</a></li>
      <li><a href="{link}admin/room"><i class="fa fa-building-o"></i> Gestión de Servicios</a></li>
      <li><a href="{link}admin/user"><i class="fa fa-users"></i> Usuarios</a></li>
      <li  class="active"><a href="{link}admin/habitaciones"><i class="fa fa-building-o"></i> Habitaciones</a></li>
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
            <h1><small class="titleSmall">Gestión de Habitaciones</small></h1>
          </div>
        </div>
      <div class="alert alert-success alert-dismissable" id="usuariosAyuda">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <a class="alert-link" href="#"></a> Podrá gestionar altas, bajas y modificaciones de habitaciones.
      </div><!-- /.row -->

  <!-- .row Título-->
        <!-- row Panel Gestion -->
        <br>
        <div class="row">
          <div class="col-lg-6">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Agregar Habitaciones</h3>
              </div>
              <div class="panel-body">
                <form role="form" action="{link}room/save" method="post">
                  <div class="row">
                    <fieldset>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <label> N° de Habitación </label>
                          <input class="form-control " required name="numero" type="numero" > 
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <label> Precio </label>
                          <input class="form-control " required name="precio" type="text"> 
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <label> Categoria </label>
                          <select class="form-control" required name="description">
                              <option></option>
                              [listaCateg]
                              <option value="{id}">{description}</option>
                              [listaCateg]
                          </select> 
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

          <div class="col-lg-6">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Editar Habitaciones</h3>
              </div>
              <div class="panel-body">
                <form role="form" action="{link}room/update" method="post">
                  <div class="row">
                    <fieldset>
                      <div class="col-lg-4">
                        <div class="form-group input-group">
                          <label> Número </label>
                          <select class="form-control" name="numero" id="room_numero">
                              <option></option>
                              [listanum]
                              <option value="{number}">{number}</option>
                              [listanum]
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <label> Precio </label>
                          <input class="form-control " required name="precio" type="text" id="room_price"> 
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group input-group">
                          <label> Categoria </label>
                          <select class="form-control" required name="description" id="room_description">
                              <option></option>
                              [listaCateg2]
                              <option value="{id}">{description}</option>
                              [listaCateg2]
                          </select> 
                        </div>
                      </div>
                    </fieldset>
                  </div>
                  <div class="row">
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
          </div><!-- Panel deshabilitar -->
        </div> 

        <!-- .row Panel Habitaicon Activas-->
        <div class="row">
          <div class="col-lg-12">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ul"></i> Listado de habitaciones</h3>
              </div>
              </fieldset>
              <div class="panel-body">
                <div class="col-lg-12">
                  <div class="form-group input-group">
                </div>
                </div>
              </fieldset>
                <div class="col-lg-12">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover table-striped tablesorter">
                    <thead>
                      <tr>              
                        <th>Número <i class="fa fa-sort"></i></th>
                        <th>Categoría <i class="fa fa-sort"></i></th>
                        <th>Precio por dia<i class="fa fa-sort"></i></th>
                        <th>Disponible <i class="fa fa-sort"></i></th>
                        <th>Última Actualización <i class="fa fa-sort"></i></th>
                      </tr>
                    </thead>
                    <tbody id="resultado">
                      [lista]
                      <tr id="room_{number}">
                        <td>{number}</td>
                        <td class="room_category">{category}</td>
                        <td class="room_price">${price}</td>
                        <td class="room_status">{status}</td>
                        <td>{last_update}</td>
                      </tr>
                      [lista]               
                    </tbody>
                  </table>
                </div> <!-- Fin de la tabla -->
              </div> <!-- Fin del panel boby -->
            </div>
          </div>
        </div><!-- /.row Panel Habitaciones-->

</div><!-- /#page-wrapper -->
