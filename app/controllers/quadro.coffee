module.exports = (app) ->
	Quadro = require '../models/quadro'

	QuadroController = 
		listarTodos: (req, res) ->
  			Quadro.listarTodos().then(
  					(quadros) ->
  						res.json quadros
  					(erro) ->
  						console.error erro
  						res.status(500).json(erro))

  		salvar: (req, res) ->
  			_id = req.body._id
  			dados = { titulo: req.body.titulo, descricao: req.body.descricao }

  			if _id
  				Quadro.atualizar(_id, dados).then(
	  					(quadro) ->
	  						res.json quadro
	  					(erro) ->
	  						console.error erro
	  						res.status(500).json(erro))
  			else
  				Quadro.criar(dados).then(
	  					(quadro) ->
	  						res.status 201
	  						   .json quadro
	  					(erro) ->
	  						console.error erro
	  						res.status(500).json(erro))

  		obterPorId: (req, res) ->
  			_id = req.params.id
  			Quadro.obterPorId(_id).then(
	  				(quadro) ->
	  					throw new Error("Quadro não encontrado") if !quadro
	  					res.json quadro
					(erro) ->
						console.error erro
						res.status(500).json(erro))