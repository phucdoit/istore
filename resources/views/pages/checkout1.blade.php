@extends('master')
@section('content')
<div id="all">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Đặt hàng - Địa chỉ</h1>
                </div>
                <div class="col-md-5">
                    <ul class="breadcrumb d-flex justify-content-end">
                        <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Đặt hàng - Địa chỉ</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <div class="row">
                <div id="checkout" class="col-lg-9">
                    <div class="box border-bottom-0">
                        <form method="post" action="checkout1">
                            <ul class="nav nav-pills nav-fill">
                                <li class="nav-item">
                                    <a href="checkout1" class="nav-link active"> <i class="fa fa-map-marker"></i><br>Địa chỉ</a>
                                </li>
                                <li class="nav-item">
                                    <a href="checkout2" class="nav-link disabled"><i class="fa fa-truck"></i><br>Phương thức giao hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a href="checkout3" class="nav-link disabled"><i class="fa fa-money"></i><br>Phương thức thanh toán</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link disabled"><i class="fa fa-eye"></i><br>Đơn hàng</a>
                                </li>
                            </ul>
                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">Firstname</label>
                                            <input id="firstname" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">Lastname</label>
                                            <input id="lastname" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="company">Company</label>
                                            <input id="company" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="street">Street</label>
                                            <input id="street" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="city">City</label>
                                            <input id="city" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="zip">ZIP</label>
                                            <input id="zip" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="state">State</label>
                                            <select id="state" class="form-control"></select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="country">Country</label>
                                            <select id="country" class="form-control"></select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="phone">Telephone</label>
                                            <input id="phone" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input id="email" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
                                <div class="left-col"><a href="cart" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i>Quay lại giỏ hàng</a></div>
                                <div class="right-col">
                                    <button type="submit" class="btn btn-template-main">Tiếp tục tới phương thức giao hàng<i class="fa fa-chevron-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
					@include('order-side')
                </div>
            </div>
        </div>
    </div>
</div>
@endsection