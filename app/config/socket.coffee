module.exports = (io) ->
	sockets = io.sockets
	
	sockets.on 'connection', (socket) ->
		socket.on 'join', (quadro) ->
			socket.join quadro

		socket.on 'leave', (quadro) ->
			socket.leave quadro

		socket.on 'enviar-feedback', (feedback) ->
			socket.to(feedback.quadro).broadcast.emit('adicionar-feedback', feedback)

		socket.on 'enviar-aviso', (aviso) ->
			socket.to(aviso.quadro).broadcast.emit('adicionar-aviso', aviso)