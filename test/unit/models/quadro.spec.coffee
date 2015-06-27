require('chai').should()
Quadro = require '../../../app/models/quadro'
Usuario = require '../../../app/models/usuario'

describe 'Quadro', ->
	it 'deve ser criado corretamente', ->
		titulo = "titulo"
		descricao = "descrição"
		status = 'aberto'
		
		quadro = new Quadro titulo: titulo, descricao: descricao, status: status

		quadro.titulo.should.equal titulo
		quadro.descricao.should.equal descricao
		quadro.status.should.equal status

	it 'não deve ser criado sem título', ->
		quadro = new Quadro

		quadro.validate (validate) ->
			validate.errors.titulo.type.should.equal 'required'

	it 'permite ser fechado', ->
		quadro = new Quadro

		quadro.fechar()

		quadro.status.should.equal "fechado"

	it 'pode mudar status para aberto', ->
		quadro = new Quadro { status: "fechado" }

		quadro.abrir()

		quadro.status.should.equal "aberto"

	it 'deve permitir ser vinculado a administradores', ->
		quadro = new Quadro
		administrador = new Usuario
		outroAdministrador = new Usuario

		quadro.vincularAdministrador administrador
		quadro.vincularAdministrador outroAdministrador

		quadro.administradores.length.should.equal 2
		quadro.administradores.should.include administrador._id
		quadro.administradores.should.include outroAdministrador._id

	it 'não deve permitir vincular administrador duplicado', ->
		quadro = new Quadro
		administrador = new Usuario
		
		quadro.vincularAdministrador administrador
		
		vincularAdministradorDuplicado = ->
			quadro.vincularAdministrador administrador			

		vincularAdministradorDuplicado.should.throw Error