<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Product;
use App\Discount;
use Cart;
use Auth;

class CartController extends Controller
{
    public function addCart(Request $request)
    {
        // Cart::destroy();
        // Kiểm tra nếu đã đăng nhập thì lấy cart của user đó trong database ra
        if (Auth::check()) {
            $currentUserEmail = Auth::user()->email;
            Cart::restore($currentUserEmail);
        }

        // Lấy sản phẩm và add vào cart
    	$data = $request->all();
        $product = Product::find($data['product_id']);
        if($product->promotion_price == 0){
        	$productPrice = $product->unit_price;
        }else{
        	$productPrice = $product->promotion_price;
        }
        Cart::add(
        	array(
        		'id' => $data['product_id'],
        		'name' => $product->name,
        		'qty' => 1,
        		'price' => $productPrice,
        		'options' => [
        			'thumbnail' => $product->thumbnail
        		]
        	)
        );

        // lưu cart vào database
        if (Auth::check()) {
            $currentUserEmail = Auth::user()->email;
            Cart::store($currentUserEmail);
        }

        session()->put(['total'=> intval(Cart::total(0,'','',''))]);

    	return response()->json([
    		'content' => Cart::content(),
    		'count' => Cart::count(),
    		'subtotal' => Cart::subtotal(0)
    	]);
    }

    public function getCart()
    {
    	if(!session()->has('total')){
            session()->put(['total'=> 0]);
        }
		return view('pages.cart');
    }

	public function getCartContent()
    {
        $cartContent = Cart::content();
    	return response()->json([
    		'content' => Cart::content(),
    		'count' => Cart::count(),
    		'subtotal' => Cart::subtotal(0)
    	]);
    }

    public function discount(Request $request)
    {
        $code = $request->code;
        $discount = Discount::where('code', $code)->first();
        if ($discount) {
            $subtotal = intval(Cart::subtotal(0,'','',''));
            session()->put('coupon', [
                'discount_id' => $discount->id,
                'name' => $discount->code,
                'discount' => $discount->discount($subtotal),
            ]);
            $total = intval(Cart::total(0,'','','')) - $discount->discount($subtotal);
            $total = ($total > 0) ? $total : 0;
            session()->put(['total'=> $total]);

            return back()->with('success_message', 'Coupon has been applied!');
        }else{
            // dd('aaa');
            return back()->withErrors(['discount_error' => ['Mã giảm giá không hợp lệ.']]);
        }
    }

}
