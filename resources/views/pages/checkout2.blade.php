@extends('master')
@section('content')
<div id="all">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Đặt hàng - Phương thức giao hàng</h1>
                </div>
                <div class="col-md-5">
                    <ul class="breadcrumb d-flex justify-content-end">
                        <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Đặt hàng - Phương thức giao hàng</li>
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
                        <form method="post" action="checkout2">
                            <ul class="nav nav-pills nav-fill">
                                <li class="nav-item">
                                    <a href="checkout1" class="nav-link"> <i class="fa fa-map-marker"></i><br>Địa chỉ</a>
                                </li>
                                <li class="nav-item">
                                    <a href="checkout2" class="nav-link active"><i class="fa fa-truck"></i><br>Phương thức giao hàng</a>
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
							            <div class="box shipping-method">
							                <h4>Giao hàng nhanh</h4>
							                <p>Get it right on next day - fastest option possible.</p>
							                <div class="box-footer text-center">
							                    <input type="radio" name="delivery" value="delivery1">
							                </div>
							            </div>
							        </div>
							        <div class="col-sm-6">
							            <div class="box shipping-method">
							                <h4>Giao hàng tiết kiệm</h4>
							                <p>Get it right on next day - fastest option possible.</p>
							                <div class="box-footer text-center">
							                    <input type="radio" name="delivery" value="delivery2">
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
							<div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
							    <div class="left-col"><a href="checkout1" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i>Quay lại  Địa chỉ</a></div>
							    <div class="right-col">
							        <button type="submit" class="btn btn-template-main">Tiếp tục tới phương thức thanh toán<i class="fa fa-chevron-right"></i></button>
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