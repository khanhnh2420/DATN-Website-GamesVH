app.controller("LoginController", function (AccountService, BcryptService, $scope, $window) {
    $scope.account = {}; // Thông tin người dùng nhập từ form
    $scope.user = {}; // Thông tin người dùng lấy từ Server
    $scope.rememberMe; // Lưu đăng nhập
    $scope.message = ($window.sessionStorage.getItem("messageLogin") != null) ? $window.sessionStorage.getItem("messageLogin") : null;// Trạng thái
    $window.sessionStorage.removeItem("messageLogin");


    // Trở về trang đăng nhập
    $scope.redirectToLogin = function () {
        $window.localStorage.removeItem("username");
        $window.sessionStorage.removeItem("username");
        $window.location.href = 'login.html';
    };

    $scope.login = function () {
        // Reset biến mỗi lần bấm đăng nhập
        $scope.LoginForm.$submitted = true;
        $scope.isValidPassword = false;
        $scope.message = "";

        if ($scope.LoginForm.$invalid) {
            // Form không hợp lệ, xử lý hiển thị lỗi
            return;
        } else {
            // Kiểm tra thông tin người dùng nhập
            if ($scope.account != null && $scope.account != undefined && $scope.account.username != null &&
                $scope.account.username != undefined && $scope.account.password != null && $scope.account.password != undefined) {

                // Call API lấy thông tin người dùng theo username
                AccountService.getByUsername($scope.account.username).then(function (user) {
                    $scope.user = user.data; // Thông tin user từ Server
                    if ($scope.user != null && $scope.user != undefined && $scope.user != "") {
                        // So sánh password người dùng nhập với password đã mã hóa 
                        BcryptService.compare($scope.account.password, $scope.user.password).then(function (isComparePassword) {
                            if (!$scope.user.status) {
                                // Kiểm tra tài khoản đã bị khóa hay chưa
                                $scope.message = "Tài khoản này đã bị khóa!";
                            } else if (!isComparePassword.data) {
                                // So sánh password người dùng nhập với password đã mã hóa
                                // Nếu không đúng thì xuất lỗi
                                $scope.isValidPassword = true;
                            } else if ($scope.user.role != "CUST") {
                                // Kiểm tra quyền của người dùng có phải là CUST hay không ?
                                $scope.message = "Bạn không có quyền truy cập trang này!";
                            } else {
                                // Kiểm tra xem người dùng có tích rememberMe không để xử lý tương ứng
                                $scope.userAccount = $scope.user.username;
                                if ($scope.rememberMe) {
                                    $scope.saveAccountToLocalStorage($scope.userAccount);
                                }
                                $scope.saveAccountToSessionStorage($scope.userAccount);

                                // Đăng nhập thành công trở về trang chủ
                                $window.location.href = '/';
                            }
                        }).catch(function (error) {
                            console.error('Lỗi khi so sánh password:', error);
                        });
                    } else {
                        $scope.message = "Tài khoản không tồn tại!";
                    }
                }).catch(function (error) {
                    console.error('Lỗi khi lấy thông tin tài khoản:', error);
                    $scope.LoginForm.$invalid = true;
                    $scope.login();
                });
            } else {
                // Set form về invalid để ném lỗi
                $scope.LoginForm.$invalid = true;
                $scope.login();
            }
        }
    };

    // Lưu account lên local storage để lưu đăng nhập khi người dùng check rememberMe
    $scope.saveAccountToLocalStorage = function (user) {
        $window.localStorage.setItem("username", user);
    }

    // Lưu account lên session storage để lưu đăng nhập trong phiên hiện tại
    $scope.saveAccountToSessionStorage = function (user) {
        $window.sessionStorage.setItem("username", user);
    }

    /*
 * Create form to request access token from Google's OAuth 2.0 server.
 */
    $scope.oauthSignIn = function () {
        // Google's OAuth 2.0 endpoint for requesting an access token
        var oauth2Endpoint = 'https://accounts.google.com/o/oauth2/v2/auth';

        // Parameters to pass to OAuth 2.0 endpoint.
        var params = {
            'client_id': '826014525988-k8mo1nf93legn462lbsrrjmbir6plrsc.apps.googleusercontent.com',
            'redirect_uri': 'http://localhost:3000',
            'response_type': 'token',
            'scope': 'https://www.googleapis.com/auth/drive.metadata.readonly',
            'include_granted_scopes': 'true',
            'state': 'pass-through value'
        };

        // Create the URL with query parameters
        var url = oauth2Endpoint + '?' + Object.keys(params).map(function (key) {
            return key + '=' + encodeURIComponent(params[key]);
        }).join('&');

        // Redirect to the URL
        window.location.href = url;
    }
});
