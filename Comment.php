<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    //discussion relationship
    public function  post(){
        return $this->belongsTo(Post::class);
    }

    //user relationship
    public function  user(){
        return $this->belongsTo(AndroidUser::class);
    }
}
