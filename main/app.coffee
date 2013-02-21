express = require 'express.io'
http    = require 'http'
path    = require 'path'

app = express()

app.configure () ->
	app.set 'port', process.env.PORT || 8080
	app.set 'views', __dirname + '/app/views'
	app.set 'view engine', 'hjs'
	app.use express.favicon()
	app.use express.logger('dev')
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser 'fc5422223ed4bcfdf92ab07ba3c7baf6'
	#app.use express.session
	app.use app.router
	app.use express.static path.join __dirname, 'public'

app.configure 'development', ->
  app.use express.errorHandler()






app.get '/', (req, res) ->
  console.log (res)
  res.send 'food'






http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get 'port'