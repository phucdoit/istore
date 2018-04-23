<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Product extends Model
{
    protected $table = "product";

	public function product_order()
    {
    	return $this->hasMany('App\ProductOrder', 'product_id', 'id');
    }

	public function product_image()
    {
    	return $this->hasMany('App\ProductImage', 'product_id', 'id');
    }

	public function product_category()
    {
    	return $this->hasMany('App\ProductCategory', 'product_id', 'id');
    }

	public function product_attribute()
    {
    	return $this->hasMany('App\ProductAttribute', 'product_id', 'id');
    }
}
