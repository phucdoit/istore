@extends('master')
@section('title', 'Liên hệ')
@section('content')
<div id="heading-breadcrumbs" class="brder-top-0 border-bottom-0">
    <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
                <h1 class="h2">Liên hệ</h1>
            </div>
            <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Liên hệ</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <div id="contact" class="container">
        <div class="row">
            <div class="col-lg-8">
                <section class="bar">
                    <div class="heading">
                        <h2>Bạn ở đây để cần giúp đỡ?</h2>
                    </div>
                    <p class="lead">Bạn có bất kỳ thắc mắc gì ? Bạn gặp vấn đề với các sản phẩm của chúng tôi? Vui lòng gửi ý kiến phản hồi của mình tới chúng tôi để chúng tôi có thể cũng cấp những dịch vụ phục vụ tốt hơn nữa.</p>
                    <p class="text-sm">Xin vui lòng liên hệ với chúng tôi, trung tâm dịch vụ khách hàng của chúng tôi phục vụ 24/7.</p>
                    <div class="heading">
                        <h3>Biểu mẫu liên hệ</h3>
                    </div>
                    <form>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="firstname">Họ</label>
                                    <input id="firstname" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="lastname">Tên</label>
                                    <input id="lastname" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input id="email" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="subject">Ngành nghề</label>
                                    <input id="subject" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="message">Tin nhắn</label>
                                    <textarea id="message" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-template-outlined"><i class="fa fa-envelope-o"></i> Gửi tin nhắn </button>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="bar mb-0">
                    <h3 class="text-uppercase">Địa chỉ</h3>
                    <p class="text-sm">Số 30
                        <br>Ngõ 1
                        <br>Ngô Thì Nhậm
                        <br>Hà Đông
                        <br><strong>Hà Nội</strong></p>
                    <h3 class="text-uppercase">Trung tâm tư vấn</h3>
                    <p class="text-muted text-sm">Chúng tôi khuyên bạn nên sử dụng hình thức giao tiếp điện tử .</p>
                    <p><strong>+33 555 444 333</strong></p>
                    <h3 class="text-uppercase">Hỗ trợ từ xa</h3>
                    <p class="text-muted text-sm">Xin vui lòng gửi email cho chúng tôi hoặc sử dụng hệ thống bán vé điện tử của chúng tôi.</p>
                    <ul class="text-sm">
                        <li><strong><a href="mailto:">info@fakeemail.com</a></strong></li>
                        <li><strong><a href="#">Ticketio</a></strong> - our ticketing support platform</li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
    <div id="map"></div>
</div>
@endsection