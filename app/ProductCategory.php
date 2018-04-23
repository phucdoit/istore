<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "product_category";

    public function product()
    {
    	return $this->belongsTo('App\Product', 'product_id', 'id');
    }

    public function category()
    {
    	return $this->belongsTo('App\Category', 'category_id', 'id');
    }
}
