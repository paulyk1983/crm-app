(function() {
  angular.module('app').controller("quotesCtrl", ['$scope', '$http', function($scope, $http) {
   
    $scope.setup = function() {
      $http.get('/api/v1/quotes.json').then(function(response) {
        $scope.quotes = response.data;
        $scope.attribute = "first_name";
        $scope.sortOrder = false;
      });
    };

    $scope.changeOrder = function(attribute) {
      if ($scope.sortOrder) {
        $scope.sortOrder = false;  
      } else {
        $scope.sortOrder = true;
      }
      $scope.attribute = attribute;
    }

  }]);

})();