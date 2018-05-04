@extends('master')
@section('title', 'Cửa hàng')
@section('content')
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
                <h1 class="h2">Cửa hàng</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Cửa hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <div class="container">
        <div class="row bar">
            <div class="col-md-9">
                <p class="text-muted lead">Bao năm qua, giới khoa học cũng như các hãng công nghệ luôn nỗ lực không ngừng để mang lại những cải tiến. Vì vậy, dĩ nhiên là không thể có chiếc xe bay nào xuất hiện, nhưng theo Phonearena, những sản phẩm công nghệ dưới đây sẽ rất đáng để chúng ta chờ đợi trong năm 2018.</p>
                <div class="row products products-big">
                    @foreach($products as $product)
                    <div class="col-lg-4 col-md-6">
                        <div class="product">
                            <div class="image">
                                <a href="product/{{$product->id}}"><img src="img/{{$product->thumbnail}}" alt="" class="img-fluid image1"></a>
                            </div>
                            <div class="text">
                                <h3 class="h5"><a href="shop-detail.html">{{$product->name}}</a></h3>
                                <p class="price">
                                    @if($product->promotion_price == 0)
                                        {{ number_format($product->unit_price, 0, '.', ',')  }} đ
                                    @else
                                        <del>{{ number_format($product->unit_price, 0, '.', ',')  }} đ</del>
                                        {{ number_format($product->promotion_price, 0, '.', ',')  }} đ
                                    @endif
                                </p>
                                <p class="buttons">
                                    <!-- <a href="portfolio-detail.html" class="btn btn-template-outlined-white">Add to cart</a> -->
                                    <a href="#0" class="cd-add-to-cart"
                                        data-id="{{$product->id}}"
                                        data-name="{{$product->name}}"
                                        data-thumbnail="{{$product->thumbnail}}"
                                        data-price="{{($product->promotion_price == 0) ? $product->unit_price : $product->promotion_price}}"
                                    >Add To Cart</a>
                                </p>
                            </div>
                            <div class="ribbon-holder">
                                <div class="ribbon sale">SALE</div>
                                <div class="ribbon new">NEW</div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
                <div class="row">
                    <div class="col-md-12 banner mb-small">
                        <a href="#"><img src="img/banner2.jpg" alt="" class="img-fluid"></a>
                    </div>
                </div>
                <div class="pages">
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">
                            <li class="page-item">
                                <a href="#" class="page-link"> <i class="fa fa-angle-double-left"></i></a>
                            </li>
                            <li class="page-item active"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-md-3">
                @include('category-side')
            </div>
        </div>
    </div>
</div>
@include('popup-cart')
@endsection