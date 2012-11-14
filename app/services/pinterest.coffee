class peep.Pinterest extends peep.Service
  constructor: (@node, @id, @url, @title) ->
    @label = 'Pinterest'
    @class = 'pinterest'
    @endpoints =
      share: "https://pinterest.com/pin/create/button/?media=#{@url}&description=#{@title}"
      count: "http://api.pinterest.com/v1/urls/count.json?url=#{@url}&callback=peep.instances[#{@id}].services.Pinterest.callback"
    @path = 'res.count'  
      
    @render()
