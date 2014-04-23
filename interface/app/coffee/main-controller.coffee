app.controller 'MainController', ($scope, $window, $sce) ->
  youtubeResults = [
      id: 'qnpiInPMh3M'
      name: 'Rockstart Accelerator Demo Day 2013'
      thumbnail: 'https://i1.ytimg.com/vi/qnpiInPMh3M/1.jpg'
      description: 'Rockstart Accelerator second Demo Day took place on June
      13, 2013 in  the  massive industrial venue of the Kromhoutal in Amsterdam.'
    ,
      id: 'hqEh0iFWlgs'
      name: 'Holland. The Original Cool. The Beginning.'
      thumbnail: 'https://i1.ytimg.com/vi/hqEh0iFWlgs/1.jpg'
      description: 'Learn more about The Original Cool at: holland.com/cool'
  ]

  $scope.videos = []

  $scope.play = (video) ->
    $window.alert 'TODO!'

  $scope.$watch 'searchQuery', ->
    unless $scope.searchQuery
      $scope.videos = []
      return

    $scope.videos = do ->
      youtubeResults
      .filter (r) -> r.name.toLowerCase().indexOf($scope.searchQuery.toLowerCase()) > -1

