<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\ProductOrder;
use App\ShippingInfo;
use App\Payment;
use Cart;
use Auth;

class OrderController extends Controller
{
	// public function getCheckout()
	// {
	// 	if (Auth::check()) {
	// 		return view('pages.checkout');
 //        } else {
 //        	return view('pages.login');
 //        }
	// }
	public function index()
	{
		if (Auth::check()) {
			return view('pages.checkout');
        } else if (Cart::count() == 0) {
            return redirect()->route('getcart');
        } else {
        	return view('pages.login');
        }
	}

	public function createOrder(Request $request)
	{
		try {
			$userId = auth()->user() ? auth()->user()->id : null;

			$shippingInfo = new ShippingInfo;
			$shippingInfo->user_id = $userId;
			$shippingInfo->name = $request->name;
			$shippingInfo->address = $request->address;
			$shippingInfo->phone = $request->phone;
			$shippingInfo->email = $request->email;
			$shippingInfo->save();

			$payment = Payment::where('name', $request->payment)->first();
			$discountId = session()->get('coupon')['discount_id'] ?? null;
			$order = new Order;
			$order->user_id = $userId;
			$order->shipping_info_id = $shippingInfo->id;
			$order->payment_id = $payment->id;
			$order->discount_id = $discountId;
			$order->subtotal = intval(Cart::subtotal(0,'','',''));
			$order->tax = intval(Cart::tax(0,'','',''));
			$order->total = session()->get('total');

			$order->save();

			// Insert into ProductOrder table
	        foreach (Cart::content() as $item) {
	            $productOrder = new ProductOrder;
	            $productOrder->order_id = $order->id;
	            $productOrder->product_id = $item->id;
	            $productOrder->price = $item->qty;
	            $productOrder->quantity = $item->qty;
	            $productOrder->save();
	        }
	        Cart::destroy();
	        session()->forget('coupon');
	        session()->forget('total');
	        return view('pages.order-success');
		} catch (Exception $e) {
			return back()->withErrors('Error! ' . $e->getMessage());
		}
	}

}
