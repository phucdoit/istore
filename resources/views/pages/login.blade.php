@extends('master')
@section('title', 'Đăng ký')
@section('content')
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
                <h1 class="h2">New Account / Sign In</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">New Account / Sign In</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <div class="container">
        @if(Auth::check())
            <div class="row">
                <div class="col-lg-12">
                    <div style="text-align: center; padding: 50px;">
                        <a href="sign-out" class="login-btn"><i class="fa fa-sign-out"></i><span class="d-none d-md-inline-block">Đăng xuất</span></a>
                    </div>
                </div>
            </div>
        @else
            <div class="row">
                <div class="col-lg-6">
                    <div class="box">
                        @if($errors->first('login_error'))
                            <div role="alert" class="alert alert-danger">
                                {{$errors->first('login_error')}}
                            </div>
                        @endif
                        @if(Session::has('ok'))
                            <div role="alert" class="alert alert-success">{{Session::get('ok')}}</div>
                        @endif
                        <h2 class="text-uppercase">Tạo tài khoản mới</h2>
                        <p class="lead">Trước đây bạn không phải là khách hàng của chúng tôi?</p>
                        <p>Chỉ chưa tới một phút, hãy đăng ký thành viên với chúng tôi để được hưởng nhiều ưu đãi.</p>
                        <p class="text-muted">Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ<a href="contact">với chúng tôi</a>, trung tâm chăm sóc khách hàng luôn làm việc 24/7.</p>
                        <hr>
                        <form action="sign-up" method="post">
                            <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                            <div class="form-group">
                                <label for="name-login">Tên</label>
                                <input id="name-login" name="name" type="text" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="email-login">Email</label>
                                <input id="email-login" name="email" type="email" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="password-login">Mật khẩu</label>
                                <input id="password-login" name="password" type="password" class="form-control" required="">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-template-outlined"><i class="fa fa-user-md"></i> Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="box">
                        <h2 class="text-uppercase">Đăng nhập</h2>
                        <p class="lead">Bạn đã là thành viên của chúng tôi?</p>
                        <p class="text-muted">Đăng nhập để hưởng các ưu đãi dành riêng cho bạn.</p>
                        <hr>
                        <form action="sign-in" method="post">
                            <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input id="email" name="email" type="email" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input id="password" name="password" type="password" class="form-control" required="">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Đăng nhập</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        @endif
    </div>
</div>
@endsection