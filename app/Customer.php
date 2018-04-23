<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = "customer";

	public function order()
    {
    	return $this->hasMany('App\Order', 'order_id', 'id');
    }

	public function shipping_info()
    {
    	// (  , khóa ngoại trong bảng shipping_info, khóa chính của bảng customer)
    	return $this->hasMany('App\ShippingInfo', 'customer_id', 'id');
    }
}
