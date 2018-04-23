<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected $table = "rating";
    
	public function product()
    {
    	return $this->belongsTo('App\Product', 'product_id', 'id');
    }

	public function customer()
    {
    	return $this->belongsTo('App\Customer', 'customer_id', 'id');
    }
}
