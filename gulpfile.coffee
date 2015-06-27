gulp  = require 'gulp'
mocha = require 'gulp-mocha'

gulp.task 'tests', ->
	gulp.src 'test/**/*.coffee', read: false
		.pipe mocha reporter: 'nyan'
		.on 'error', (error) ->
			console.log error.stack