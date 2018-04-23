<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Hash;
use Auth;

class UserController extends Controller
{
    public function postSignUp(Request $request)
    {
		// $this->validate($request,
  //           [
  //               'email'=>'unique:users,email',
  //               'password'=>'min:6|max:20',
  //           ],
  //           [
  //               'email.unique'=>'Email đã có người sử dụng',
  //               'password.min'=>'Mật khẩu ít nhất 6 kí tự'
  //           ]);

		$check_user = User::where('email', $request->email)->first();
		if ($check_user != null) {
            return redirect()->back()->withErrors('Email đã được sử dụng')->withInput();
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
    		return redirect()->back();
    	}
    	else{
    		return redirect()->back()->withErrors(['Đăng nhập không thành công', 'Kiểm tra lại username hoặc password .']);
    	}
    }

    public function getSignOut(){
    	Auth::logout();
    	return redirect()->back();
    }
}
