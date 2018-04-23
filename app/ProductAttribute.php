<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductAttribute extends Model
{
    protected $table = "product_attribute";

    public function product()
    {
    	return $this->belongsTo('App\Product', 'product_id', 'id');
    }

    public function attribute_value()
    {
    	return $this->belongsTo('App\AttributeValue', 'attribute_value_id', 'id');
    }
}
