// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap

//= require_tree .

$(function() {
	if ($('.decent').length > 0 ) {
		setTimeout(updateAnswers, 10000);
	}
});


// function updateAnswers() {
//	var question_id = $('h4').attr('data-id');
// 	$.getScript('set_active.js?question_id=' + question_id);
// 	setTimeout(updateAnswers, 5000);
// }


function updateAnswers() {
	var question_id = $('h4').attr('data-id');
	$.getScript('_get_nofa.js');
	setTimeout(updateAnswers, 5000);
}

