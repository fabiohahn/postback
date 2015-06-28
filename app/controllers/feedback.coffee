module.exports = (app) ->
	Feedback = require '../models/feedback'

	FeedbackController = 
		salvar: (req, res) ->
  			_id = req.body._id
  			dados = { conteudo: req.body.conteudo, quadro: req.body.quadro, tipo: req.body.tipo }

  			if _id
  				Feedback.atualizar(_id, dados).then(
	  					(feedback) ->
	  						res.json feedback
	  					(erro) ->	
	  						console.error erro
	  						res.status(500).json(erro))
  			else
  				Feedback.criar(dados).then(
	  					(feedback) ->
	  						res.status 201
	  						   .json feedback
	  					(erro) ->
	  						console.error erro
	  						res.status(500).json(erro))

  		listarPorQuadro: (req, res) ->
  			_id = req.params.id

  			Feedback.obterPorQuadro(_id).then(
	  				(feedbacks) ->
	  					throw new Error("Feedbacks não encontrados") if !feedbacks
	  					res.json feedbacks
					(erro) ->
						console.error erro
						res.status(500).json(erro))