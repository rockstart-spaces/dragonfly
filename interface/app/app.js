'use strict';

angular.module('interface', [ 'ngRoute','interface-main','templates' ])
  .config(function ($routeProvider) {
    $routeProvider
      .otherwise({
        redirectTo: '/'
      });
  });