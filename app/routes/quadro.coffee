module.exports = (app) ->
	controller = app.controllers.quadro
	
	app.route '/quadros'
		.get controller.listarTodos
		.post controller.salvar

	app.route '/quadros/:id'
		.get controller.obterPorId