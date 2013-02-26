exports.optimize = (callback) ->
  
  requirejs = require 'requirejs'
  sys       = require 'sys'
  exec      = require('child_process').exec
  
  
  config = 
    baseUrl: './client'
    name:    'assets/requirejs/almond'
    include: './client'
    paths:
      text:  'assets/requirejs/text'
    out:     './client/build.js'
  
  requirejs.optimize config,
    (buildResponse) ->
      console.log 'requirejs.optimize:'
      console.log buildResponse
      
      callback()
      
    ,(err) ->