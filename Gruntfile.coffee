module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    bower:
      install:
        options:
          install: true
          cleanTargetDir: true
          cleanBowerDir: false

    copy:
      init:
        files:[
          {
            expand: true
            cwd: 'components/jquery/'
            src: 'jquery.min.js'
            dest: 'public/scripts/libs/'
            filter: 'isFile'
          }
          {
            expand: true
            cwd: 'components/lodash/dist/'
            src: 'lodash.min.js'
            dest: 'public/scripts/libs/'
            filter: 'isFile'
          }
          {
            expand: true
            cwd: 'components/requirejs/'
            src: 'require.js'
            dest: 'public/scripts/libs/'
            filter: 'isFile'
          }
        ]

      public:
        files: [
          {
            expand: true
            cwd: 'build/scripts'
            src: '**'
            dest: 'public/scripts'
          }
          {
            expand: true
            cwd: 'build/stylesheets'
            src: '**'
            dest: 'public/stylesheets'
          }
          {
            expand: true
            cwd: 'res'
            src: '*.html'
            dest: 'public/'
          }
        ]

    coffee:
      compile:
        expand: true
        cwd: '.'
        src: ['src/**/*.coffee']
        dest: 'compiled'
        ext: '.js'
      spec:
        expand: true
        cwd: '.'
        src: ['test/**/*.coffee']
        dest: 'compiled'
        ext:  '.js'

    stylus:
      product:
        files:
          'compiled/res/base.css': ['res/*.styl']

    clean:
      product:
        src: ['compiled/**/*.js', 'compiled/**/.css', 'compiled/*']

    concat:
      dist:
        src: ['compiled/src/**/*.js']
        dest: 'build/scripts/main.js'
      options:
        separator: ';'

    uglify:
      min:
        files:
          'build/scripts/main.min.js': ['build/scripts/main.js']

    cssmin:
      compress:
        files:
          'build/stylesheets/base.min.css': ['compiled/res/base.css']

    connect:
      preview:
        options:
          port: 9000
          base: 'public'

    regarde:
      src:
        files: ['src/**/*.*']
        tasks: ['generate']
      res:
        files: ['res/**/*.*']
        tasks: ['generate']


  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-regarde'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-stylus'


  grunt.registerTask 'init', ['bower:install','copy:init']
  grunt.registerTask 'compile', ['coffee', 'stylus']
  grunt.registerTask 'default', ['compile']
  grunt.registerTask 'build', ['compile', 'concat', 'uglify', 'cssmin']
  grunt.registerTask 'generate', ['compile', 'build', 'copy:public']
  grunt.registerTask 'preview', ['generate', 'connect:preview', 'regarde']

