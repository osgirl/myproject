<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    //comment relstionship
    public function comments(){
        return $this->hasMany(Comment::class);
    }
    // user relationship
    public function user(){  //posts->user   person who wrote the comment
        return $this->belongsTo(User::class);
    }


}
