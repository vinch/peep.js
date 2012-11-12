class shr.Twitter extends shr.Service
  constructor: (@container, @location, @title) ->
    @label = 'Twitter'
    @class = 'twitter'
    @endpoints = {
      share: 'https://twitter.com/intent/tweet?text=' + @title + '&url=' + @location
      count: 'http://urls.api.twitter.com/1/urls/count.json?url=' + @location + '&callback=shr.services.twitter.callback'
    }
    @render()
    
  callback: (res) ->
    document.querySelector(@container + ' .' + @class + ' .count').innerHTML = res.count