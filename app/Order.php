<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = "order";

    public function customer()
    {
    	return $this->belongsTo('App\Customer', 'customer_id', 'id');
    }
    
	public function shipping_info()
    {
    	return $this->belongsTo('App\ShippingInfo', 'shipping_info_id', 'id');
    }

	public function product_order()
    {
    	return $this->hasMany('App\ProductOrder', 'order_id', 'id');
    }


}
