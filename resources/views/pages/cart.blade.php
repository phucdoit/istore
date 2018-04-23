@extends('master')
@section('content')
<main>
    <div id="all">
        <div id="heading-breadcrumbs">
            <div class="container">
                <div class="row d-flex align-items-center flex-wrap">
                    <div class="col-md-7">
                        <h1 class="h2">Shopping Cart</h1>
                    </div>
                    <div class="col-md-5">
                        <ul class="breadcrumb d-flex justify-content-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Shopping Cart</li>
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
                                                <th colspan="2">Tổng cộng</th>
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
                                                <td>{{ $item->price }} đ</td>
                                                <td>$0.00</td>
                                                <td>{{$item->total}} đ</td>
                                                <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="5">Total</th>
                                                <th colspan="2">{!! Cart::subtotal(); !!} đ</th>
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
                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="box text-uppercase mt-0 mb-2">
                                    <h3>You may also like these products</h3>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product">
                                    <div class="image">
                                        <a href="shop-detail.html"><img src="img/product2.jpg" alt="" class="img-fluid image1"></a>
                                    </div>
                                    <div class="text">
                                        <h3 class="h5"><a href="shop-detail.html">Fur coat</a></h3>
                                        <p class="price">$143</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product">
                                    <div class="image">
                                        <a href="shop-detail.html"><img src="img/product3.jpg" alt="" class="img-fluid image1"></a>
                                    </div>
                                    <div class="text">
                                        <h3 class="h5"><a href="shop-detail.html">Fur coat</a></h3>
                                        <p class="price">$143</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product">
                                    <div class="image">
                                        <a href="shop-detail.html"><img src="img/product1.jpg" alt="" class="img-fluid image1"></a>
                                    </div>
                                    <div class="text">
                                        <h3 class="h5"><a href="shop-detail.html">Fur coat</a></h3>
                                        <p class="price">$143</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        @include('order-side')
                        @include('discount-side')
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>
@endsection