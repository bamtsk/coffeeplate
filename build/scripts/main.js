(function() {
  require.config({
    paths: {
      jquery: 'libs/jquery.min',
      lodash: 'libs/lodash.min'
    },
    shim: {
      jquery: {
        exports: 'jQuery'
      },
      lodash: {
        exports: '_'
      }
    }
  });

  require(['jquery', 'lodash'], function($, _) {
    return $(function() {
      return console.log('hello');
    });
  });

}).call(this);
;(function() {
  define(function() {
    var Task;
    Task = (function() {
      function Task(item) {
        this.item = item;
      }

      Task.prototype.toString = function() {
        return this.item;
      };

      return Task;

    })();
    return {
      Task: Task
    };
  });

}).call(this);
