class peep.Delicious extends peep.Service
  constructor: (@node, @id, @url, @title) ->
    @label = 'Delicious'
    @class = 'delicious'
    @endpoints =
      share: "http://del.icio.us/post?url=#{@url}&title=#{@title}"
      count: "http://feeds.delicious.com/v2/json/urlinfo/data?url=#{@url}?callback=peep.instances[#{@id}].services.Delicious.callback"

    @render()
