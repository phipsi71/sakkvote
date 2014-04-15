$(document).ready(function() {
	
	chnofa();

});


function chnofa() {

	var p = setTimeout("chnofa()", 3000);

	if ($('#nofa').length > 0){
		//location.reload();
		//$.get($('#nofa').data('url'));

		var p = $('#nofa').data('url');

//		$('#nofa').load($('#nofa').data('url'));

		$.ajax({
			url:  p,
			type: "GET",
			data: {"question_id" : "holdrio-value"},
			dataType: 'json',
			success: function(data){
				
				$('#nofa').html("<p>Number of Answers: " + JSON.stringify(data.active_question_count) + "</p>")
				console.log ("success from json: " + JSON.stringify(data.active_question_count))
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
			    console.log('XHR ERROR ' + XMLHttpRequest.status);
			    console.log('XHR RESPO ' + XMLHttpRequest.responseText);
			    //return XMLHttpRequest.responseText;
			}

		});
		console.log($('#nofa').data('url'));
	} else {
		clearTimeout(p);
	}		
};
