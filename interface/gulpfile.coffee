gulp = require 'gulp'
plugins = require('gulp-load-plugins') lazy: false

SERVER_HOST = 'localhost'
SERVER_PORT = 9000

gulp.task 'coffee', ->
  # combine all js files of the app
  gulp
  .src './app/coffee/**/*.coffee'
  .pipe plugins.changed './build'
  .pipe plugins.coffeelint './coffeelint.json'
    .on 'error', plugins.util.log
  .pipe plugins.coffeelint.reporter()
    .on 'error', plugins.util.log
  .pipe plugins.coffee bare: true
    .on 'error', plugins.util.log
  .pipe plugins.concat 'app.js'
  .pipe gulp.dest './build'
  .pipe plugins.filesize()

gulp.task 'less', ->
  gulp
  .src './app/less/app.less'
  .pipe plugins.changed './build'
  .pipe plugins.less compress: on, cleancss: on
    .on 'error', plugins.util.log
  .pipe gulp.dest './build'
  .pipe plugins.filesize()

gulp.task 'templates', ->
  # combine all template files of the app into a js file
  gulp
  .src [
    '!./app/index.html'
    './app/**/*.html'
  ]
  .pipe plugins.angularTemplatecache 'templates.js',
    module: 'dragonfly-templates'
    standalone: true
  .pipe gulp.dest './build'
  .pipe plugins.filesize()

gulp.task 'jade', ->
  gulp
  .src './app/index.jade'
  .pipe plugins.changed './build'
  .pipe plugins.jade pretty: on
    .on 'error', plugins.util.log
  .pipe gulp.dest './build'

gulp.task 'img', ->
  gulp.src './app/img/**/*', base: './app'
  .pipe plugins.changed './build'
  .pipe gulp.dest './build'

gulp.task 'vendor-js', ->
  # concatenate vendor JS files
  gulp
  .src [
    './components/angular/angular.min.js'
    './components/angular-route/angular-route.min.js'
    # './components/jquery/dist/jquery.min.js'
    # './components/bootstrap/dist/js/bootstrap.min.js'
  ]
  .pipe plugins.concat 'lib.js'
  .pipe gulp.dest './build'
  .pipe plugins.filesize()

gulp.task 'vendor-css', ->
  # concatenate vendor CSS files
  gulp
  .src [
    '!./components/**/*.min.css'
    './components/**/*.css'
  ]
  .pipe plugins.concat 'lib.css'
  .pipe gulp.dest './build'
  .pipe plugins.filesize()

gulp.task 'watch', ->
  gulp.watch './app/**/*.coffee', ['coffee']
  gulp.watch ['!./app/index.html', './app/**/*.html'], ['templates']
  gulp.watch './app/less/**/*.less', ['less']
  gulp.watch './app/index.jade', ['jade']
  gulp.watch [
    './build/**/*.html'
    './build/**/*.js'
    './build/**/*.css'
  ], (event) ->
    gulp
    .src event.path
    .pipe plugins.connect.reload()

gulp.task 'connect', ->
  plugins.connect.server
    root: ['build']
    host: SERVER_HOST
    port: SERVER_PORT
    livereload: true

gulp.task 'open', ['connect'], ->
  gulp.src "./build/index.html"
  .pipe plugins.open '', url: "http://#{SERVER_HOST}:#{SERVER_PORT}"

gulp.task 'server', ['connect', 'open', 'watch']
gulp.task 'build', ['coffee', 'less', 'templates', 'jade', 'img', 'vendor-js', 'vendor-css']
gulp.task 'default', ['build', 'watch', 'server']
