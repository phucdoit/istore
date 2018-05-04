<div id="order-summary" class="box mb-4 p-0">
    <div class="box-header mt-0">
        <h3>Đơn hàng</h3>
    </div>
    <p class="text-muted text-small">Phí vận chuyển và phí phụ được tính toán dựa trên các giá trị bạn đã nhập.</p>
    <div class="table-responsive">
        <table class="table">
            <tbody>
                <tr>
                    <td>Đơn hàng</td>
                    <th class="right">{!! Cart::subtotal(0); !!} đ</th>
                </tr>
                <tr>
                    <td>Vận chuyển</td>
                    <th class="right">0 đ</th>
                </tr>
                <tr>
                    <td>Thuế</td>
                    <th class="right">{{ Cart::tax(0)}} đ</th>
                </tr>
                @if (session()->has('coupon'))
                    <td>Code - {{ session()->get('coupon')['name'] }}</td>
                    <th class="right">- {{ number_format(session()->get('coupon')['discount'], 0, '.', ',')  }} đ</th>
                @endif
                <tr class="total">
                    <td>Tổng cộng</td>
                    @if (session()->has('total'))
                        <th class="right">{{ number_format(session()->get('total'), 0, '.', ',')  }} đ</th>
                    @else
                        <th class="right">{!! Cart::total(0); !!} đ</th>
                    @endif
                </tr>
            </tbody>
        </table>
    </div>
</div>