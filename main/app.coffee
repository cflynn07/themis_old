express = require 'express'
routes  = require './routes'
http    = require 'http'
path    = require 'path'

app = express()

app.configure () ->
	app.set 'port', process.env.PORT || 8080
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'hjs'
	app.use express.favicon()
	app.use express.logger('dev')
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser 'kiueg0853n3wds0f8a2nrsdfsfg-48vzxnvzwabh-1sfasgas'
	#app.use express.session
	app.use app.router
	app.use express.static path.join __dirname, 'public'

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', (req, res) ->
  res.send 'food'

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get 'port'