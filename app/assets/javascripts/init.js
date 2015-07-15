var isPfOnView = false;

var project = $("#pf");
if($("#pf").length > 0) {
	var pfHeight = [project.offset().top, project.offset().top + project.height()];	
}


(function($) {
	//fix na animacje loga w parze z .scss
	setTimeout(function(){ $('#banner').find('.inner').css('opacity', '1'); }, 500);

	//fix na pf
	$('#pf').find('.item').css('opacity', '0');

	skel
		.breakpoints({
			xlarge:	'(max-width: 1680px)',
			large:	'(max-width: 1280px)',
			medium:	'(max-width: 980px)',
			small:	'(max-width: 736px)',
			xsmall:	'(max-width: 480px)'
		});



	if($("#pf").length > 0 && $(window).scrollTop() > pfHeight[0] && $(window).scrollTop() < pfHeight[1]){
		doPfThings();
	}else{
		console.log('nie widać pf')
	}

	$(function() {

		var	$window = $(window),
			$body = $('body'),
			$wrapper = $('#page-wrapper'),
			$banner = $('#banner'),
			$header = $('#header');

		// Disable animations/transitions until the page has loaded.
			$body.addClass('is-loading');

			$window.on('load', function() {
				window.setTimeout(function() {
					$body.removeClass('is-loading');
				}, 100);
			});

		// Mobile?
			if (skel.vars.isMobile)
				$body.addClass('is-mobile');
			else
				skel
					.on('-medium !medium', function() {
						$body.removeClass('is-mobile');
					})
					.on('+medium', function() {
						$body.addClass('is-mobile');
					});

		// Scrolly.
			$('.scrolly')
				.scrolly({
					speed: 1500,
					offset: $header.outerHeight()
				});

		// Menu.
			var	$menu = $('#menu'),
				$menuClose = $('<a class="close">').appendTo($menu),
				$menuToggle = $('.menuToggle');

			// Move to end of body.
				$menu
					.appendTo($body);

			// Close.
				$menuClose
					.on('click touchend', function(event) {

						event.preventDefault();
						event.stopPropagation();

						$body.removeClass('is-menu-visible');

					});

			// Toggle.
				$menuToggle
					.on('click touchend', function(event) {

						event.preventDefault();
						event.stopPropagation();

						$body.toggleClass('is-menu-visible');

					});

				$(window).scroll(function(){
					event.preventDefault();
					event.stopPropagation();

					$body.removeClass('is-menu-visible');
				});

			// Wrapper.
				$wrapper
					.on('click touchend', function(event) {

						if ($body.hasClass('is-menu-visible')) {

							event.preventDefault();
							event.stopPropagation();

							$body.removeClass('is-menu-visible');

						}

					});
				$('#menu-cover').on('click touchend', function(event) {

					if ($body.hasClass('is-menu-visible')) {

						event.preventDefault();
						event.stopPropagation();

						$body.removeClass('is-menu-visible');

					}

				});

		// Header.
			if (skel.vars.IEVersion < 9)
				$header.removeClass('alt');

			if ($banner.length > 0
			&&	$header.hasClass('alt')) {

				$window.on('resize', function() { $window.trigger('scroll'); });

				$banner.scrollex({
					bottom:		$header.outerHeight() + 1,
					terminate:	function() { $header.removeClass('alt'); },
					enter:		function() { $header.addClass('alt'); },
					leave:		function() { $header.removeClass('alt'); }
				});

			}
	});

	$('#pf').find('.item').click(function (e) {
		$($(this).attr('data-for')).modal();
		return false;
	});

	$('#newses').find('.news-item').click(function (e) {
		$($(this).attr('data-for')).modal();
		return false;
	});

})(jQuery);



$(document).ready(function(){
	$(".owl-carousel.gallery").owlCarousel({
		loop:false,
		margin: 20,
		autoWidth:true
	});

	$(".owl-carousel.rotator").owlCarousel({
		loop:true,
		items: 1,
		autoplay: true,
		autoplayTimeout:3000,
		animateOut: 'fadeOut'
	});

	tinyMCE.init({
		selector: "textarea.tinymce",
		language: "pl",
		menubar: false,
		toolbar: "formatselect fontsizeselect | bold italic underline strikethrough |  alignleft aligncenter alignright alignjustify | undo redo | cut copy paste | bullist numlist blockquote | subscript superscript | link code",
		plugins: "link code"
	});

	$(".owl-carousel.rotator").find('.item').height($('.owl-carousel.rotator').height());

	$('#menu-cover').height($('#page-wrapper').height());

	google.maps.event.addDomListener(window, 'load', initializeIndexMap);

	if($(window).width() < 480){ // przepraszam ze tutaj :D
		$('#map-canvas-index').css("display", "none");
		$('#googleMapHrefButton').css("display", "block");
	}else{
		$('#map-canvas-index').css("display", "block");
		$('#googleMapHrefButton').css("display", "none");

	}

});

$(window).resize(function() {
	$(".owl-carousel.rotator").find('.item').height($('.owl-carousel'));

	if($(window).width() < 480){ // przepraszam ze tutaj :D
		$('#map-canvas-index').css("display", "none");
		$('#googleMapHrefButton').css("display", "block");
	}else{
		$('#map-canvas-index').css("display", "block");
		$('#googleMapHrefButton').css("display", "none");

	}
});

$(window).scroll(function(){
	if($("#pf").length > 0 && !isPfOnView && $(window).scrollTop() > pfHeight[0] && $(window).scrollTop() < pfHeight[1]){
		doPfThings();
	}
});

function doPfThings(){
	if(!isPfOnView && project && project.length != 0){
		console.log('do doPfThings function');
		$('#pf').find('.item').css('opacity', '1');
		project.gridalicious({
			gutter: 50,
			animate: true,
			animationOptions: {
				queue: true,
				speed: 200,
				duration: 300,
				effect: 'fadeInOnAppear'

			}
		});
	}
	isPfOnView = true;
}

function initializeIndexMap() {
	var mapCanvas = document.getElementById('map-canvas-index');
	var mapOptions = {
		center: new google.maps.LatLng(52.212970, 20.955412),
		zoom:13,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		scrollwheel: false
	};
	var map = new google.maps.Map(mapCanvas, mapOptions);

		var position = null;
		position = new google.maps.LatLng(52.212970, 20.955412);
		marker = new google.maps.Marker({
			position: position,
			map: map,
			animation: google.maps.Animation.DROP
		});


}

$(document).on('page:receive', function() {
	tinymce.remove();
});