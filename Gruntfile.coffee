module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        options:
          join: true
        files:
          'build/<%= pkg.name %>.js': [
            'src/utils.coffee'
            'src/map.coffee'
            'src/player.coffee'
            'src/bot.coffee'
            'src/start.coffee'
          ]

    uglify:
      build:
        src: 'build/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.js'

    watch:
      scripts:
        files: ['src/**/*.coffee']
        tasks: ['coffee', 'uglify']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', 'watch'