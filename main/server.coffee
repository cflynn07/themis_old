express = require 'express.io'
path    = require 'path'
bcrypt  = require 'bcrypt'

app = express().http().io()

app.configure () ->
	app.set 'port', process.env.PORT || 8080
	app.set 'views', __dirname + '/server/views'
	app.set 'view engine', 'hjs'
	app.use express.favicon()
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	
	app.use express.cookieParser()
	app.use express.session secret:'fc5422223ed4bcfdf92ab07ba3c7baf6'
	
	app.use app.router
	app.use express.static path.join __dirname, 'client'


app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', (req, res) ->
  res.render 'index', null

app.io.route 'ready', (req) ->
  t0 = Date.now()
  
  bcrypt.genSalt 16, (err, salt) ->
    bcrypt.hash "ILikeBunnies", salt, (err, hash) ->
      console.log 'Password hashed: ' + (Date.now() - t0)
      
      bcrypt.compare "ILikeBunnies", hash, (err, res) ->
        console.log 'Finished: ' + res
        console.log 'Password checked: ' +  (Date.now() - t0)
      
      
  
app.listen app.get 'port'  
