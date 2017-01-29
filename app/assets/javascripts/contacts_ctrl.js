/* global angular */
(function() {
  angular.module('app').controller("contactsCtrl", ['$scope', '$http', function($scope, $http) {
   
    $scope.setup = function() {
      $http.get('/api/v1/contacts.json').then(function(response) {
        $scope.contacts = response.data;
      });
    };

  }]);

})();