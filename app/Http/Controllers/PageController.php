<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class PageController extends Controller
{
    public function getIndex(){
    	return view('pages.home');
    }

    public function getShop(){
    	return view('pages.shop');
    }

    public function getDetail(){
    	return view('pages.detail');
    }

    public function getCart(){
    	return view('pages.cart');
    }

	public function getCheckout(){
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
        return view('pages.login');
    }

    public function getContact(){
        return view('pages.contact');
    }
}
