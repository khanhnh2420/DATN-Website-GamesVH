app.controller('GoogleSigninController', function ($location, $window, GoogleService, AccountService, AuthorityService) {
    var currentUrl = $location.url();

    // Xử lý URL hiện tại với các tham số query
    if (currentUrl.includes('access_token')) {
        // Lấy access token từ URL
        var url = window.location.href;

        // Tìm vị trí của tham số 'access_token' trong chuỗi URL
        var start = url.indexOf('access_token=');
        if (start !== -1) {
            // Tìm vị trí của ký tự '&' tiếp theo sau tham số 'access_token'
            var end = url.indexOf('&', start);

            // Cắt chuỗi từ vị trí start+13 (độ dài của 'access_token=') đến end
            var accessToken = url.substring(start + 13, end);

            // Gửi yêu cầu HTTP tới Google API để lấy thông tin người dùng
            GoogleService.getUserInfo(accessToken).then(function (userInfo) {
                var user = userInfo.data;
                // Tạo account với thông tin từ email của người dùng và pass mặc định là 123
                var account = {
                    "username": user.email,
                    "password": "123",
                    "fullname": user.name,
                    "email": user.email,
                    "photo": "user.png",
                    "status": true
                }

                // Tạo account trên database với thông tin của email người dùng
                AccountService.createAccount(account).then(function (account) {
                    var account = account.data;
                    var auth = {
                        "account": account,
                        "role": {
                            "id": "CUST",
                            "name": "Người Dùng"
                        }
                    }
                    // Tạo role cho account 
                    AuthorityService.creatAuthority(auth).then(function (authority) {
                    }).catch(function (error) {
                        console.error('Lỗi khi tạo role cho account:', error);
                    });

                    if (account.id != null) {
                        $window.sessionStorage.setItem("username", account.username);
                        $window.location.href = '/';
                    } else {
                        // Kiểm tra nếu đã tồn tại username là email đó thì lấy ra
                        AccountService.getByUsername(account.email).then(function (accountByUsername) {
                            var accountData = accountByUsername.data;
                            if (accountData != null) {
                                $window.sessionStorage.setItem("username", accountData.username);
                                $window.location.href = '/';
                            }
                        }).catch(function (error) {
                            console.error('Lỗi khi tìm account theo email:', error);
                        });

                        // Kiểm tra nếu đã tồn tại email đó thì lấy ra username
                        AccountService.getByEmail(account.email).then(function (accountByEmail) {
                            var accountDataEmail = accountByEmail.data;
                            if (accountDataEmail != null) {
                                $window.sessionStorage.setItem("username", accountDataEmail.username);
                            }
                        }).catch(function (error) {
                            console.error('Lỗi khi tìm account theo email:', error);
                            $window.location.href = 'login.html';
                        });
                    }
                }).catch(function (error) {
                    console.error('Lỗi khi thêm account:', error);
                    $window.location.href = 'login.html';
                });

            }).catch(function (error) {
                console.error('Lỗi khi lấy thông tin tài khoản gmail:', error);
                $window.location.href = 'login.html';
            });
        } else {
            console.log('Không tìm thấy access token trong URL');
        }
    }
});
