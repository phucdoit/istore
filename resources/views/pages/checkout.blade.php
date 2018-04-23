@extends('master') @section('content')

<style type="text/css">
    .border-box {
        margin-bottom: 20px;
        border: 1px solid #ddd;
        /*border-bottom: 1px solid #ddd;*/
        padding: 20px;
    }
</style>
<main>
    <div id="all">
        <div id="heading-breadcrumbs">
            <div class="container">
                <div class="row d-flex align-items-center flex-wrap">
                    <div class="col-md-7">
                        <h1 class="h2">Checkout - Address</h1>
                    </div>
                    <div class="col-md-5">
                        <ul class="breadcrumb d-flex justify-content-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Checkout - Address</li>
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
                                                        <td>$0.00</td>
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
                                                    <input id="name" name="name" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="address">Địa chỉ</label>
                                                    <input id="address" name="address" type="text" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="phone">Số điện thoại</label>
                                                    <input id="phone" name="phone" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="email">Email</label>
                                                    <input id="email" name="email" type="text" class="form-control">
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
                                                    <h4>Cash on delivery</h4>
                                                    <p>You pay when you get it.</p>
                                                    <div class="box-footer text-center">
                                                        <input type="radio" name="payment" value="cash">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="box payment-method">
                                                    <h4>Paypal</h4>
                                                    <p>We like it all.</p>
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
    </div>
</main>
@endsection