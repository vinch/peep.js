peep = {}

peep.JSONP = (location) ->
  script = document.createElement('script')
  script.src = location
  document.querySelector('head').appendChild(script)

peep.openPopup = (url, w, h) ->
  w ||= 626
  h ||= 436
  x = (screen.width/2)-(w/2)
  y = (screen.height/2)-(h/2)
  window.open(url, 'peepshare', 'toolbar=0,status=0,resizable=1,width='+w+',height='+h+',top='+y+',left='+x)

class peep.Peep
  constructor: (@selector, @options) ->
    @selector ||= '.peep'
    @options ||= {}
    @options.theme ||= 'default'

    peep.instances = []
    for node, index in document.querySelectorAll(@selector)
      node.setAttribute('data-id', index)
      new peep.Instance(node)

    unless @options.theme is 'none'
      stylesheet = document.createElement('link')
      stylesheet.rel = 'stylesheet'
      stylesheet.href = if @options.theme.substr(0,7) == 'http://' or @options.theme.substr(0,8) == 'https://' then @options.theme else 'themes/' + @options.theme + '.css'
      document.querySelector('head').appendChild(stylesheet)

class peep.Instance
  constructor: (@node) ->
    dataset = @node.dataset

    @id = dataset.id
    @url = dataset.url or window.location.href
    @title = dataset.title or document.title;
    @services = dataset.services or 'Twitter, Facebook';

    peep.instances[@id] = {}
    peep.instances[@id].services = []
    @services.replace(/^\s*|\s*$/g,'').split(/\s*,\s*/).forEach (service) =>
      if peep[service]
        peep.instances[@id].services[service] = new peep[service](@node, @id, @url, @title)
      else
        console.error "\"#{service}\" service doesn't exist."

class peep.Service
  render: () ->
    @node.innerHTML += "<div class=\"peep_share #{@class}\"><a href=\"#{@endpoints.share}\" class=\"label\" onclick=\"peep.openPopup(this.href);return false;\">#{@label}</a></div>"
    if (@endpoints.count)
      peep.JSONP @endpoints.count
      @node.querySelector(".#{@class}").innerHTML += '<span class=\"count loading\">...</span>'

  callback: (res) ->
    count = @node.querySelector(".#{@class} .count")
    count.removeAttribute('loading')
    count.innerHTML = eval(@path) or 0
