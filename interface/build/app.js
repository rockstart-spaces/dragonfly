'use strict';
var app;

app = angular.module('dragonfly', ['ngRoute']);

app.config(function($routeProvider) {
  return $routeProvider.otherwise({
    redirectTo: '/'
  });
});

app.controller('MainController', function($scope) {
  return $scope.ok = 'ok';
});
