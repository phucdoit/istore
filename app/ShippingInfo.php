<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShippingInfo extends Model
{
    protected $table = "shipping_info";

	public function user()
    {
    	// (  , khóa ngoại của customer trong bảng shipping_info, khóa chính của bảng shipping_info )
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }

    public function order()
    {
    	return $this->hasMany('App\Order', 'shipping_info_id', 'id');
    }
}
