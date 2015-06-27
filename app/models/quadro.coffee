mongoose = require 'mongoose'

quadroSchema = new mongoose.Schema
	titulo: type: String, required: true
	descricao: String
	status: type: String, required: true, default: 'aberto', enum: { values: ['aberto', 'fechado'] }
	administradores: [ type: mongoose.Schema.Types.ObjectId, ref: 'Usuario' ]

quadroSchema.methods.fechar = ->
	@status = 'fechado'

quadroSchema.methods.abrir = ->
	@status = 'aberto'

quadroSchema.methods.vincularAdministrador = (administrador) ->
	if @administradores.indexOf(administrador._id) >= 0
		throw new Error('administrador já foi adicionado')

	@administradores.push administrador

module.exports = Quadro = mongoose.model 'Quadro', quadroSchema

Quadro.listarTodos = ->
	Quadro.find().exec()

Quadro.atualizar = (id, dados) ->
	Quadro.findByIdAndUpdate(id, dados).exec()

Quadro.criar = (dados) ->
	Quadro.create(dados)

Quadro.obterPorId = (id) ->
	Quadro.findById(id).exec()