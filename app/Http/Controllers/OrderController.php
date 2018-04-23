<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Cart;
class OrderController extends Controller
{
	public function createOrder(Request $request)
	{
		
		dd($request->all(), Cart::content());
	}
}
