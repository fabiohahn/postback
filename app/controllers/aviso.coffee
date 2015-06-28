module.exports = (app) ->
	Aviso = require '../models/aviso'

	AvisoController = 
		salvar: (req, res) ->
  			_id = req.body._id
  			dados = { conteudo: req.body.conteudo, quadro: req.body.quadro }

  			if _id
  				Aviso.atualizar(_id, dados).then(
	  					(aviso) ->
	  						res.json aviso
	  					(erro) ->	
	  						console.error erro
	  						res.status(500).json(erro))
  			else
  				Aviso.criar(dados).then(
	  					(aviso) ->
	  						res.status 201
	  						   .json aviso
	  					(erro) ->
	  						console.error erro
	  						res.status(500).json(erro))

  		listarPorQuadro: (req, res) ->
  			_id = req.params.id

  			Aviso.obterPorQuadro(_id).then(
	  				(avisos) ->
	  					throw new Error("Avisos não encontrados") if !avisos
	  					res.json avisos
					(erro) ->
						console.error erro
						res.status(500).json(erro))