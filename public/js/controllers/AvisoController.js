angular.module('postback').controller('AvisoController', function(Socket, $scope, $resource, $routeParams){
	var quadroId = $routeParams.quadroId;
	
	var Aviso = $resource('/avisos/');
	$scope.aviso = new Aviso();

	$scope.salvar = function() {
		$scope.aviso.quadro = quadroId;

		$scope.aviso.$save()
			.then(function() {
				$scope.mensagem = { texto: 'Aviso enviado' };
				Socket.emit('enviar-aviso', $scope.aviso);
				$scope.aviso = new Aviso();
			})
			.catch(function(erro) {
	  			$scope.mensagem = { texto: 'Não foi possível salvar' };
	  		});
	};

	function configurarSocket(quadroId){
		Socket.emit('join', quadroId);

		Socket.on('adicionar-aviso', function(aviso){
	        $scope.avisos.push(aviso);
			$scope.$digest;
		});

		Socket.on('connect_error', function(err) {
			Socket.emit('join', quadroId);
		});

		$scope.$on('$destroy', function () {
			Socket.emit('leave', quadroId);
		});
	};

	configurarSocket(quadroId);
});