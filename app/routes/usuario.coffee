module.exports = (app) ->
	controller = app.controllers.usuario
	
	app.route '/usuario'
		.post controller.cadastrar