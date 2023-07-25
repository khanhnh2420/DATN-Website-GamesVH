app.controller("WishlistController", function($scope, AccountService, ProductService, WishlistService, $http) {
    $scope.favorite = []
    $scope.favoriteLength;
    $scope.account = {}; // Biến lưu thông tin account 
    $scope.username = null;




    $scope.logout = function() {
        $window.localStorage.removeItem("username");
        $window.sessionStorage.removeItem("username");
        $window.sessionStorage.setItem("messageLogin", "Bạn đã đăng xuất!");
        $window.location.href = 'login.html';
    };

    AccountService.checkLogin().then(function(account) {
        // Người dùng đã đăng nhập
        $scope.account = account;
        fetchWishlistItems()
    }).catch(function(error) {
        // Người dùng chưa đăng nhập hoặc có lỗi
        console.error('Lỗi đăng nhập hoặc chưa đăng nhập:', error);
        if (error === "Người dùng chưa đăng nhập") {
            // Xử lý logic khi người dùng chưa đăng nhập
            $window.localStorage.removeItem("username");
            $window.sessionStorage.removeItem("username");
            $window.sessionStorage.setItem("messageLogin", "Vui lòng đăng nhập!");
            $window.location.href = 'login.html';
        }
    });

    function fetchWishlistItems() {
        if ($scope.account && $scope.account.id) {
            var accountId = $scope.account.id;
            // Gọi WishlistService để lấy danh sách yêu thích
            WishlistService.getWishlist(accountId)
                .then(function(response) {
                    // Gán dữ liệu danh sách yêu thích vào biến $scope.favorite
                    $scope.favorite = response.data;

                    // Cập nhật số lượng sản phẩm yêu thích vào phần tử có class "wishlist-count"
                    $scope.favoriteLength = $scope.favorite.length;
                })
                .catch(function(error) {
                    console.error('Lỗi khi lấy danh sách yêu thích:', error);
                });
        }
    }


    $scope.toggleFavorite = function(event) {
        var productId = event.currentTarget.getAttribute('data-product-id');
        var existingFavorite = $scope.favorite.find(function(item) {
            return item.product.id === productId;
        });

        if (existingFavorite) {
            // Sản phẩm đã tồn tại trong danh sách yêu thích
            existingFavorite.status = !existingFavorite.status; // Đảo ngược trạng thái yêu thích

            WishlistService.updateFavorite(existingFavorite)
                .then(function(response) {
                    // Xử lý phản hồi từ máy chủ nếu cần
                    console.log('Cập nhật trạng thái sản phẩm thành công.');

                    // Cập nhật số lượng yêu thích sau khi thay đổi trạng thái
                    $scope.favoriteLength = $scope.favorite.filter(function(item) {
                        return item.status === true;
                    }).length;
                })
                .catch(function(error) {
                    console.error('Lỗi khi cập nhật sản phẩm yêu thích:', error);
                });
        } else {
            // Sản phẩm chưa tồn tại trong danh sách yêu thích, thêm mới vào
            ProductService.getProduct(productId)
                .then(function(response) {
                    var product = response.data;
                    if (product.available && product.qty > 0) {
                        var favoriteData = {
                            account: {
                                id: $scope.account.id
                            },
                            product: {
                                id: productId
                            },
                            status: true // Trạng thái mặc định là true khi thêm mới vào danh sách yêu thích
                        };

                        WishlistService.addWishlist(favoriteData)
                            .then(function(response) {
                                // Xử lý phản hồi từ máy chủ nếu cần
                                console.log('Thêm sản phẩm vào danh sách yêu thích thành công.');
                                // Thêm sản phẩm mới vào danh sách yêu thích hiển thị
                                $scope.favorite.push(response.data);

                                // Cập nhật số lượng yêu thích sau khi thêm sản phẩm
                                $scope.favoriteLength = $scope.favorite.filter(function(item) {
                                    return item.status === true;
                                }).length;
                            })
                            .catch(function(error) {
                                console.error('Lỗi khi thêm sản phẩm vào danh sách yêu thích:', error);
                            });
                    }
                })
                .catch(function(error) {
                    console.error('Lỗi khi lấy sản phẩm theo Id:', error);
                });
        }
    };


    $scope.removeFromFavorite = function(event) {
        var productId = event.currentTarget.getAttribute('data-product-id');
        var existingFavoriteIndex = false;
        $scope.favorite.forEach(function(item) {
            if (item.product.id === parseInt(productId)) {
                existingFavoriteIndex = true;
            }
        });
        if (existingFavoriteIndex) {
            // Xoá sản phẩm khỏi danh sách yêu thích


            WishlistService.removeFromWishlist(productId)
                .then(function() {
                    // Xử lý phản hồi từ máy chủ nếu cần
                    console.log('Xoá sản phẩm khỏi danh sách yêu thích thành công.');

                    // Hiển thị thông báo thành công
                    showSuccessToast("Sản phẩm đã xóa thành công");

                    // Cập nhật số lượng yêu thích sau khi xoá sản phẩm
                    $scope.favoriteLength = $scope.favorite.filter(function(item) {
                        return item.status === true;
                    }).length;

                    // Lấy danh sách yêu thích mới sau khi đã xoá thành công
                    fetchWishlistItems();
                })
                .catch(function(error) {
                    console.error('Lỗi khi xoá sản phẩm khỏi danh sách yêu thích:', error);
                });

        }
    };

    // Thông báo Toast Success
    function showSuccessToast(message) {
        var toastMessage = message || "Sản phẩm đã được xóa thành công.";
        toast({
            title: "Thành công!",
            message: toastMessage,
            type: "success",
            duration: 5000
        });
    }

    // Toast function
    function toast({ title = "", message = "", type = "info", duration = 3000 }) {
        const main = document.getElementById("toast");
        if (main) {
            const toast = document.createElement("div");

            // Auto remove toast
            const autoRemoveId = setTimeout(function() {
                main.removeChild(toast);
            }, duration + 1000);

            // Remove toast when clicked
            toast.onclick = function(e) {
                if (e.target.closest(".toast__close")) {
                    main.removeChild(toast);
                    clearTimeout(autoRemoveId);
                }
            };

            const icons = {
                success: "fas fa-check-circle",
                info: "fas fa-info-circle",
                warning: "fas fa-exclamation-circle",
                error: "fas fa-exclamation-circle"
            };
            const icon = icons[type];
            const delay = (duration / 1000).toFixed(2);

            toast.classList.add("toastDesign", `toast--${type}`);
            toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;

            toast.innerHTML = `
                      <div class="toast__icon">
                          <i class="${icon}"></i>
                      </div>
                      <div class="toast__body">
                          <h3 class="toast__title">${title}</h3>
                          <p class="toast__msg">${message}</p>
                      </div>
                      <div class="toast__close">
                          <i class="fas fa-times"></i>
                      </div>
                  `;
            main.appendChild(toast);
        }
    };

}).filter('vndFormat', function() {
    return function(input) {
        if (!input) return '';

        // Chuyển đổi số về dạng chuỗi và đảm bảo nó là một số
        var number = parseFloat(input);

        // Kiểm tra xem có phải là một số hợp lệ hay không
        if (isNaN(number)) return input;

        // Định dạng số về VD: "100,000 VND"
        var formattedNumber = number.toLocaleString('vi-VN');
        formattedNumber += ' VND';

        return formattedNumber;
    };
});