express = require 'express.io'
http    = require 'http'
path    = require 'path'

app = express().http().io()

app.configure () ->
	app.set 'port', process.env.PORT || 8080
	app.set 'views', __dirname + '/server/views'
	app.set 'view engine', 'hjs'
	app.use express.favicon()
	app.use express.logger('dev')
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser 'fc5422223ed4bcfdf92ab07ba3c7baf6'
	#app.use express.session
	app.use app.router
	app.use express.static path.join __dirname, 'client'


app.configure 'development', ->
  app.use express.errorHandler()






app.get '/', (req, res) ->
  res.render 'index', null


app.io.route 'ready', (req) ->
  console.log 'ready recieved' 
  req.io.emit 'foo', big_data
  
app.listen app.get 'port'  
