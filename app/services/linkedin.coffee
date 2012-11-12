class shr.Linkedin extends shr.Service
  constructor: (@container, @location, @title) ->
    @label = 'Linkedin'
    @class = 'linkedin'
    @endpoints = {
      share: ' http://linkedin.com/shareArticle?url=' + @location + '&title=' + @title
      count: 'http://linkedin.com/countserv/count/share?url=' + @location + '&callback=shr.services.linkedin.callback'
    }
    @render()
    
  callback: (res) ->
    document.querySelector(@container + ' .' + @class + ' .count').innerHTML = res.count