<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AttributeValue extends Model
{
    protected $table = "attribute_value";
    
    public function attribute()
    {
    	return $this->belongsTo('App\Attribute', 'attribute_id', 'id');
    }

	public function product_attribute()
    {
    	return $this->hasMany('App\ProductAttribute', 'attribute_value_id', 'id');
    }
}
