<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = "category";

	public function product_category()
    {
    	return $this->hasMany('App\ProductCategory', 'category_id', 'id');
    }
}
