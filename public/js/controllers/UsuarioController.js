angular.module('postback').controller('UsuarioController', function($scope, $resource){
	var Usuario = $resource('/usuario/');
	$scope.usuario = new Usuario();
	
	$scope.cadastrar = function() {
   		$scope.usuario.$save()
			.then(function() {
				$scope.mensagem = { texto: 'Usuário cadastrado' };
				$scope.usuario = new Usuario();
			})
			.catch(function(erro) {
	  			$scope.mensagem = { texto: 'Não foi possível cadastrar' };
	  		});	
   	};
});