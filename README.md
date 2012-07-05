## Welcome to Sinew-Node

Sinew-Node collects structured data from web sites (screen scraping).

Sinew is distributed as a ruby gem:

```node
npm install sinew-node
```

## Example

Here's an example for collecting Reddit's topic list:

```javascript
// JavaScript
var sinew = require('sinew-node');
sinew.get('http://www.reddit.com/r/javascript/', function() {
  this.$('#siteTable div.thing a.title').each(function(index) {
    console.log(this.innerHTML)
  });
});
```

```coffeescript
# CoffeeScript
sinew = require 'sinew-node'
sinew.get 'http://www.reddit.com/r/javascript/', ->
  (@$ '#siteTable div.thing a.title').each (index) ->
    console.log @innerHTML
```

## Features

* Sinew caches all HTTP requests on disk. That makes it possible to iterate quickly. Crawl once and then continue to work on your recipe. Run the recipe over and over while you tune your CSS selectors and regular expressions.


