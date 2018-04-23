<div id="order-summary" class="box mt-0 mb-4 p-0">
    <div class="box-header mt-0">
        <h3>Đơn hàng</h3>
    </div>
    <p class="text-muted text-small">Phí vận chuyển và phí phụ được tính toán dựa trên các giá trị bạn đã nhập.</p>
    <div class="table-responsive">
        <table class="table">
            <tbody>
                <tr>
                    <td>Đơn hàng</td>
                    <th>{!! Cart::subtotal(); !!} đ</th>
                </tr>
                <tr>
                    <td>Vận chuyển</td>
                    <th>0.00</th>
                </tr>
                <tr>
                    <td>Thuế</td>
                    <th>0.00</th>
                </tr>
                <tr class="total">
                    <td>Tổng cộng</td>
                    <th>{!! Cart::subtotal(); !!} đ</th>
                </tr>
            </tbody>
        </table>
    </div>
</div>