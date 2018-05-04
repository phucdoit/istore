<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Hash;
use Auth;
use Cart;

class UserController extends Controller
{
    public function postSignUp(Request $request)
    {
		$check_user = User::where('email', $request->email)->first();
		if ($check_user != null) {
            return redirect()->back()->withErrors(['login_error' => ['Email đã được sử dụng']]);
    	}
    	$user = new User();
    	$user->name = $request->name;
    	$user->email = $request->email;
    	$user->password = Hash::make($request->password);
    	$user->remember_token = $request->_token;

    	$user->save();
    	return redirect()->back()->with('ok', 'Tạo tài khoản thành công');
    }

    public function postSignIn(Request $request)
    {
    	$login = array('email' => $request->email, 'password' => $request->password);
    	if (Auth::attempt($login)) {
        $cartContent = Cart::content();
        $currentUserEmail = Auth::user()->email;
        Cart::restore($currentUserEmail);

        // foreach ($cartContent as $item) {
        //     Cart::add(
        //         array(
        //             'id' => $item->id,
        //             'name' => $item->name,
        //             'qty' => $item->qty,
        //             'price' => $item->price,
        //             'options' => [
        //                 'thumbnail' => $item->options->thumbnail
        //             ]
        //         )
        //     );
        // }
        
        session()->put(['total'=> intval(Cart::total(0,'','',''))]);
        // Cart::store($currentUserEmail);
    		return redirect()->back();
    	}
    	else{
        return redirect()->back()->withErrors(['login_error' => [ 'Kiểm tra lại username hoặc password .']]);
    	}
    }

    public function getSignOut(){
        Cart::destroy();
        session()->forget('coupon');
        session()->forget('total');
    	Auth::logout();
    	return redirect()->back();
    }
}
