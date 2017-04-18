/* global angular */
(function() {
  angular.module('app').controller("productsCtrl", ['$scope', '$http', function($scope, $http) {
   
    $scope.setup = function() {
      $http.get('/api/v1/products.json').then(function(response) {
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