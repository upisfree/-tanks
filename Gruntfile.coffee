module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        options:
          join: true
        files:
          'build/<%= pkg.name %>.js': [
            'src/vars.coffee'
            'src/utils.coffee'
            'src/baseBlocks.coffee'
            'src/shell.coffee'
            'src/map.coffee'
            'src/player.coffee'
            'src/bot.coffee'
            'src/start.coffee'
          ]

    bower_concat:
      all:
        dest: 'build/lib.js'

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
        tasks: ['coffee', 'uglify:src']
      bower:
        files: ['bower.json']
        tasks: ['bower_concat', 'uglify:lib']
      gruntfile:
        files: 'Gruntfile.coffee'
        options:
          reload: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', 'watch'