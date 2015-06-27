require('chai').should()
Usuario = require '../../../app/models/usuario'

describe 'Usuario', ->
	it 'não deve ser criado sem nome, email e senha', ->
		usuario = new Usuario

		usuario.validate (val) ->
			val.errors.nome.type.should.equal 'required'
			val.errors.email.type.should.equal 'required'
			val.errors.senha.type.should.equal 'required'