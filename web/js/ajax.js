$(function(){ 
	$("#what").keypress(function(e){
	    if(e.which == 13) {
	    	var data = 'data='+$('#what').val();
	        search(data);
	    }
	});

	$('#where li a').click(function(){
		var data = 'data='+$(this).attr("value");		
		search(data);
	});

	var search = function(data){
		var url =  'reserva/ajax/search/_'+$("#where").attr('tag')
        $.ajax({
            data:  data,
            url:   url,
            type:  'post',
            beforeSend: function(){

            },
            success:  function(response){
                    $("#resultado").html(response);
            }
    	});
	}

	$(".savers").on('click', function(){
		var roomId = $(".savers").attr('tag');
		if (confirm('Confirmar Reserva')){
			//var url =  'reservar/confirmar';
			var url = $(".savers").attr('url');
	        $.post(url, 
	        	{id: roomId,
	        	 habitacion: $(".savers").attr('habitacion'),
	        	 precio: $(".savers").attr('precio'),
	        	 since: $('#since'+roomId).text(),
	        	 to: $('#to'+roomId).text()
	            },
			    function(data,status){
			      //window.location.href = "main/misreservas";
			      var newurl = url.replace('reservar/confirmar','main/misreservas');
			      $(location).attr('href', newurl);
			    }
			);
	    }
	});

	$(".confirm").click(function(){
		var resNo = $(this).attr('tag');
		if (confirm('Reservar Habitación?')){
			var url =  'reservar/guardar';
	        $.post(url, 
	        	{id: resNo},
			    function(data,status){
			      location.reload();
			    }
			);
	    }
	});

	$(".decline").click(function(){
		var resNo = $(this).attr('tag');
		if (confirm('Declinar Reserva?')){
			var url =  'reservar/declinar';
	        $.post(url, 
	        	{id: resNo},
			    function(data,status){
			      location.reload();
			    }
			);
	    }
	});

	$(".declineservice").click(function(){
		var resNo = $(this).attr('tag');
		if (confirm('Eliminar Servicio?')){
			var url =  'eliminarServicio';
      $.post(url, 
        	{id: resNo},
		    function(data,status){
		      location.reload();
		    }
			);
	   }
	});
});