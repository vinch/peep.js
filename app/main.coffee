shr = {}

shr.JSONP = (location) ->
  script = document.createElement('script')
  script.src = location
  document.querySelector('head').appendChild(script)

class shr.Shr
  constructor: (@container, @options) ->
    @options = @options || {};
    @options.location = @options.location || window.location.href
    @options.title = @options.title || document.title;
    @options.services = @options.services || ['twitter','facebook','linkedin'];
    @options.theme = @options.theme || 'default';
    
    shr.services = []
    @options.services.forEach (service) =>
      try
        shr.services[service] = new shr[service.charAt(0).toUpperCase() + service.slice(1)](@container, @options.location, @options.title)
      catch e
        console.error '"' + service + '" service doesn\'t exist.'
    
    stylesheet = document.createElement('link')
    stylesheet.rel = 'stylesheet'
    stylesheet.href = 'themes/' + @options.theme + '.css'
    document.querySelector('head').appendChild(stylesheet)
    
class shr.Service
  render: () ->
    shr.JSONP @endpoints.count
    document.querySelector(@container).innerHTML += '<div class="shr_share ' + @class + '"><a href="' + @endpoints.share + '" class="label" onclick="window.open(this.href);return false;">' + @label + '</a><span class="count">...</span></div>'