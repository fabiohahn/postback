express = require 'express'
load = require 'express-load'
bodyParser = require 'body-parser'

module.exports = ->
	app = express()

	app.set('port', 4000)
	app.set('view engine', 'ejs');
	app.set('views', './app/views');

	app.use(express.static('./public'));
	app.use(bodyParser.urlencoded({ extended: true } ))
	app.use(bodyParser.json())
	app.use(require('method-override')())

	load('controllers', { cwd: 'app' })
		.then('routes')
		.into(app)

	app.get '*', (req, res) ->
		res.status(404).render('404')

	return app