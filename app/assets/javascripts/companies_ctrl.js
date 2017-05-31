/* global angular */
(function() {
  angular.module('app').controller("companiesCtrl", ['$scope', '$http', function($scope, $http) {
   
    $scope.setup = function() {
      $http.get('/api/v1/companies.json').then(function(response) {
        $scope.products = response.data;
        $scope.attribute = "sku";
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