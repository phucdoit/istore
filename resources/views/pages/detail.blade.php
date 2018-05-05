@extends('master')
@section('title', $product->name)
@section('content')
<div id="heading-breadcrumbs">
    <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
                <h1 class="h2">{{$product->name}}</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="shop">Cửa hàng</a></li>
                    <li class="breadcrumb-item active">{{$product->name}}</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <style type="text/css">
        #content img {
            width: 100%;
        }
    </style>
    <div class="container">
        <div class="row bar">
            <!-- LEFT COLUMN _________________________________________________________-->
            <div class="col-lg-9">
                <p class="lead">Thay đổi suy nghĩ của người Việt trẻ về nền văn hoá công nghệ: sự tối giản và nhanh gọn không chỉ thể hiện qua quần áo – mà còn từ lối sống để hướng tới nhiều mục tiêu cao cả hơn.</p>
                <p class="goToDescription"><a href="#details" class="scroll-to text-uppercase">Cuộn xuống chi tiết sản phẩm</a></p>
                <div id="productMain" class="row">
                    <div class="col-sm-6">
                        <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                            @foreach($productImage as $product_image)
                            <div> <img src="img/{{$product_image->image}}" alt="" class="img-fluid"></div>
                            @endforeach
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="box">
                            <form>
<!--                                 <div class="sizes">
                                    <h3>Available sizes</h3>
                                    <select class="bs-select">
                                        <option value="small">Small</option>
                                        <option value="medium">Medium</option>
                                        <option value="large">Large</option>
                                        <option value="x-large">X Large</option>
                                    </select>
                                </div> -->
                                <p class="price">
                                    @if($product->promotion_price == 0)
                                        {{ number_format($product->unit_price, 0, '.', ',')  }} đ
                                    @else
                                        <del>{{ number_format($product->unit_price, 0, '.', ',')  }} đ</del><br/>
                                        {{ number_format($product->promotion_price, 0, '.', ',')  }} đ
                                    @endif
                                </p>
                                <p class="text-center">
                                    <button type="submit" class="cd-add-to-cart btn btn-template-outlined"
                                        class="cd-add-to-cart"
                                        data-id="{{$product->id}}"
                                        data-name="{{$product->name}}"
                                        data-thumbnail="{{$product->thumbnail}}"
                                        data-price="{{($product->promotion_price == 0) ? $product->unit_price : $product->promotion_price}}"
                                    ><i class="fa fa-shopping-cart"></i> Add to cart</button>
                                    <button type="submit" data-toggle="tooltip" data-placement="top" title="Add to wishlist" class="btn btn-default"><i class="fa fa-heart-o"></i></button>
                                </p>
                            </form>
                        </div>
                        <div data-slider-id="1" class="owl-thumbs">
                            @foreach($productImage as $product_image)
                            <button class="owl-thumb-item"><img src="img/{{$product_image->image}}" alt="" class="img-fluid"></button>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div id="details" class="box mb-4 mt-4">
                    {!!$product->description!!}
                </div>

                @if(count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <!-- Comment -->
                <div class="row">
                    <div class="col-lg-12">
                    <div class="rating-container rating-xs rating-animate">
                        <div class="rating-stars">
                            <span class="empty-stars">
                                <span class="star"><i class="fa fa-star-o"></i></span>
                                <span class="star"><i class="fa fa-star-o"></i></span>
                                <span class="star"><i class="fa fa-star-o"></i></span>
                                <span class="star"><i class="fa fa-star-o"></i></span>
                                <span class="star"><i class="fa fa-star-o"></i></span>
                            </span>
                            <span class="filled-stars" style="width: {{ (float) $ratingAVG/5*100 }}%">
                                <span class="star"><i class="fa fa-star"></i></span>
                                <span class="star"><i class="fa fa-star"></i></span>
                                <span class="star"><i class="fa fa-star"></i></span>
                                <span class="star"><i class="fa fa-star"></i></span>
                                <span class="star"><i class="fa fa-star"></i></span>
                            </span>
                        </div>
                        <div class="caption">
                            <span class="label label-success badge-success">
                                @if($ratingAVG)
                                    {{ number_format($ratingAVG, 1, ',', '') }} sao trên 5
                                @else
                                    Sản phẩm này chưa có đánh giá
                                @endif
                            </span>
                        </div>
                    </div>
                        <!-- <h2 class="page-header">Đánh giá</h2> -->
                        @if(!$ratings->isEmpty())
                        <section class="comment-list">
                            @foreach($ratings as $rating)
                                <div class="row border-bottom" style="padding-top: 20px;">
                                    <div class="col-md-1 col-sm-1 hidden-xs" style="padding-right: 0px;">
                                        @if(!$rating->avatar)
                                            <img class="user-avatar rounded-circle" src="img/blog-avatar.jpg" alt="Avatar" />
                                        @else
                                            <img class="user-avatar rounded-circle" src="img/{{$rating->avatar}}" alt="Avatar" />
                                        @endif
                                    </div>
                                    <div class="col-md-11 col-sm-11">
                                        <div class="panel panel-default arrow left">
                                            <div class="panel-body">
                                                <header class="text-left">
                                                    <div class="comment-user"> {{$rating->username}} <small class="comment-date"><i class="fa fa-clock-o"></i> {{$rating->created_at}}</small></div>
                                                    <div class="old-rating">
                                                        @for ($i = 0; $i < 5; $i++)
                                                            @if($i < $rating->rating)
                                                                <span class="fa fa-star checked"></span>
                                                            @else
                                                                <span class="fa fa-star"></span>
                                                            @endif
                                                        @endfor
                                                    </div>
                                                </header>
                                                <div class="comment-post">
                                                    <p>
                                                        {{ $rating->content }}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </section>
                        @endif
                    </div>
                </div>
                <!-- End Comment -->
                @if($isBought)
                <!-- Rating -->
                <div id="rating" class="mb-4 mt-4">
                  <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Đánh giá của bạn</h2>
                        <form action="rating" method="post">
                            <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                            <input type="hidden" name="product_id" value="{{$product->id}}">
                            <input id="star-rating-demo" name="rating" value="@if($currentUserRating){{ $currentUserRating->rating }}@endif" type="number" class="rating" min=0 max=5 step=1 data-size="xs" required="">
                            <textarea class="form-control" name="content" rows="5">@if($currentUserRating){{ $currentUserRating->content }}@endif</textarea>
                            <button type="submit" class="btn btn-primary right">Gửi</button>
                        </form>
                    </div>
                  </div>
                </div>
                <!-- End Rating -->
                @endif

                <div id="product-social" class="box social text-center mb-5 mt-5">
                    <h4 class="heading-light">Chia sẻ nó tới bạn bè</h4>
                    <ul class="social list-inline">
                        <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                        <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></li>
                    </ul>
                </div>
<!--                 <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="box text-uppercase mt-0 mb-small">
                            <h3>Có thể bạn sẽ thích</h3>
                        </div>
                    </div>
                    @foreach($suggestionProduct as $item)
                    <div class="col-lg-3 col-md-6">
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
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div> -->
                @include('recommend-side')
            </div>
            <div class="col-md-3">
                @include('category-side')
            </div>
        </div>
    </div>
</div>
@include('popup-cart')
@endsection