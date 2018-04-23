<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductImage;

class ProductController extends Controller
{
    public function getProduct(){
    	// $products = Product::find(1)->product_image;
    	$products = Product::all();
    	// dd($products);
    	return view('pages.shop', compact('products'));
    }
    public function getDetail(Request $req){
    	$product = Product::where('id', $req->id)->first();
    	$productImage = ProductImage::where('product_id', $req->id)->get();
    	// dd($productImage);
    	return view('pages.detail', compact('product', 'productImage'));
    }
}
