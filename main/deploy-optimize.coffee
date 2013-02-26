exports.optimize = (callback) ->
  
  requirejs = require 'requirejs'
  util      = require 'util'
  exec      = require('child_process').exec
  cssmin    = require('cssmin').cssmin
  fs        = require 'fs'
  
  
  
  config = 
    baseUrl: './client'
    name:    'assets/requirejs/almond'
    include: './client'
    dir:     './client/'
    paths:
      text:  'assets/requirejs/text'
    out:     './client/build.js'
  
  requirejs.optimize config,
    (buildResponse) ->
      console.log 'requirejs.optimize:'
      console.log buildResponse
      
      
      #Now we optimize the CSS
      
      
      callback()
      
    ,(err) ->