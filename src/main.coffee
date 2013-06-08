require.config
  paths:
    jquery: 'libs/jquery.min'
    lodash: 'libs/lodash.min'

  shim:
    jquery:
      exports:'jQuery'

    lodash:
      exports: '_'

require ['jquery', 'lodash'], ($, _) ->
  $ ->
    console.log 'hello coffeeplate'
