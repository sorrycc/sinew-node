// Generated by CoffeeScript 1.3.3
(function() {
  var fs, path, url;

  fs = require('fs');

  path = require('path');

  url = require('url');

  module.exports = {
    valid_url: function(url) {
      return url.indexOf('http://') === 0 || url.indexOf('https://') === 0;
    },
    parse_url: function(target_url) {
      var o;
      o = url.parse(target_url);
      return [o.host, o.path];
    },
    mkdir_if_necessary: function(dir_path) {
      if (!fs.existsSync(dir_path)) {
        return fs.mkdirSync(dir_path);
      }
    }
  };

}).call(this);
