<?php

namespace App\Http\Controllers;

use App\Accident;
use App\Category;
use App\Comment;
use App\Company;
use App\Post;
use App\Resolver;
use App\User;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Paynow\Payments\Paynow;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $category=Category::all();
        return view('session.login',compact('category'));

    }

    public function add_product(Request $request)
    {

        return view('company.add_product');

    }

    public function signin(Request $request)
    {
        if(Auth::attempt(['username'=>$request->username,'password'=>$request->password])){
            return view('company.add_product')->with('message','Welcome '.auth()->user()->company_name);
        }
        else{
            return back()->with('error','Wrong credentials please try again');
        }



    }

    public function signup(Request $request){
        $image=$request->file('image');
        $input['imagename']=$image->getClientOriginalName();
        $destination=public_path('/images/logos');
        $image->move($destination,$input['imagename']);
        $url='http://192.168.43.59/ku/public/';

        $user=new User();
        $user->company_name=$request->company_name;
        $user->email=$request->email;
        $user->company_address=$request->company_address;
        $user->website=$request->website;
        $user->tel=$request->tel;
        $user->logo_local='public/images/logos/'.$input['imagename'];
        $user->logo=$url.'images/logos/'.$input['imagename'];
        $user->username=$request->username;
        $user->company_type=$request->company_type;
        $user->password=bcrypt($request->password);
        $user->save();
        return redirect()->route('login')->with('message','You have been successfully registered, please login to continue');

    }


    public function make_post(Request $request){
        $image=$request->file('image');
        $input['imagename']=$image->getClientOriginalName();
        $destination='images/posts/';
        $image->move($destination,$input['imagename']);
        $url='http://192.168.43.59/ku/';

        $post=new Post();
        $post->post=$request->post;
        $post->img_url=$url.$destination.$input['imagename'];
        $post->img_local=$destination.$input['imagename'];
        $post->company_name=auth()->user()->company_name;
        $post->category=auth()->user()->company_type;
        $post->company_id=auth()->user()->id;
        $post->save();
        return redirect()->route('view_posts')->with('message','Post successfully published');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    public function view_posts(){
        $posts=Post::where('company_id',auth()->user()->id)->get();
        return view('company.view_posts',compact('posts'));
    }
    public function view_selected_post($id){
        $selected_post=Post::find($id);
        $comments=Comment::where('posts_id',$id)->get();
        return view('company.view_selected_post',compact('selected_post','comments'));
    }

    public function add_comment(Request $request,$id){
    $comment=new Comment();
    $comment->comment=$request->body;
    $comment->user_name=auth()->user()->company_name;
    $comment->posts_id=$id;
    $comment->user_id=auth()->user()->username;
    $comment->save();
    return back();


    }

    public function payment(){
        $paynow = new Paynow(
            5904,
            "e6faac48-10ee-4021-9d80-98e0cb06ade6",
            'http://localhost:8080',
            'http://localhost:8080'
        );

$total = floatval(500);


$payment = $paynow->createPayment('1234');
$payment->add('Total', $total);


$response = $paynow->send($payment);


if(!$response->success()) {
    die('Paynow error');

}
else{
    return $response->redirectUrl();
}
}





    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        Auth::logout();
        $request->session()->flush();
        return redirect()->route('login')->with('message','Successfully logged out');
    }


    public function get_reports(){
        $accidents=Accident::where('status','pending')->get();
        return view('company.view_reports',compact('accidents'));
    }

    public function get_map(){
        return view('company.map');
    }
    public function update_report($id){
        $acc=Accident::find($id);
        $resolver=Resolver::all();
        return view('company.update_report',compact('acc','resolver'));
    }
    public function updateRep(Request $request){
        $sele=Resolver::find($request->cid);

        $acc=Accident::where('id',$request->id)->update(['status'=>'attending','estimated_time'=>$request->	estimated_time,
            'attender_numberplate'=>$sele->numberplate,'attender_contact'=>$sele->contact]);
        return redirect()->route('get_reports');
    }

    public function get_attendingreports(){
        $accidents=Accident::where('status','attending')->get();
        return view('company.attending_reports',compact('accidents'));
    }
    public function close_issue($id){
        $acc=Accident::find($id);
        return view('company.close_issue',compact('acc'));
    }

    public function resolved(){
        $accidents=Accident::where('status','closed')->get();
        return view('company.resolved',compact('accidents'));
    }


    public function closeRep(Request $request){
        $acc=Accident::where('id',$request->id)->update(['status'=>'closed']);
        return redirect()->route('get_attendingreports');
    }

    public function saveResolver(Request $request){
        $res=new Resolver();
        $res->name=$request->name;
        $res->contact=$request->contact;
        $res->numberplate=$request->numberplate;
        $res->save();
        return back()->with('message','Resolvr successfully added');
    }

    public function addResolver(){
        return view('company.rescue');
    }

    public function ViewResolvers(){
        $resolvers=Resolver::all();
        return view('company.view_resolvers',compact('resolvers'));
    }
    public function delete_resolver($id){
        $res=Resolver::find($id)->delete();
        return redirect()->route('ViewResolvers');
    }

    public function delete_report($id){
        $rep=Accident::find($id)->delete();
        return back();
    }

}
