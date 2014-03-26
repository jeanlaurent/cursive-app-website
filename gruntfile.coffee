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
          src: ["app/src/**/*.coffee"]
          dest: "public/src/cursive.js"
        ]

    less:
      development:
        options:
          paths: ['app/style']
        files: [
          expand:true
          cwd: 'app/style'
          dest: 'public/style'
          src: ['*.less']
          ext: '.css'
        ]

    copy:
      static:
        expand:true
        cwd:'app'
        src: ['image/**/*','style/*.css','src/*.js','src/*.map','fonts/*','favicon.ico']
        dest: 'public'

    rename:
      index:
        src:'public/index_fr.html',
        dest:'public/index.html',

    template_runner:
      basic:
        options:
          locales: ['fr','en']
        files:
          'public/':['app/index.html']

    watch:
      scripts:
        files: ['app/src/**/*.coffee']
        tasks: ['coffee']
      styles:
        files: ['app/style/**/*.less']
        tasks: ['less']
      static:
        files: ['app/**/*']
        tasks: ['copy']
      i18n:
        files: ['locales/*.json','app/index.html']
        tasks: ['template_runner','rename']
      livereload:
        options:
          livereload: true
        files: ['public/**/*']

    clean: ['public']

    buildGhPages:
      production:
        options:
          dist: 'public'
          pull: false
          cname: 'cursive.serpodile.com'

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-template-runner'
  grunt.loadNpmTasks 'grunt-rename'
  grunt.loadNpmTasks 'grunt-build-gh-pages'

  grunt.registerTask 'default', ['build','connect','watch']
  grunt.registerTask 'build',   ['clean','coffee','less','copy','template_runner','rename']
  grunt.registerTask 'deploy',  ['build','buildGhPages']
