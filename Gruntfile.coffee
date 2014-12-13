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
            'src/classes.coffee'
            'src/shell.coffee'
            'src/map.coffee'
            'src/player.coffee'
            'src/bot.coffee'
            'src/start.coffee'
          ]


    watch:
      coffee:
        files: ['src/**/*.coffee']
        tasks: ['coffee']
      gruntfile:
        files: 'Gruntfile.coffee'
        options:
          reload: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', 'watch'