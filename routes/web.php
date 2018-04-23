<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('index', [
// 	'as' => 'home',
// 	'uses' => 'PageController@getIndex'
// ]);

Route::get('/',[
	'as'=>'trangchu',
	'uses'=>'HomeController@index'
]);

Route::get('/home',[
	'as'=>'home',
	'uses'=>'HomeController@getIndex'
]);

Route::get('/shop', "ProductController@getProduct");

Route::get('/product/{id}', "ProductController@getDetail");

Route::get('/cart', "PageController@getCart");

Route::get('/checkout', "PageController@getCheckout");

Route::get('/login', "PageController@getLogin");

Route::get('/getmsg','AjaxController@index');

Route::post('/add-cart',[
	'as'=>'addcart',
	'uses'=>'CartController@addCart'
]);

Route::get('/cart',[
	'as'=>'getcart',
	'uses'=>'CartController@getCart'
]);

Route::get('/get-cart-content',[
	'as'=>'getcartcontent',
	'uses'=>'CartController@getCartContent'
]);

Route::get('/testcart',[
	'as'=>'testcart',
	'uses'=>'CartController@testCart'
]);

Route::post('/create-order',[
	'as'=>'createorder',
	'uses'=>'OrderController@createOrder'
]);

Route::post('/sign-in',[
	'as'=>'signin',
	'uses'=>'UserController@postSignIn'
]);

Route::post('/sign-up',[
	'as'=>'signup',
	'uses'=>'UserController@postSignUp'
]);

Route::get('/sign-out',[
	'as'=>'signout',
	'uses'=>'UserController@getSignOut'
]);