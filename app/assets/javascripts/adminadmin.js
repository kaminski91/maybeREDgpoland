$(document).ready(function(){

	// Main page admin
	var adminHeight = 0;
	$('.menu-item').each(function() {
		adminHeight += $(this).height();
	});

	$('#adminMain').css({
		"min-height": adminHeight + "px"
	});

	// Tiny MCE
	tinyMCE.init({
		selector: "textarea.tinymce",
		language: "pl",
		menubar: false,
		toolbar: "formatselect fontsizeselect | bold italic underline strikethrough |  alignleft aligncenter alignright alignjustify | undo redo | cut copy paste | bullist numlist blockquote | subscript superscript | link code",
		plugins: "link code"
	});

});

$(document).on('page:receive', function() {
	tinymce.remove();
});