class peep.GooglePlus extends peep.Service
  constructor: (@node, @id, @url, @title) ->
    @label = 'Google+'
    @class = 'googleplus'
    @endpoints =
      share: "https://plus.google.com/share?url=#{@url}"

    @render()
