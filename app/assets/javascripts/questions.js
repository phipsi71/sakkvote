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
	$.getScript('./_get_nofa.js');
	setTimeout(updateAnswers, 5000);
}
