
fs   = require 'fs'
path = require 'path'
url  = require 'url'

module.exports =

  valid_url: (url) ->
    url.indexOf('http://') == 0 || url.indexOf('https://') == 0

  parse_url: (target_url) ->
    o = url.parse target_url
    [o.host, o.path]

  mkdir_if_necessary: (dir_path) ->
    if !fs.existsSync(dir_path)
      fs.mkdirSync dir_path

