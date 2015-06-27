exports.iniciar = ->
	http = require 'http'
	express = require './config/express'
	io = require 'socket.io'
	database = require './config/database'
	socket = require './config/socket'
	
	app  = express()
	server = http.createServer app
	io = io.listen server
	socket io
	
	database('mongodb://localhost/NovoPostBack')

	port = app.get 'port'
	server.listen port, ->
		console.log 'Express server escutando na porta ' + port