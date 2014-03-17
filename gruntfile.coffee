module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      scripts:
        options:
          bare: true
        files: [
          src: ["./app/src/**/*.coffee"]
          dest: "./public/js/cursive.js"
        ]

    less:
      development:
        options:
          paths: ['./app/style/']
        files: [
          expand:true
          cwd: './app/style/'
          dest: './public/style'
          src: ['*.less']
          ext: '.css'
        ]

    copy:
      html:
        expand:true
        flatten:true
        cwd:'./app/'
        src: ['*.html']
        dest: './public/'


    watch:
      scripts:
        files: ['./app/src/**/*.coffee']
        tasks: ['coffee']
        options:
          nospawn: true
      styles:
        files: ['./app/style/**/*.less']
        tasks: ['less']
        options:
          nospawn: true
      html:
        files: ['./app/**/*.html']
        tasks: ['copy']
        options:
          nospawn: true

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['watch']
