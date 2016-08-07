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
      <li><a href="{link}admin"><i class="fa fa-edit"></i> Reservas</a></li>
      <li><a href="{link}admin/room"><i class="fa fa-building-o"></i> Habitaciones</a></li>
      <li><a href="{link}admin/user"><i class="fa fa-users"></i> Usuarios</a></li>
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
      <h1><small>Precios</small></h1>
      <div class="alert alert-success">
        <a class="alert-link" href="#"></a> Ud tiene aquí la información necesaria en cuanto a los precios de sus Habitaciones.
      </div>
    </div>
  </div><!-- /.row -->

<!-- row Panel Gestion -->
  <div class="row">
    <div class="col-lg-6">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-list-ul"></i> Nueva Categorias</h3>
        </div>
        <div class="panel-body">
          <form role="form" action="{link}category/save" method="post">
            <div class="row">
              <fieldset>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label> Tipo de Habitación </label>
                    <input class="form-control " name="categoria" type="categoria" > 
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label> Precio </label>
                    <input class="form-control " name="precio" type="precio" > 
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

    <div class="col-lg-6">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-list-ul"></i> Editar Categorias</h3>
        </div>
        <div class="panel-body">
          <form role="form" action="{link}room/update_status" method="post">
            <div class="row">
              <fieldset>
                <div class="col-lg-6">
                  <div class="form-group input-group">
                    <label> Cetegoria </label>
                    <select class="form-control" name="categoria" required="">
                      <option></option>
                      <option value="1">Simple</option>
                      <option value="2">Doble Matrimonial</option>
                      <option value="3">Triple</option>
                      <option value="4">Cuadruple</option>
                    </select>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label> Precio </label>
                    <input class="form-control " name="precio" type="precio" > 
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
  <div class="row">
     <div class="col-lg-8">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-list-ul"></i> Precios Actuales </h3>
        </div>
        <div class="panel-body">
         <div class="col-lg-6">
          </div>  
          <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped tablesorter">
              <thead>
                <tr>              
                  <th>Categoría <i class="fa fa-sort"></i></th>
                  <th>Precio <i class="fa fa-sort"></i></th>
                  <th>Última Actualización <i class="fa fa-sort"></i></th>
                </tr>
              </thead>
              <tbody id="resultado">
              [lista]
                <tr>
                  <td>{description}</td>
                  <td>${price}</td>
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

</div><!-- /#page-wrapper -->
