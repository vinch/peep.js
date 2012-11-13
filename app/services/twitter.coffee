class peep.Twitter extends peep.Service
  constructor: (@node, @id, @url, @title) ->
    @label = 'Twitter'
    @class = 'twitter'
    @endpoints =
      share: "https://twitter.com/intent/tweet?text=#{@title}&url=#{@url}"
      count: "http://urls.api.twitter.com/1/urls/count.json?url=#{@url}&callback=peep.instances[#{@id}].services.Twitter.callback"

    @render()
