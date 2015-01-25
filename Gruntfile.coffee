DEV = false

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  require('time-grunt')(grunt)

  config =
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        options:
          join: true
        files:
          'build/<%= pkg.name %>.js': [
            'src/core/config.coffee'
            'src/core/system.coffee'
            'src/core/math.coffee'
            'src/core/render.coffee'
            'src/core/vars.coffee'
            'src/core/camera.coffee'
            'src/map/map.coffee' # cell.coffee, chunk.coffee
            'src/tank/shell.coffee'
            'src/tank/tank.coffee'
            'src/tank/player.coffee'
            'src/start.coffee'
          ]

    bower_concat:
      all:
        dest: 'build/lib.js'
        mainFiles:
          'pixi.js': 'bin/pixi.dev.js',
          'matter-js': 'build/matter.js'

    uglify:
      src:
        src: 'build/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.js'
      lib:
        src: 'build/lib.js'
        dest: 'build/lib.js'

    watch:
      coffee:
        files: ['src/**/*.coffee']
        tasks: ['coffee']
      bower:
        files: ['bower.json']
        tasks: ['bower_concat']
      gruntfile:
        files: 'Gruntfile.coffee'
        options:
          reload: true

  if DEV is false
    config.watch.coffee.tasks.push 'uglify:src'
    config.watch.bower.tasks.push 'uglify:lib'

  grunt.initConfig config

  grunt.registerTask 'default', 'watch'