mongoose = require 'mongoose'

module.exports = (uri) ->
	mongoose.connect uri
	mongoose.set 'debug', true
	
	mongoose.connection.on 'connected', ->
		console.log 'Mongoose! Conectado em ' + uri

	mongoose.connection.on 'disconnected', ->
		console.log 'Mongoose! Desconectado ' + uri

	mongoose.connection.on 'error', (erro) ->
		console.log 'Mongoose! Erro na conexão ' + erro

	process.on 'SIGINT', ->
		mongoose.connection.close ->
			console.log 'Mongoose! Desconectado pelo término da aplicação'

			process.exit 0