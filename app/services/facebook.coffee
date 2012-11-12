class shr.Facebook extends shr.Service
  constructor: (@container, @location, @title) ->
    @label = 'Facebook'
    @class = 'facebook'
    @endpoints = {
      share: 'http://www.facebook.com/sharer.php?t=' + @title + '&u=' + @location
      count: 'http://graph.facebook.com/' + @location + '?callback=shr.services.facebook.callback'
    }
    @render()
    
  callback: (res) ->
    res.shares = res.shares || 0
    document.querySelector(@container + ' .' + @class + ' .count').innerHTML = res.shares