(function($) {

	skel
		.breakpoints({
			xlarge:	'(max-width: 1680px)',
			large:	'(max-width: 1280px)',
			medium:	'(max-width: 980px)',
			small:	'(max-width: 736px)',
			xsmall:	'(max-width: 480px)'
		});

  var project = $("#pf");

	if(project && project.length != 0){
		project.gridalicious({
			gutter: 50,
			animate: true,
			animationOptions: {
				queue: true,
				speed: 200,
				duration: 300,
				effect: 'fadeInOnAppear',

			}
		});
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

			// Wrapper.
				$wrapper
					.on('click touchend', function(event) {

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

})(jQuery);

$(document).ready(function(){
	$(".owl-carousel.gallery").owlCarousel({
		autoPlay : 3000,
		loop:true,
    margin: 20,
    autoWidth:true
	});

	var startRotator = $(".owl-carousel.rotator").height($('#page-wrapper').height()).owlCarousel({
		loop:true,
		items: 1,
    autoplay:true,
    autoplayTimeout:6000,
    animateOut: 'fadeOut'
	});


	// Losowe tło przy odświerzaniu
	// var rotatorBgId = Math.floor(Math.random() * rotatorBg.length);
	// $('#page-wrapper').attr(
	// 	"style",
	// 	"background-image: -moz-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(" + rotatorBg[rotatorBgId] + "); background-image: -webkit-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(" + rotatorBg[rotatorBgId] + "); background-image: -ms-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(" + rotatorBg[rotatorBgId] + "); background-image: linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(" + rotatorBg[rotatorBgId] + ")"
 //  );

	// $('#page-wrapper').attr(
	// 	"style",
	// 	"background-image: -moz-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)); background-image: -webkit-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)); background-image: -ms-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)); background-image: linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5));"
	// );
});