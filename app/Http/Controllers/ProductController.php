<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductImage;
use App\Order;
use App\ProductOrder;
use App\Rating;
use App\User;
use App\Category;
use App\ProductCategory;
use Auth;

class ProductController extends Controller
{
    public function getCategory()
    {
        $categories = Category::all();
        foreach ($categories as $category) {
            $category->count = ProductCategory::where('category_id', $category->id)->count();
        }
        return $categories;
    }
    
    public function getProduct(Request $request){
    	// $products = Product::find(1)->product_image;
    	$products = Product::all();
        $categories = $this->getCategory();

        if($request->category){
            $products = Product::join('product_category', 'product.id', '=', 'product_category.product_id')
            ->join('category', 'category.id', '=', 'product_category.category_id')->where('category_id', $request->category)
            ->select('product.*')
            ->get();
        }

        foreach ($products as $item) {
            $categoryByProduct = Category::join('product_category', 'category.id', '=', 'product_category.category_id')
            ->where('product_category.product_id', $item->id)
            ->get();
            $item->category_ids = $categoryByProduct;
        }

        // dd($products);

    	return view('pages.shop', compact('products','categories'));
    }

    public function getDetail(Request $request){
        $categories = $this->getCategory();

        $categoryByProduct = Category::join('product_category', 'category.id', '=', 'product_category.category_id')
        ->where('product_category.product_id', $request->id)
        ->get();

        // dd($categoryByProduct);

        $productId = $request->id;
    	$product = Product::where('id', $productId)->first();
    	$productImage = ProductImage::where('product_id', $productId)->get();

        $currentUserRating = null;
        $ratings = Rating::where('product_id', $productId)->orderBy('created_at', 'desc')->get();
        $ratingAVG = Rating::where('product_id', $productId)->avg('rating');
        foreach ($ratings as $key => $rating) {
            $ratingUser = User::find($rating->user_id);
            $rating->username = $ratingUser->name;
            $rating->avatar = null;
            if (Auth::check()) {
                if ($rating->user_id == Auth::user()->id) {
                    $currentUserRating = $rating;
                    unset($ratings[$key]);
                }
            }
        }

        $suggestionProduct = Product::where('name','like', '%'.$product->name.'%')->get();

        $isBought = false;
        if (Auth::check()) {
            $currentUserId = Auth::user()->id;
            $isBought = $this->isBought($currentUserId, $productId);
        }

        // dd($currentUserRating);

    	return view('pages.detail', compact('product', 'productImage', 'ratingAVG','ratings', 'isBought','currentUserRating', 'categories', 'suggestionProduct', 'categoryByProduct'));
    }

    protected function isBought($user_id, $product_id)
    {
        $orders = Order::where('user_id', $user_id)->get();
        if ($orders->isEmpty()) {
            return false;
        }else{
            foreach ($orders as $order) {
                $productOrders = Order::find($order->id)->product_order;
                // dd($productOrders);
                // $productOrders = ProductOrder::where('order_id', $order->id)->get();
                foreach ($productOrders as $productOrder) {
                    if ($productOrder->product_id == $product_id) {
                        return true;
                    }
                }
                // dd($productOrders);
            }
            return false;
        }

    }
}
