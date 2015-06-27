angular.module('postback').controller('FeedbackController', function(Socket, $scope, $resource, $routeParams){
	var quadroId = $routeParams.quadroId;
	
	var Feedback = $resource('/feedbacks/');
	$scope.feedback = new Feedback();

	$scope.salvar = function() {
		$scope.feedback.quadro = quadroId;

		$scope.feedback.$save()
			.then(function() {
				$scope.mensagem = { texto: 'Feedback enviado' };
				Socket.emit('enviar-feedback', $scope.feedback);
				$scope.feedback = new Feedback();
			})
			.catch(function(erro) {
	  			$scope.mensagem = { texto: 'Não foi possível salvar' };
	  		});
	};

	function configurarSocket(quadroId){
		Socket.emit('join', quadroId);

		Socket.on('adicionar-feedback', function(feedback){
	        $scope.feedbacks.push(feedback);
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