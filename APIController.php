<?php

namespace App\Http\Controllers;

use App\Accident;
use App\AndroidUser;
use App\Comment;
use App\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class APIController extends Controller
{

    public function login(Request $request){
        $db=AndroidUser::where([['username','=',$request->email],['password','=',$request->password]])->get();
        if($db!='[]'){
            foreach ($db as $d){
                $name=$d->name.' '.$d->surname;
            }
            return response()->json(array('response'=>$name));
        }
        else{
            return response()->json(array('response'=>'failed'));
        }

    }

    public function register(Request $request){
        $androiduser=new AndroidUser();
        $androiduser->name=$request->name;
        $androiduser->surname=$request->surname;
        $androiduser->phonenumber=$request->phonenumber;
        $androiduser->username=$request->numberplate;
        $androiduser->password=$request->password;
        $androiduser->security="none";
        $androiduser->save();

        return response()->json(['response'=>'success']) ;

    }

    public function security(Request $request){
        $android_user=AndroidUser::where('security',$request->security)->get();
        if($android_user!='[]'){

            foreach($android_user as $android){
                $password=$android->password;
            }

            return response()->json(['response'=>$password]);
        }
        else{
            return response()->json(['response'=>'Failed']);
        }


    }

    public function reclicence(Request $request){
        $l=request('license');
        $company_category = DB::table('lc')->insert(['lc'=>$l]);
        return response()->json(array(['response'=>'success']));
    }

    public function accident(Request $request){
        $user=AndroidUser::where('username',$request->username);
        DB::table('accidents')->insert(['username'=>$request->username,'longitude'=>$request->longitude,'latitude'=>$request->latitude,'issue'=>$request->issue,'status'=>'pending']);
        return response()->json(['response'=>'success']);
    }


    public function getCompany(Request $request){
        $category=request('category');
        $company_category = DB::table('users')->where('company_type', '=',$category)->get();
        return response()->json($company_category);
    }


    public function getPosts(Request $request){
        $category=request('category');
        $posts_category = DB::table('posts')->where('category', '=',$category)->get();
        return response()->json($posts_category);
    }

    public function randomPosts(Request $request){
        $posts= Post::all();
        return response()->json($posts);
    }

    public function getCompanyPosts(Request $request){
        $company=request('company');
        $posts_category = DB::table('posts')->where('company_name', '=',$company)->get();
        return response()->json($posts_category);
    }


    public function getComments(Request $request){
        $comment=request('comment');
        if($comment==""){
            //do nothing

        }
        else{
        $comment=new Comment();
        $comment->comment=$request->comment;
        $comment->posts_id=$request->post_id;
        $comment->user_name=$request->user_name;
        $comment->user_id=$request->user_id;
        $comment->save();
        }
        $comments=Comment::where('posts_id',request('post_id'))->get();
        return response()->json($comments);
    }

    public function postComment(Request $request){
        $comment=new Comment();
        $comment->comment=$request->comment;
        $comment->post_id=$request->posts_id;
        $comment->user_name=$request->user_name;
        $comment->user_id=$request->user_id;
        $comment->save();
        $comments=Comment::all();
        return response()->json($comments);

    }

    public function my_accident(Request $request){
        $accends=Accident::where(['username'=>$request->username])->get();
        return response()->json($accends);

    }




}
