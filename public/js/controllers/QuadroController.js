angular.module('postback').controller('QuadroController', function(Socket, $scope, $resource, $routeParams){
	var Quadro = $resource('/quadros/:id');
	
	function configurarSocket(quadroId){
		Socket.emit('join', quadroId);

		Socket.on('adicionar-feedback', function(feedback){
	        $scope.feedbacks.push(feedback);
			$scope.$digest;
		});

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
	}

	function listarFeedbacks(quadroId) {
		    var Feedback = $resource('/feedbacks/quadro/:id', { id: quadroId });

		    Feedback.query(function(feedbacks) {
		        $scope.feedbacks = feedbacks;
		        $scope.mensagem = {};
		      },
		      function(erro) {
		        console.log(erro);
		        $scope.mensagem = { texto: 'Não foi possível obter a lista de feedbacks' };
		      }
		    ); 
	  	}

	function listarAvisos(quadroId) {
		    var Aviso = $resource('/avisos/quadro/:id', { id: quadroId });

		    Aviso.query(function(avisos) {
		        $scope.avisos = avisos;
		        $scope.mensagem = {};
		      },
		      function(erro) {
		        console.log(erro);
		        $scope.mensagem = { texto: 'Não foi possível obter a lista de avisos' };
		      }
		    ); 
	  	}

	Quadro.get({ id: $routeParams.quadroId },
			function(quadro) {
				$scope.quadro = quadro;
				
				configurarSocket(quadro._id);
				listarFeedbacks(quadro._id);
				listarAvisos(quadro._id);
			}, 
			function(erro) {
				console.log(erro);
				$scope.mensagem = {texto: 'Quadro não existe.'};
			}
		);
});