module.exports = (grunt) ->
  grunt.initConfig
    connect:
      server:
        options:
          base:'public'
          livereload:true

    coffee:
      scripts:
        options:
          bare: true
        files: [
          src: ["./app/src/**/*.coffee"]
          dest: "./public/src/cursive.js"
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
      static:
        expand:true
        cwd:'./app/'
        src: ['*.html','image/**/*','style/*.css','src/*.js','src/*.map','fonts/*','favicon.ico']
        dest: './public/'

    watch:
      scripts:
        files: ['./app/src/**/*.coffee']
        tasks: ['coffee']
      styles:
        files: ['./app/style/**/*.less']
        tasks: ['less']
      static:
        files: ['./app/**/*']
        tasks: ['copy']
      livereload:
        options:
          livereload: true
        files: ['./public/**/*']

    clean: ['./public']


  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'default', ['clean','build','connect','watch']
  grunt.registerTask 'build', ['clean','coffee','less','copy']
