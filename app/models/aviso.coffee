mongoose = require 'mongoose'

avisoShema = new mongoose.Schema
	conteudo: type: String, required: true
	quadro: type: mongoose.Schema.Types.ObjectId, ref: 'Quadro', required: true
	dataDeCriacao:  type: Date, required: true, default: Date.now

avisoShema.methods.omitir = ->
	@omitido = true

module.exports = Aviso = mongoose.model 'Aviso', avisoShema

Aviso.obterPorQuadro = (quadroId) ->
	Aviso.find({ quadro: quadroId }).exec()

Aviso.atualizar = (id, dados) ->
	Aviso.findByIdAndUpdate(id, dados).exec()

Aviso.criar = (dados) ->
	Aviso.create dados