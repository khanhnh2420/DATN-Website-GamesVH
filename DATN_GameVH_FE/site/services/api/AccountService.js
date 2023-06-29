app.factory('AccountService', function ($http) {
    var baseUrl = host + '/api/account';

    return {
        getAll: function () {
            return $http.get(baseUrl + '/getAll');
        },
        getAllProductByCategory: function (categoryId) {
            return $http.get(baseUrl + '/getProduct/' + categoryId);
        }
    };
});
