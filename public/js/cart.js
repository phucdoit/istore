$(document).ready(function($) {
    localStorage.clear();

    var shoppingCartItems = [];

    getCart();

    var token = $('meta[name="csrf-token"]').attr('content');

    var cartWrapper = $('.cd-cart-container');
    // sau khi dã load xong cart
    if (cartWrapper.length > 0) {
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
        $.ajax({
            type: 'POST',
            url: '/add-cart',
            data: {
                _token: token,
                product_id: item.id,
                quantity: item.quantity
            },
            success: function(data) {
                updateCartCount(data.count);
                updateCartTotal(data.subtotal);
                shoppingCartItems = parseCartContent(data.content);
                console.log(data);
                showCart();
            },
            error: function(error) { // What to do if we fail
                console.log(error);
                alert('Đã xảy ra lỗi addToCart');
            }
        });

        showCart();
        cartWrapper.removeClass('empty');
    }

    function showCart() {
		var cartWrapper = $('.cd-cart-container');
        var cartBody = cartWrapper.find('.body')
        var cartList = cartBody.find('ul').eq(0);
        if (shoppingCartItems != null) {
            cartList.html("");
            // Duyệt qua mảng shoppingCartItems để append từng item dòng vào table
            // console.log(shoppingCartItems);
            $.each(shoppingCartItems, function(index, item) {
                var htmlString = '';
                htmlString += '<li class="product">';
                htmlString += '<div class="product-image">';
                htmlString += '<a href="#0">';
                htmlString += '<img src="img/' + item.thumbnail + '" alt="placeholder">';
                htmlString += '</a></div>';
                htmlString += '<div class="product-details">';
                htmlString += '<div><p style="width: 100%;margin: 0;display: inline-flex;padding-right: 15px;"><span class="quantity">' + item.quantity + 'x&nbsp</span>';
                htmlString += '<a href="product/' + item.id + '">' + item.name + '</a></p><span class="cd-price">' + formatNumber(item.price) + ' đ</span></div>';
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

    function updateCartCount(count) {
    	cartCount.find('li').eq(0).text(count);
    }

    function updateCartTotal(subtotal) {
        cartTotal.text(subtotal + ' đ');
    }

    function loadCart() {
    	// body...
    }

    function parseCartContent(cartContent) {
		var items = [];
		$.each(cartContent, function( key, value ) {
			var item = {
	            id: value.id,
	            name: value.name,
	            thumbnail: value.options.thumbnail,
	            price: value.price,
	            quantity: value.qty
	        };
	        items.push(item);
		});
		return items;
    }

    function getCart() {
        var cart = [];
        $.ajax({
            type: 'GET',
            url: '/get-cart-content',
            success: function(data) {
                console.log(data);
				updateCartCount(data.count);
                updateCartTotal(data.subtotal);
                shoppingCartItems = parseCartContent(data.content);
				showCart();
            },
            error: function(error) {
                alert('Đã xảy ra lỗi get cart');
            }
        });
    }

    function formatNumber(number){
        number = number.toFixed(2) + '';
        x = number.split('.');
        x1 = x[0];
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1;
    }

});