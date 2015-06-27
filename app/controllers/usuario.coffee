module.exports = (app) ->
	crypto = require('crypto')
	Usuario = require '../models/usuario'

	UsuarioController = 
		cadastrar: (req, res) ->
			email = req.body.email
			senha = req.body.senha
			nome = req.body.nome
			
			usuario = new Usuario()
			usuario.registrar email, senha, nome

			usuario.save (erro) ->
				if erro
					res.send 400
				else
					res.send 200
		
		logar: (req, res) ->
			email = req.body.email
			senha = req.body.senha

			if null == email or email.length < 1 or null == senha or senha.length < 1
				res.send 400
				return

			shaSum = crypto.createHash 'sha256'
			shaSum.update senha

			Usuario.findOne { email: email, senha: shaSum.digest('hex') }, (erro, usuario) ->
				if not usuario
					res.send 401
					return
				
				req.session.logado = true
				req.session.usuarioId = usuario._id

				res.send usuario._id