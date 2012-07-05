request = require 'request'
jsdom   = require 'jsdom'
_       = require 'underscore'
fs      = require 'fs'
path    = require 'path'
helper  = require './helper'

jquery  = fs.readFileSync(path.join(__dirname, '../support/jquery-1.7.2.min.js')).toString()

module.exports.get = get = (url, callback = ->) ->
  return (console.log "[Error] url not valid") if !helper.valid_url(url)
  # get paths
  [hostname, url_path] = helper.parse_url url
  siniew_path = path.join process.env.HOME, '.sinew-node'
  host_path   = path.join siniew_path, hostname
  url_path    = format_urlpath url_path
  file_path   = path.join host_path, url_path
  # init cache dirs
  helper.mkdir_if_necessary siniew_path
  helper.mkdir_if_necessary host_path
  # read locally or request
  if fs.existsSync(file_path)
    console.log "[Info] read url locally: #{url}"
    parse_html fs.readFileSync(file_path, 'utf-8'), callback
  else
    console.log "[Info] requesting url: #{url}"
    request url, (e, res, body) ->
      return (console.log e) if e
      unless res.statusCode == 200
        return (console.log "[Connect Error] response status is #{res.statusCode}")
      parse_html body, callback
      fs.writeFileSync(file_path, body, 'utf-8')

parse_html = (body, callback) ->
  jsdom.env
    html: body
    src: [jquery]
    done: (e, window) ->
      return (console.log "[Parsing Error] #{e.code}") if e
      callback.apply {$: window.$, _: _}

format_urlpath = (url_path) ->
  url_path = url_path.replace(/\/|&/g, ',')
  url_path = url_path.replace(/\?/g, ',,')


