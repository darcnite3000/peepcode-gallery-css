module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['sass/*.scss', 'index.html']
      tasks: ['compass:dev']
      options:
        livereload: true
    compass:
      dev:
        options:
          sassDir: 'sass'
          cssDir: 'css'
          require: 'animation'
      dist:
        options:
          sassDir: 'sass'
          cssDir: 'dist'
          require: 'animation'
          noLineComments: true
          outputStyle: 'nested'
    cssmin:
      dist:
        files:
          'dist/<%= pkg.name %>.min.css': ['dist/<%= pkg.name %>.css']
        
          
        

  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  
  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build', ['compass:dist','cssmin:dist']