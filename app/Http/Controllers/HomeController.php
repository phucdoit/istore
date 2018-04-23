<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class HomeController extends Controller
{
    public function getIndex(){
    	// $products = Product::find(1)->product_image;
    	$products = Product::orderBy('id', 'desc')->get();
    	// dd($products);
    	return view('pages.home', compact('products'));
    }
}
