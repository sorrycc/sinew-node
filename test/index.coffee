
# Run.
# get 'http://www.baidu.com/', ->
#   console.log (@$ '#nv a')[0].innerHTML

sinew = require '../lib/sinew-node'

sinew.get 'http://www.reddit.com/r/javascript/', ->
  (@$ '#siteTable div.thing a.title').each (index)->
    console.log @innerHTML if index < 5
