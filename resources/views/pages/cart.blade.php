@extends('master')
@section('title', 'Giỏ hàng')
@section('content')
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
                <h1 class="h2">Giỏ hàng</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                    <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Giỏ hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <div class="container">
        <div class="row bar">
            <div class="col-lg-12">
                <p class="text-muted lead">Bạn có {!! Cart::count(); !!} sản phẩm trong giỏ hàng.</p>
            </div>
            <div id="basket" class="col-lg-9">
                <div class="box mt-0 pb-0 no-horizontal-padding">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="2">Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá gốc</th>
                                        <th>Giảm giá</th>
                                        <th colspan="2">Tổng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach(Cart::content() as $item)
                                    <tr>
                                        <td>
                                            <a href="#"><img src="img/{{ $item->options->thumbnail }}" alt="{{ $item->name }}" class="img-fluid"></a>
                                        </td>
                                        <td><a href="/product/{{$item->id}}">{{ $item->name }}</a></td>
                                        <td>
                                            <input type="number" value="{{ $item->qty }}" class="form-control">
                                        </td>
                                        <td>{{ number_format($item->price, 0, '.', ',')  }} đ</td>
                                        <td>$0.00</td>
                                        <td>{{ number_format(
                                                $item->qty * $item->price,
                                                0,
                                                '.',
                                                ','
                                            ) }} đ</td>
                                        <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5">Tổng cộng</th>
                                        <th colspan="2">{{number_format(intval(Cart::subtotal(0,'','','')), 0, '.', ',') }} đ</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="box-footer d-flex justify-content-between align-items-center">
                            <div class="left-col"><a href="shop" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i>Tiếp tục mua sắm</a></div>
                            <div class="right-col">
                                <button class="btn btn-secondary"><i class="fa fa-refresh"></i> Update cart</button>
                                <a href="checkout" class="btn btn-template-outlined">Đặt hàng<i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                </div>
                @include('recommend-side')
            </div>
            <div class="col-lg-3">
                @include('order-side')
                @include('discount-side')
            </div>
        </div>
    </div>
</div>
@endsection