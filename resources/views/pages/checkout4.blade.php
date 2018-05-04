@extends('master')
@section('content')
<div id="all">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Đặt hàng - Đơn hàng</h1>
                </div>
                <div class="col-md-5">
                    <ul class="breadcrumb d-flex justify-content-end">
                        <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Đặt hàng - Đơn hàng</li>
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
                        <form method="post" action="checkout4">
                            <ul class="nav nav-pills nav-fill">
                                <li class="nav-item">
                                    <a href="checkout1" class="nav-link"> <i class="fa fa-map-marker"></i><br>Địa chỉ</a>
                                </li>
                                <li class="nav-item">
                                	<a href="checkout2" class="nav-link"><i class="fa fa-truck"></i><br>Phương thức giao hàng</a>
                                </li>
                                <li class="nav-item">
                                	<a href="checkout3" class="nav-link"><i class="fa fa-money"></i><br>Phương thức thanh toán</a>
                                </li>
                                <li class="nav-item">
                                	<a href="#" class="nav-link active"><i class="fa fa-eye"></i><br>Đơn hàng</a>
                                </li>
                            </ul>
							<div class="content">
							    <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th colspan="2">Sản phẩm</th>
                                                <th>Số lượng</th>
                                                <th>Giá gốc</th>
                                                <th>Giảm giá</th>
                                                <th>Tổng cộng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        @foreach(Cart::content() as $item)
                                            <tr>
                                                <td>
                                                    <a href="#"><img src="img/{{ $item->options->thumbnail }}" alt="{{ $item->name }}" class="img-fluid"></a>
                                                </td>
                                                <td><a href="/product/{{$item->id}}">{{ $item->name }}</a></td>
                                                <td>{{ $item->qty }}</td>
                                                <td>{{ $item->price }} đ</td>
                                                <td>0.00 đ</td>
                                                <td>{{$item->total}} đ</td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="5">Total</th>
                                                <th>{!! Cart::subtotal(0); !!} đ</th>
                                            </tr>
                                        </tfoot>
                                    </table>
							    </div>
							</div>
							<div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
							    <div class="left-col"><a href="checkout3" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i>Quay lại phương thức thanh toán</a></div>
							    <div class="right-col">
							        <button type="submit" class="btn btn-template-main">Đặt hàng<i class="fa fa-chevron-right"></i></button>
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