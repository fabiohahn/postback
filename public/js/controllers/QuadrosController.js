angular.module('postback').controller('QuadrosController', function($scope, $resource){
	var Quadro = $resource('/quadros/')

	function buscarQuadros() {
	    Quadro.query(
	      function(quadros) {
	        $scope.quadros = quadros;
	        $scope.mensagem = {};
	      },
	      function(erro) {
	        console.log(erro);
	        $scope.mensagem = { texto: 'Não foi possível obter a lista de quadros' };
	      }
	    ); 
  	}

  	buscarQuadros();
});