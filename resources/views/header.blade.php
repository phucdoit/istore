<!-- Top bar-->
<!-- @if(count($errors)>0)
    <div role="alert" class="alert alert-danger">
        @foreach($errors->all() as $err)
        {{$err}}
        @endforeach
    </div>
@endif -->
@if($errors->first('login_error'))
    <div role="alert" class="alert alert-danger">
        {{$errors->first('login_error')}}
    </div>
@endif
<div class="top-bar">
    <div class="container">
        <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
                <p>Contact us on phucdoit@gmail.com.</p>
            </div>
            <div class="col-md-6">
                <div class="d-flex justify-content-md-end justify-content-between">
                    <ul class="list-inline contact-info d-block d-md-none">
                        <li class="list-inline-item"><a href="#"><i class="fa fa-phone"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>
                    @if(Auth::check())
                        <div class="login">
                            <span style="padding-right: 10px;">Chào, &nbsp {{Auth::user()->name}}</span>
                            <a href="sign-out" class="login-btn"><i class="fa fa-sign-out"></i><span class="d-none d-md-inline-block">Đăng xuất</span></a>
                        </div>
                    @else
                        <div class="login">
                            <a href="#" data-toggle="modal" data-target="#login-modal" class="login-btn"><i class="fa fa-sign-in"></i><span class="d-none d-md-inline-block">Đăng nhập</span></a>
                            <a href="login" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">Đăng ký</span></a>
                        </div>
                        <ul class="social-custom list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                        </ul>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Top bar end-->
<!-- Login Modal-->
<div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="login-modalLabel" class="modal-title">Đăng nhập</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <form action="sign-in" method="post">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div class="form-group">
                        <input id="email_modal" type="email" name="email" placeholder="Email" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <input id="password_modal" type="password" name="password" placeholder="Mật khẩu" class="form-control" required="">
                    </div>
                    <p class="text-center">
                        <button class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Đăng nhập</button>
                    </p>
                </form>
                <p class="text-center text-muted">Bạn chưa đăng ký?</p>
                <p class="text-center text-muted"><a href="login"><strong>Đăng ký ngay</strong></a>! Thật dễ dàng để đăng ký trong vòng 1 phút và nhận nhiều ưu đãi hơn!</p>
            </div>
        </div>
    </div>
</div>
<!-- Login modal end-->
<!-- Navbar Start-->
<header class="nav-holder make-sticky">
    <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
        <div class="container">
            <a href="home" class="navbar-brand home"><img src="img/logo3.png" alt="Universal logo" class="d-none d-md-inline-block"><img src="img/logo2.png" alt="Universal logo" class="d-inline-block d-md-none"><span class="sr-only">Universal - go to homepage</span></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown {{{ (Request::is('home') ? 'active' : 'menu-large') }}}"><a href="home">Trang chủ</a></li>
                    <li class="nav-item dropdown {{{ (Request::is('shop') ? 'active' : 'menu-large') }}}"><a href="shop">Cửa hàng</a></li>
                    <li class="nav-item dropdown {{{ (Request::is('cart') ? 'active' : 'menu-large') }}}"><a href="cart">Giỏ hàng</a></li>
                    <li class="nav-item dropdown {{{ (Request::is('contact') ? 'active' : 'menu-large') }}}"><a href="contact">Liên hệ</a></li>
                </ul>
            </div>
            <div id="search" class="collapse clearfix">
                <form role="search" class="navbar-form">
                    <div class="input-group">
                        <input type="text" placeholder="Search" class="form-control"><span class="input-group-btn">
                    <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<!-- Navbar End-->