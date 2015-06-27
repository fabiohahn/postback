require('chai').should()
Feedback = require '../../../app/models/feedback'
Quadro = require '../../../app/models/quadro'

describe 'Feedback', ->
	it 'deve ser criado com conteudo', ->
		conteudo = "conteudo"

		feedback = new Feedback conteudo: conteudo

		feedback.conteudo.should.equal conteudo

	it 'não deve ser criado sem conteudo', ->
		feedback = new Feedback

		feedback.validate (validate) ->
			validate.errors.conteudo.type.should.equal 'required'
	
	it 'deve ser criado com um quadro', ->
		quadro = new Quadro
		
		feedback = new Feedback quadro: quadro
		
		feedback.quadro.should.equal quadro._id

	it 'não deve ser criado sem quadro', ->
		feedback = new Feedback

		feedback.validate (validate) ->
			validate.errors.quadro.type.should.equal 'required'

	it 'deve ser criado com tipo', ->
		tipo = 'positivo'
		
		feedback = new Feedback tipo: tipo
		
		feedback.tipo.should.equal tipo

	it 'não deve ser criado com tipo inválido', ->
		tipo = 'tipoQualquer'

		feedback = new Feedback tipo: tipo

		feedback.validate (validate) ->
			validate.errors.tipo.message.should.equal 'Tipo inválido'

	it 'pode ser omitido', ->
		feedback = new Feedback

		feedback.omitir()

		feedback.omitido.should.be.true