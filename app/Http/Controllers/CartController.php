<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Product;
use Cart;

class CartController extends Controller
{
    public function addCart(Request $request)
    {
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
        // Cart::add($product);

        Cart::store('username_test');
        
    	return response()->json([
    		'content' => Cart::content(),
    		'count' => Cart::count(),
    		'subtotal' => Cart::subtotal()
    	]);
    }

    public function getCart()
    {
    	// dd(Cart::content());
		return view('pages.cart');
    }

	public function getCartContent()
    {
    	return response()->json([
    		'content' => Cart::content(),
    		'count' => Cart::count(),
    		'subtotal' => Cart::subtotal()
    	]);
    }

    public function getCartQtyItem()
    {
    	return response()->json(Cart::count());
    }    

    public function getCartSubtotal()
    {
    	return response()->json(Cart::subtotal());
    }

}
