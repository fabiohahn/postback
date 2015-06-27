mongoose = require 'mongoose'

feedbackSchema = new mongoose.Schema
	conteudo: type: String, required: true
	quadro: type: mongoose.Schema.Types.ObjectId, ref: 'Quadro', required: true
	omitido: type: Boolean, required: true, default: false
	dataDeCriacao:  type: Date, required: true, default: Date.now
	tipo: type: String, required: true, enum: { values: ['positivo', 'negativo'], message: 'Tipo inválido' }

feedbackSchema.methods.omitir = ->
	@omitido = true

module.exports = Feedback = mongoose.model 'Feedback', feedbackSchema

Feedback.obterPorQuadro = (quadroId) ->
	Feedback.find({ quadro: quadroId }).exec()

Feedback.atualizar = (id, dados) ->
	Feedback.findByIdAndUpdate(id, dados).exec()

Feedback.criar = (dados) ->
	Feedback.create dados