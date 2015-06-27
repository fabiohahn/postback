module.exports = (app) ->
	controller = app.controllers.feedback
	
	app.route '/feedbacks'
		.post controller.salvar

	app.route '/feedbacks/quadro/:id'
		.get controller.listarPorQuadro