@extends('master')
@section('title', 'Thanh toán')
@section('content')
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
                <h1 class="h2">Đặt hàng</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Đặt hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <div class="container">
        <div class="row">
            @if(count($errors) > 0)
                <div class="spacer"></div>
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{!! $error !!}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <div id="checkout" class="col-lg-9">
                <div class="box border-bottom-0">
                    <form method="post" action="create-order">
                        <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                        <ul class="nav nav-pills nav-fill">
                            <li class="nav-item">
                                <div class="nav-link active"><i class="fa fa-eye"></i>
                                    <br>Chi tiết đơn hàng</div>
                            </li>
                        </ul>
                        <div class="content">

                            <!-- cart -->
                            <div class="border-box box mt-0 pb-0 no-horizontal-padding">
                                <div class="table-responsive">
                                    <p> <b>Thông tin sản phẩm</b></p>
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
                                                <th>{!! Cart::subtotal(); !!} đ</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            

                            <!-- name -->
                           <div class="border-box">
                                <p> <b>Thông tin đơn hàng</b></p>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="name">Họ tên người nhận</label>
                                            <input id="name" name="name" type="text" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="address">Địa chỉ</label>
                                            <input id="address" name="address" type="text" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại</label>
                                            <input id="phone" name="phone" type="text" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input id="email" name="email" type="email" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- payment -->
                            <div class="border-box">
                                <p> <b>Thông tin thanh toán</b></p>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="box payment-method">
                                            <h4>Thanh toán khi giao hàng</h4>
                                            <p>Bạn trả tiền khi đã nhận được hàng.</p>
                                            <div class="box-footer text-center">
                                                <input type="radio" name="payment" value="cash" checked="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="box payment-method">
                                            <h4>Thanh toán trực tuyến</h4>
                                            <p>Sử dụng các ngân hàng để thanh toán trực tuyến.</p>
                                            <div class="box-footer text-center">
                                                <input type="radio" name="payment" value="paypal">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
                            <div class="left-col"><a href="cart" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i>Quay lại trang giỏ hàng</a></div>
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
@endsection