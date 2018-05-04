<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rating;
use Auth;

class RatingController extends Controller
{
    public function postRating(Request $request)
    {
        $user_id = (Auth::check()) ? Auth::user()->id : null;
        $rating = Rating::where([
                    ['user_id', '=', $user_id],
                    ['product_id', '=', $request->product_id]
                ])->first();
        if(!$rating){
            try {
                $this->create($request);
                return back();
            } catch (Exception $e) {
                return back()->withErrors('Error! ' . $e->getMessage());
            }
        }else{
            try {
                $this->update($request, $rating->id);
               return back();
            } catch (Exception $e) {
                return back()->withErrors('Error! ' . $e->getMessage());
            }
        }
    }

    public function create(Request $request)
    {
        $user_id = (Auth::check()) ? Auth::user()->id : null;

        $rating = new Rating;
        $rating->user_id = $user_id;
        $rating->product_id = $request->product_id;
        $rating->rating = $request->rating;
        $rating->content = $request->content;
        $rating->save();
    }

    public function update(Request $request, $id)
    {
        $user_id = (Auth::check()) ? Auth::user()->id : null;
        $rating = Rating::find($id);
        $rating->user_id = $user_id;
        $rating->product_id = $request->product_id;
        $rating->rating = $request->rating;
        $rating->content = $request->content;
        $rating->save();
    }
}
