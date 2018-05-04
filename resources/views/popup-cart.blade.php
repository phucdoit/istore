<!-- <div class="cd-cart-container empty"> -->
<div class="cd-cart-container">
    <a href="#0" class="cd-cart-trigger">
        Cart
        <ul class="count"> <!-- cart items count -->
            <li>0</li>
            <li>0</li>
        </ul> <!-- .count -->
    </a>

    <div class="cd-cart">
        <div class="wrapper">
            <header>
                <h2>Giỏ hàng</h2>
                <!-- <span class="undo">Item removed. <a href="#0">Undo</a></span> -->
            </header>
            
            <div class="body">
                <ul>
                    <!-- products added to the cart will be inserted here using JavaScript -->
                </ul>
            </div>

            <footer>
                <a href="cart" class="checkout btn"><em>Thanh toán - <span>0</span></em></a>
            </footer>
        </div>
    </div> <!-- .cd-cart -->
</div> <!-- cd-cart-container -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
    if( !window.jQuery ) document.write('<script src="js/jquery-3.0.0.min.js"><\/script>');
</script>
<script src="js/cart.js"></script> <!-- Resource jQuery -->
<!-- <script src="js/main-cart.js"></script> <!-- Resource jQuery -->
