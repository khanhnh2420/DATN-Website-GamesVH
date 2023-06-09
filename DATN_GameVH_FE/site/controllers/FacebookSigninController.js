function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
        testAPI();
    }
}

function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function (response) {   // See the onlogin handler
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function () {
    FB.init({
        appId: '239944008587219',
        cookie: true,                     // Enable cookies to allow the server to access the session.
        xfbml: true,                     // Parse social plugins on this webpage.
        version: 'v17.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
        statusChangeCallback(response);        // Returns the login status.
    });
};

function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    FB.api('/me', function (response) {
        // Sử dụng createAccount()
        var account = {
            "username": response.id,
            "password": "123",
            "fullname": response.name,
            "email": null,
            "photo": "user.png",
            "status": true
        }

        createAccount(account);
    });
}

function createAccount(user) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", host + '/api/account/create');
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onload = function () {
        if (xhr.status === 200) {
            var account = JSON.parse(xhr.responseText);
            var auth = {
                "account": account,
                "role": {
                    "id": "CUST",
                    "name": "Người Dùng"
                }
            }

            createAuthority(auth)

            window.sessionStorage.setItem("username", account.username);
            window.location.href = '/';
        } else {
            console.error("Lỗi khi tạo tài khoản:", xhr.statusText);
        }
    };

    xhr.onerror = function () {
        console.error("Lỗi khi tạo tài khoản");
    };

    xhr.send(JSON.stringify(user));
}

function createAuthority(auth) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", host + '/api/authority/create');
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onload = function () {
        if (xhr.status === 200) {
            var authority = JSON.parse(xhr.responseText);
        } else {
            console.error("Lỗi khi tạo role cho tài khoản:", xhr.statusText);
        }
    };

    xhr.onerror = function () {
        console.error("Lỗi khi tạo role cho tài khoản");
    };

    xhr.send(JSON.stringify(auth));
}