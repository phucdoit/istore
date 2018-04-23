<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShippingInfo extends Model
{
    protected $table = "shippping_info";

	public function customer()
    {
    	// (  , khóa ngoại của customer trong bảng shipping_info, khóa chính của bảng shipping_info )
    	return $this->belongsTo('App\Customer', 'customer_id', 'id');
    }

    public function order()
    {
    	return $this->hasMany('App\Order', 'shippping_info_id', 'id');
    }
}
