angular.module('postback', ['ngRoute', 'ngResource']).config(function($routeProvider){
	
	$routeProvider.when('/', {
		templateUrl: 'partials/home.html',
		controller: 'HomeController'
	});

	$routeProvider.when('/quadros', {
		templateUrl: 'partials/quadros.html',
		controller: 'QuadrosController'
	});

	$routeProvider.when('/quadros/:quadroId', {
		templateUrl: 'partials/quadro.html',
		controller: 'QuadroController'
	});

	$routeProvider.when('/feedback/:quadroId', {
		templateUrl: 'partials/feedback.html',
		controller: 'FeedbackController'
	});

	$routeProvider.when('/aviso/:quadroId', {
		templateUrl: 'partials/aviso.html',
		controller: 'AvisoController'
	});

	$routeProvider.when('/usuario/cadastrar', {
		templateUrl: 'partials/cadastroDeUsuario.html',
		controller: 'UsuarioController'
	});

	$routeProvider.otherwise({ redirectTo: '/' });
});