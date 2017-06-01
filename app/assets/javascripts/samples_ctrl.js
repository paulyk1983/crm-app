/* global angular */
(function() {
  angular.module('app').controller("samplesCtrl", ['$scope', '$http', function($scope, $http) {
   
    $scope.setup = function() {
      $http.get('/api/v1/samples.json').then(function(response) {
        $scope.samples = response.data;
        $scope.attribute = "name";
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