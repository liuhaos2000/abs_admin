function myalert(message,dom){
	$("#"+dom).append('<div class="alert alert-info my-alert">'+
			message+
			'</div>');
	setTimeout("$('.my-alert').remove()",1500);
	
}

function loadshow(path){
	$(document.body).append('<div class="zhezhao">'+
			'<div class="icon-center">'+
			'<img class="icon-spin" src="'+path+'/resources/images/loading.png">'+
			'</div>'+
			'</div>');
}

$(document).ready(function() {
	$(".zhezhao").remove();
});


