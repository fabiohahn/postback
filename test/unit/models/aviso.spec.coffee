require('chai').should()
Aviso = require '../../../app/models/aviso'
Quadro = require '../../../app/models/quadro'

describe 'Aviso', ->
	it 'deve ser criado com conteudo', ->
		conteudo = "conteudo"

		aviso = new Aviso conteudo: conteudo

		aviso.conteudo.should.equal conteudo

	it 'não deve ser criado sem conteudo', ->
		aviso = new Aviso

		aviso.validate (validate) ->
			validate.errors.conteudo.type.should.equal 'required'
	
	it 'deve ser criado com um quadro', ->
		quadro = new Quadro
		
		aviso = new Aviso quadro: quadro
		
		aviso.quadro.should.equal quadro._id

	it 'pode ser omitido', ->
		aviso = new Aviso

		aviso.omitir()

		aviso.omitido.should.be.true