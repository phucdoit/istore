<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class AjaxController extends Controller
{
   public function index(){
       	$products = Product::orderBy('id', 'desc')->take(10)->get();
      	return response()->json(array('products'=> $products), 200);
   }
}
