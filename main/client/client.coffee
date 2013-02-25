requirejs.config 
  baseUrl: '/'
  paths:
    text: "/assets/requirejs/text"
  shim: {}

require ['modules/login'], (Login) ->
  
  console.log 'loaded'
  console.log  arguments
