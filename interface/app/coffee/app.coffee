'use strict'

app = angular.module 'dragonfly', [
  'ngRoute'
]

app.config ($routeProvider) ->
  $routeProvider.otherwise redirectTo: '/'
