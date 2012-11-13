class peep.LinkedIn extends peep.Service
  constructor: (@node, @id, @url, @title) ->
    @label = 'LinkedIn'
    @class = 'linkedin'
    @endpoints = {
      share: ' http://linkedin.com/shareArticle?url=' + @url + '&title=' + @title
      count: 'http://linkedin.com/countserv/count/share?url=' + @url + '&callback=peep.instances[' + @id + '].services.LinkedIn.callback'
    }
    @render()
    
  callback: (res) ->
    @node.querySelector('.' + @class + ' .count').innerHTML = res.count