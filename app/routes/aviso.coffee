module.exports = (app) ->
	controller = app.controllers.aviso
	
	app.route '/avisos'
		.post controller.salvar

	app.route '/avisos/quadro/:id'
		.get controller.listarPorQuadro