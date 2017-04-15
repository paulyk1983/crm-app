(function() {
  angular.module('app').controller("inquiriesCtrl", ['$scope', '$http', function($scope, $http) {
   
    $scope.setup = function() {
      $http.get('/api/v1/inquiries.json').then(function(response) {
        $scope.inquiries = response.data;
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