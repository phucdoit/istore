<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class PageController extends Controller
{
    public function getIndex(){

    	// $data = Product::where("name","=","ABC")->first();
    	// dd($data);
    	return view('pages.home');
    }

    public function getShop(){

    	// $data = Product::where("name","=","ABC")->first();
    	// dd($data);
    	return view('pages.shop');
    }

    public function getDetail(){

    	// $data = Product::where("name","=","ABC")->first();
    	// dd($data);
    	return view('pages.detail');
    }

    public function getCart(){
    	// $data = Product::where("name","=","ABC")->first();
    	// dd($data);
    	return view('pages.cart');
    }

	public function getCheckout(){
    	// $data = Product::where("name","=","ABC")->first();
    	// dd($data);
    	return view('pages.checkout');
    }

    public function getCheckout1(){
        return view('pages.checkout1');
    }

    public function getCheckout2(){
        return view('pages.checkout2');
    }

    public function getCheckout3(){
        return view('pages.checkout3');
    }

    public function getCheckout4(){
        return view('pages.checkout4');
    }

    public function getLogin(){
        // $data = Product::where("name","=","ABC")->first();
        // dd($data);
        return view('pages.login');
    }

    public function getContact(){
        return view('pages.contact');
    }
}
