<div class="box box mt-0 mb-4 p-0">
    @if (session()->has('coupon'))
        @if (session()->has('success_message'))
        <div class="alert alert-success">
            {{ session()->get('success_message') }}
        </div>
        @endif
    @else
        <div class="box-header mt-0">
            <h4>Mã khuyến mại</h4>
        </div>
        <p class="text-muted">Nếu bạn có mã khuyến mại, hãy nhập vào đây.</p>
        <form action="discount" method="POST">
            <div class="input-group">
                {{ csrf_field() }}
                <input type="text" class="form-control" name="code"><span class="input-group-btn">
                <button type="submit" class="btn btn-template-main"><i class="fa fa-gift"></i></button></span>
            </div>
        </form>
        @if ($errors->first('discount_error'))
            <div class="alert alert-danger">
                {{$errors->first('discount_error')}}
            </div>
        @endif
    @endif
</div>