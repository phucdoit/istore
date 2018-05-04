@extends('master')
@section('title', 'Trang chủ')
@section('content')
<section style="background: url('img/photogrid.jpg') center center repeat; background-size: cover;" class="bar background-white relative-positioned">
    <div class="container">
        <!-- Carousel Start-->
        <div class="home-carousel">
            <div class="dark-mask mask-primary"></div>
            <div class="container">
                <div class="homepage owl-carousel">
                    <div class="item">
                        <div class="row">
                            <div class="col-md-5 text-right">
                                <h1>iphone X</h1>
                                <p>Say Hello
                                    <br>to the future</p>
                            </div>
                            <div class="col-md-7"><img src="img/ios_large.png" alt="" class="img-fluid"></div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="row">
                            <div class="col-md-7 text-center"><img src="img/imac_large.png" alt="" class="img-fluid"></div>
                            <div class="col-md-5">
                                <h2>iMac</h2>
                                <ul class="list-unstyled">
                                    <!-- <li>Tầm nhìn sáng hơn bao giờ hết.</li> -->
                                    <li> công nghệ đồ họa mới nhất.</li>
                                    <li> bộ nhớ sáng tạo, băng thông cao hơn.</li>
                                    <li> màn hình Retina sáng nhất và đầy màu sắc.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="row">
                            <div class="col-md-5 text-right">
                                <h1>Watch</h1>
                                <ul class="list-unstyled">
                                    <li>Tuyệt vời cho chạy bộ</li>
                                    <li>Chống nước chuẩn IP68</li>
                                    <li>Đa dạng màu sắc</li>
                                </ul>
                            </div>
                            <div class="col-md-7"><img src="img/nike_large.png" alt="" class="img-fluid" style="max-width: 350px;"></div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="row">
                            <div class="col-md-7"><img src="img/apple-music-topic2.png" alt="" class="img-fluid"></div>
                            <div class="col-md-5">
                                <h1>Music</h1>
                                <ul class="list-unstyled">
                                    <li>45 triệu bài hát.</li>
                                    <li>Nghe nhạc yêu thích</li>
                                    <li>Không có quảng cáo</li>
                                    <li>3 tháng dùng thử</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End-->
    </div>
</section>
<section class="bar background-white">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="box-simple">
                    <div class="icon-outlined"><i class="fa fa-desktop"></i></div>
                    <h3 class="h4">Đổi trả</h3>
                    <p>Miễn phí đổi trả trong vòng 30 ngày.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box-simple">
                    <div class="icon-outlined"><i class="fa fa-print"></i></div>
                    <h3 class="h4">Bảo hành</h3>
                    <p>Cam kết bảo hành 1 đổi 1 trong vòng 1 năm.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box-simple">
                    <div class="icon-outlined"><i class="fa fa-globe"></i></div>
                    <h3 class="h4">Giao hàng</h3>
                    <p>Giao hàng nhanh trong ngày với nội thành và tối đa 3 ngày với ngoại thành.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="box-simple">
                    <div class="icon-outlined"><i class="fa fa-lightbulb-o"></i></div>
                    <h3 class="h4">Trả góp</h3>
                    <p>Quy đổi trả góp 60% tổng giá trị đơn hàng.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box-simple">
                    <div class="icon-outlined"><i class="fa fa-envelope-o"></i></div>
                    <h3 class="h4">Chăm sóc khách hàng</h3>
                    <p>Dịch vụ hỗ trợ khách hàng hoạt động 24/24 bất kể lễ tết.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box-simple">
                    <div class="icon-outlined"><i class="fa fa-user"></i></div>
                    <h3 class="h4">Bảo mật</h3>
                    <p>Chúng tôi cam kết bảo mật thông tin cá nhân của bạn bằng mọi cách thức có thể.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="bar background-pentagon no-mb text-md-center">
    <div class="container">
        <div class="heading text-center">
            <h2>Khách hàng nói gì về Istore</h2>
        </div>
        <p class="lead">Chúng tôi đã làm việc với nhiều khách hàng và chúng tôi luôn muốn nghe họ đến từ sự hợp tác hạnh phúc và hài lòng. Có một cái nhìn khách quan về những gì khách hàng nói về chúng tôi.</p>
        <!-- Carousel Start-->
        <ul class="owl-carousel testimonials list-unstyled equal-height">
            <li class="item">
                <div class="testimonial d-flex flex-wrap">
                    <div class="text">
                        <p>Tôi đi mua điện thoại ở nhiều cửa hàng rồi nhưng ấn tượng với Di Động Istore nhất, các bạn nhân viên ở đây nhiệt tình và vui vẻ tư vấn cho tôi. Hàng hóa nguyên bản, giá cả phải chăng. Bộ phận kĩ thuật hỗ trợ tôi rất nhiệt tình. Cảm ơn các bạn Di Động Istore.</p>
                    </div>
                    <div class="bottom d-flex align-items-center justify-content-between align-self-end">
                        <div class="icon"><i class="fa fa-quote-left"></i></div>
                        <div class="testimonial-info d-flex">
                            <div class="title">
                                <h5>John McIntyre</h5>
                                <p>CEO, TransTech</p>
                            </div>
                            <div class="avatar"><img alt="" src="img/person-1.jpg" class="img-fluid"></div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="testimonial d-flex flex-wrap">
                    <div class="text">
                        <p>Hàng iPhone tôi mua ở đây mua chuẩn hàng zin 100%, lại được bảo hành 15 tháng quá chất. Tôi đã mua 7 máy ở đây và đến giờ vẫn giới thiệu bạn bè qua mua, vừa tiết kiệm vừa bền. Bây giờ mua quen thì không cần đến cửa hàng chọn máy mà ở nhà gọi ship là xong.</p>
                    </div>
                    <div class="bottom d-flex align-items-center justify-content-between align-self-end">
                        <div class="icon"><i class="fa fa-quote-left"></i></div>
                        <div class="testimonial-info d-flex">
                            <div class="title">
                                <h5>John McIntyre</h5>
                                <p>CEO, TransTech</p>
                            </div>
                            <div class="avatar"><img alt="" src="img/person-2.jpg" class="img-fluid"></div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="testimonial d-flex flex-wrap">
                    <div class="text">
                        <p>Ngày trước em hay mua hàng ở bên Istore và thấy chất lượng dịch vụ ở Istore rất tốt.</p>
                        <p>Các anh chị nhiệt tình vui vẻ nên khi ra trường em đã xin vào làm ở Istore. Đến nay em đã gắn với Istore được 2 năm và phụ trách CSKH online. Em rất vui khi phụ trách công việc này </p>
                    </div>
                    <div class="bottom d-flex align-items-center justify-content-between align-self-end">
                        <div class="icon"><i class="fa fa-quote-left"></i></div>
                        <div class="testimonial-info d-flex">
                            <div class="title">
                                <h5>John McIntyre</h5>
                                <p>CEO, TransTech</p>
                            </div>
                            <div class="avatar"><img alt="" src="img/person-3.png" class="img-fluid"></div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="testimonial d-flex flex-wrap">
                    <div class="text">
                        <p>Tôi là khách hàng thân thiết của Di Động Istore từ những ngày đầu tiên đến giờ, luôn rất hài lòng với các bạn. Bạn bè trong công ty tôi cũng mua ở đây hơn chục máy rồi, vừa rẻ vừa được bảo hành lâu. Ở Hà Nội tôi chỉ tin tưởng Di Động Istore.</p>
                    </div>
                    <div class="bottom d-flex align-items-center justify-content-between align-self-end">
                        <div class="icon"><i class="fa fa-quote-left"></i></div>
                        <div class="testimonial-info d-flex">
                            <div class="title">
                                <h5>John McIntyre</h5>
                                <p>CEO, TransTech</p>
                            </div>
                            <div class="avatar"><img alt="" src="img/person-4.jpg" class="img-fluid"></div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="testimonial d-flex flex-wrap">
                    <div class="text">
                        <p>Em mua 2 máy Sony Z3c ở bên Di Động Istore rồi, em rất thích bên mình ạ. Ở Hà Nội cứ mua bên Istore vừa bán rẻ nhất lại là hàng zin, không lo hàng dựng, bảo hành 6 tháng nên em thấy yên tâm. Các anh chị cũng hỗ trợ nhiệt tình nữa. Bạn bè em hỏi em cũng giới thiệu đến Istore.</p>
                    </div>
                    <div class="bottom d-flex align-items-center justify-content-between align-self-end">
                        <div class="icon"><i class="fa fa-quote-left"></i></div>
                        <div class="testimonial-info d-flex">
                            <div class="title">
                                <h5>John McIntyre</h5>
                                <p>CEO, TransTech</p>
                            </div>
                            <div class="avatar"><img alt="" src="img/blog-avatar.jpg" class="img-fluid"></div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <!-- Carousel End-->
    </div>
</section>
<section style="background: url(img/fixed-background-2.jpg) center top no-repeat; background-size: cover;" class="bar no-mb color-white text-center bg-fixed relative-positioned">
    <div class="dark-mask"></div>
    <div class="container">
        <div class="icon icon-outlined icon-lg"><i class="fa fa-file-code-o"></i></div>
        <h3 class="text-uppercase">Bạn muốn xem nhiều hơn?</h3>
        <p class="lead">Chúng tôi cung cấp hơn 100 sản phẩm khác nhau, trong nhiều danh mục.</p>
        <p class="text-center"><a href="shop" class="btn btn-template-outlined-white btn-lg">Cửa hàng của chúng tôi</a></p>
    </div>
</section>
<!-- <section class="bg-white bar">
    <div class="container">
        <div class="heading text-center">
            <h2>From the blog</h2>
        </div>
        <p class="lead">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. <a href="blog.html">Check our blog</a></p>
        <div class="row">
            <div class="col-lg-3">
                <div class="home-blog-post">
                    <div class="image"><img src="img/portfolio-4.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><a href="#" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                    </div>
                    <div class="text">
                        <h4><a href="#">Fashion Now </a></h4>
                        <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                        <p class="intro">Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p><a href="#" class="btn btn-template-outlined">Continue Reading</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="home-blog-post">
                    <div class="image"><img src="img/portfolio-3.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><a href="#" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                    </div>
                    <div class="text">
                        <h4><a href="#">What to do</a></h4>
                        <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                        <p class="intro">Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p><a href="#" class="btn btn-template-outlined">Continue Reading</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="home-blog-post">
                    <div class="image"><img src="img/portfolio-5.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><a href="#" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                    </div>
                    <div class="text">
                        <h4><a href="#">5 ways to look awesome</a></h4>
                        <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                        <p class="intro">Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p><a href="#" class="btn btn-template-outlined">Continue Reading</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="home-blog-post">
                    <div class="image"><img src="img/portfolio-6.jpg" alt="..." class="img-fluid">
                        <div class="overlay d-flex align-items-center justify-content-center"><a href="#" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                    </div>
                    <div class="text">
                        <h4><a href="#">Fashion Now </a></h4>
                        <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                        <p class="intro">Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p><a href="#" class="btn btn-template-outlined">Continue Reading</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> -->
<section class="bar bg-gray">
    <div class="container">
        <div class="heading text-center">
            <h2>Khhách hàng của chúng tôi</h2>
        </div>
        <ul class="list-unstyled owl-carousel customers no-mb">
            <li class="item"><img src="img/apple.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/samsung.jpg" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/oppo.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/philip.jpg" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/sony.jpg" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/xiaomi.jpg" alt="" class="img-fluid"></li>
        </ul>
    </div>
</section>
@include('popup-cart')
@endsection
