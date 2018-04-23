$(document).ready(function($) {
    // localStorage.clear();

    var shoppingCartItems = [];

    // Kiểm tra nếu đã có localStorage["shopping-cart-items"] hay chưa?
    if (localStorage["shopping-cart-items"] != null) {
        shoppingCartItems = JSON.parse(localStorage["shopping-cart-items"].toString());
    }
    // Hiển thị thông tin từ giỏ hàng
    // addProduct();

    var cartWrapper = $('.cd-cart-container');
    //product id - you don't need a counter in your real project but you can use your real product id

    if (cartWrapper.length > 0) {

        var productId = 0;

        //store jQuery objects
        var cartBody = cartWrapper.find('.body')
        var cartList = cartBody.find('ul').eq(0);
        var cartTotal = cartWrapper.find('.checkout').find('span');
        var cartTrigger = cartWrapper.children('.cd-cart-trigger');
        var cartCount = cartTrigger.children('.count')
        var addToCartBtn = $('.cd-add-to-cart');
        var undo = cartWrapper.find('.undo');
        var undoTimeoutId;

        //add product to cart
        addToCartBtn.on('click', function(event) {
            event.preventDefault();
            addToCart($(this));
        });

        //open/close cart
        cartTrigger.on('click', function(event) {
            event.preventDefault();
            toggleCart();
        });

        //close cart when clicking on the .cd-cart-container::before (bg layer)
        cartWrapper.on('click', function(event) {
            if ($(event.target).is($(this))) toggleCart(true);
        });

        //delete an item from the cart
        cartList.on('click', '.delete-item', function(event) {
            event.preventDefault();
            removeProduct($(event.target).parents('.product'));
        });
    }

    function toggleCart(bool) {
        var cartIsOpen = (typeof bool === 'undefined') ? cartWrapper.hasClass('cart-open') : bool;

        if (cartIsOpen) {
            cartWrapper.removeClass('cart-open');
            //reset undo
            clearInterval(undoTimeoutId);
            undo.removeClass('visible');
            cartList.find('.deleted').remove();

            setTimeout(function() {
                cartBody.scrollTop(0);
                //check if cart empty to hide it
                if (Number(cartCount.find('li').eq(0).text()) == 0) cartWrapper.addClass('empty');
            }, 500);
        } else {
            cartWrapper.addClass('cart-open');
        }
    }

    function addToCart(trigger) {
        var cartIsEmpty = cartWrapper.hasClass('empty');
        //update number of items 
        updateCartCount(cartIsEmpty);
        //update total price
        updateCartTotal(trigger.data('price'), true);
        console.log(trigger.data("id"));
        var id = trigger.data("id"); // id của sản phẩm là id của button
        var name = trigger.data("name"); // name của sản phẩm là thuộc tính dataname của button
        var thumbnail = trigger.data("thumbnail"); // name của sản phẩm là thuộc tính dataname của button
        var price = trigger.data("price"); // price của sản phẩm là thuộc tính data-price của button
        var quantity = 1; // Số lượng
        var item = {
            id: id,
            name: name,
            thumbnail: thumbnail,
            price: price,
            quantity: quantity
        };
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: 'POST',
            url: '/add-cart',
            data: {
                // _token: '{{csrf_token()}}',
                product_id: item.id,
                quantity: item.quantity
            },
            success: function(data) {
                console.log(data);
                // $("#msg").html(data.msg);
            },
            error: function(error) { // What to do if we fail
                console.log(error);
                alert('Đã xảy ra lỗi');
            }
        });

        var exists = false;
        if (shoppingCartItems.length > 0) {
            $.each(shoppingCartItems, function(index, value) {
                // Nếu mặt hàng đã tồn tại trong giỏ hàng thì chỉ cần tăng số lượng mặt hàng đó trong giỏ hàng.
                if (value.id == item.id) {
                    value.quantity++;
                    exists = true;
                    return false;
                }
            });
        }
        // console.log(shoppingCartItems);
        // Nếu mặt hàng chưa tồn tại trong giỏ hàng thì bổ sung vào mảng
        if (!exists) {
            shoppingCartItems.push(item);
        }
        // Lưu thông tin vào localStorage
        localStorage["shopping-cart-items"] = JSON.stringify(shoppingCartItems); // Chuyển thông tin mảng shoppingCartItems sang JSON trước khi lưu vào localStorage
        // Gọi hàm hiển thị giỏ hàng
        // displayShoppingCartItems();
        addProduct();
        //show cart
        cartWrapper.removeClass('empty');
    }

    function addProduct() {
        //this is just a product placeholder
        //you should insert an item with the selected product info
        //replace productId, productName, price and url with your real product info

        if (localStorage["shopping-cart-items"] != null) {
            shoppingCartItems = JSON.parse(localStorage["shopping-cart-items"].toString()); // Chuyển thông tin từ JSON trong localStorage sang mảng shoppingCartItems.
            cartList.html("");
            // Duyệt qua mảng shoppingCartItems để append từng item dòng vào table
            $.each(shoppingCartItems, function(index, item) {
                var htmlString = '';
                htmlString += '<li class="product">';
                htmlString += '<div class="product-image">';
                htmlString += '<a href="#0">';
                htmlString += '<img src="img/' + item.thumbnail + '" alt="placeholder">';
                htmlString += '</a></div>';
                htmlString += '<div class="product-details">';
                htmlString += '<div><p style="width: 100%;margin: 0;display: inline-flex;padding-right: 15px;"><span class="quantity">' + item.quantity + 'x&nbsp</span>';
                htmlString += '<a href="product/' + item.id + '">' + item.name + '</a></p><span class="cd-price">' + item.price + '</span></div>';
                htmlString += '<div class="actions"><a href="#0" class="delete-item">x</a>';
                htmlString += '</div></div></li>';
                cartList.prepend(htmlString);
            });
        }
    }

    function removeProduct(product) {
        clearInterval(undoTimeoutId);
        cartList.find('.deleted').remove();

        var topPosition = product.offset().top - cartBody.children('ul').offset().top,
            productQuantity = Number(product.find('.quantity').find('select').val()),
            productTotPrice = Number(product.find('.price').text().replace('$', '')) * productQuantity;

        product.css('top', topPosition + 'px').addClass('deleted');

        //update items count + total price
        updateCartTotal(productTotPrice, false);
        updateCartCount(true, -productQuantity);
        undo.addClass('visible');

        //wait 8sec before completely remove the item
        undoTimeoutId = setTimeout(function() {
            undo.removeClass('visible');
            cartList.find('.deleted').remove();
        }, 8000);
    }

    function updateCartCount(emptyCart, quantity) {
        if (typeof quantity === 'undefined') {
            console.log(getQtyItemOfCart());
            var actual = getQtyItemOfCart() + 1;
            var next = actual + 1;

            if (emptyCart) {
                cartCount.find('li').eq(0).text(actual);
                cartCount.find('li').eq(1).text(next);
            } else {
                cartCount.addClass('update-count');

                setTimeout(function() {
                    cartCount.find('li').eq(0).text(actual);
                }, 150);

                setTimeout(function() {
                    cartCount.removeClass('update-count');
                }, 200);

                setTimeout(function() {
                    cartCount.find('li').eq(1).text(next);
                }, 230);
            }
        } else {
            var actual = Number(cartCount.find('li').eq(0).text()) + quantity;
            var next = actual + 1;

            cartCount.find('li').eq(0).text(actual);
            cartCount.find('li').eq(1).text(next);
        }
    }

    function updateCartTotal(price, bool) {
        var total = getCartTotal();
        cartTotal.text(total);
    }

    function updateCartTotal(price, bool) {
        bool ? cartTotal.text((Number(cartTotal.text()) + Number(price)).toFixed(2)) : cartTotal.text((Number(cartTotal.text()) - Number(price)).toFixed(2));
    }

    function getQtyItemOfCart() {
        var qty = 0;
        $.each(shoppingCartItems, function(index, item) {
            qty += item.quantity;
        });
        return qty;
    }

    function getCartTotal() {
        var total = 0;
        $.each(shoppingCartItems, function(index, item) {
            total += item.price;
        });
        return total;
    }

    function updateCartTotal(price, bool) {
        bool ? cartTotal.text((Number(cartTotal.text()) + Number(price)).toFixed(2)) : cartTotal.text((Number(cartTotal.text()) - Number(price)).toFixed(2));
    }
});