$(function() {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
$(function() {
    $(window).bind("load resize", function() {
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    });
    /* Creacion usuarios */
    var AdminFormularioCrearUsuario = function(){
    	var botonNuevoUsuario = '#botoncrearusuario';
	    var botonTituloDefecto = $(botonNuevoUsuario).text();
	    var nuevoUsuarioForm = '#nuevousuario';
	    $(botonNuevoUsuario).bind('click', function(){
	    	$(nuevoUsuarioForm).toggle();
	    	if($(nuevoUsuarioForm).is(":visible")){
	    		$(botonNuevoUsuario).text('Ocultar');
	    	}
	    	else {
	    		$(botonNuevoUsuario).text(botonTituloDefecto);
	    	}
	    });
    };
    var AdminCrearUsuarioMensajeExito = function(){
    	var msjId = '#mensajeexitousuario';
        var msjIdError = '#mensajeerror';
        if($(msjIdError).length==0){
            $(msjId).hide();
            var location = String(window.location);
            if(location.match(/user\/save/)){
                $(msjId).show();
                $('#usuariosCrear').hide();
                $('#usuariosAyuda').hide();
            }
        }else{
            $(msjId).hide();
            var nuevoUsuarioForm = '#nuevousuario';
            $(nuevoUsuarioForm).toggle();
        }
    };
    AdminCrearUsuarioMensajeExito();
    AdminFormularioCrearUsuario();
    /* Fin Creacion usuarios */

    /* Administracion de habitaciones */
    $('#room_numero').bind('change', function(){
        var roomNumber = $(this).val();
        var category = $('#room_' + roomNumber + ' .room_category').text();
        var price = $('#room_' + roomNumber + ' .room_price').text().replace('$', '');
        var status = $('#room_' + roomNumber + ' .room_status').text();
        var categoryId;
        var statusId;
        if(category == 'Single') categoryId = 1;
        if(category == 'Double') categoryId = 2;
        if(category == 'Triple') categoryId = 3;
        if(status == 'Libre') statusId = 0;
        if(status == 'Ocupada') statusId = 1;
        $('#room_description').val(categoryId);
        $('#room_price').val(price);
        $('#room_status').val(statusId);
    });
    /* Fin Administracion de habitaciones */
    $(window).load(function(){
        if(location1.match(/activar/)){
           $('#activationAccountModal').modal('show');
           $("#activationAccountModal").on("hidden.bs.modal", function () {
                window.location = "http://ecohotel.centuris.com.ar/";
           });
        }
    });
})
