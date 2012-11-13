class peep.Facebook extends peep.Service
  constructor: (@node, @id, @url, @title) ->
    @label = 'Facebook'
    @class = 'facebook'
    @endpoints =
      share: "http://www.facebook.com/sharer.php?t=#{@title}&u=#{@url}"
      count: "http://graph.facebook.com/#{@url}?callback=peep.instances[#{@id}].services.Facebook.callback"

    @render()
