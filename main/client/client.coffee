require [], () ->
  console.log 'loaded'
  setTimeout () ->
      $('#loading_indicator').fadeOut();
    , 5000
