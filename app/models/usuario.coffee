mongoose = require 'mongoose'
crypto = require 'crypto'

usuarioSchema = new mongoose.Schema
	nome: type: String, required: true
	email: type: String, unique: true, required: true
	senha: type: String, required: true

usuarioSchema.methods.registrar = (email, senha, nome) ->
	shaSum = crypto.createHash 'sha256'
	shaSum.update senha
	@email = email
	@nome = nome
	@senha = shaSum.digest 'hex'

module.exports = Usuario = mongoose.model 'Usuario', usuarioSchema

Usuario.criar = (dados) ->
	Usuario.create(dados)