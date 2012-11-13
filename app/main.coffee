peep = {}

peep.JSONP = (location) ->
  script = document.createElement('script')
  script.src = location
  document.querySelector('head').appendChild(script)

peep.openPopup = (url) ->
  window.open(url, 'sharer', 'toolbar=0,status=0,resizable=1,width=626,height=436')

class peep.Peep
  constructor: (@selector, @options) ->
    @selector = @selector || '.peep'
    @options = @options || {};
    @options.theme = @options.theme || 'default';
    
    peep.instances = []
    for node, index in document.querySelectorAll(@selector)
      node.setAttribute('data-id', index)
      new peep.Instance(node)
    
    if @options.theme != 'none'
      stylesheet = document.createElement('link')
      stylesheet.rel = 'stylesheet'
      stylesheet.href = if @options.theme.substr(0,7) == 'http://' or @options.theme.substr(0,8) == 'https://' then @options.theme else 'themes/' + @options.theme + '.css'
      document.querySelector('head').appendChild(stylesheet)

class peep.Instance
  constructor: (@node) ->
    dataset = @node.dataset
    
    @id = dataset.id
    @url = dataset.url || window.location.href
    @title = dataset.title || document.title;
    @services = dataset.services || 'Twitter, Facebook';
    
    peep.instances[@id] = {}
    peep.instances[@id].services = []
    @services.replace(/^\s*|\s*$/g,'').split(/\s*,\s*/).forEach (service) =>
      if peep[service]
        peep.instances[@id].services[service] = new peep[service](@node, @id, @url, @title)
      else
        console.error '"' + service + '" service doesn\'t exist.'
    
class peep.Service
  render: () ->
    peep.JSONP @endpoints.count
    @node.innerHTML += '<div class="peep_share ' + @class + '"><a href="' + @endpoints.share + '" class="label" onclick="peep.openPopup(this.href);return false;">' + @label + '</a><span class="count loading">...</span></div>'