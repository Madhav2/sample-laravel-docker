<?php

namespace App\Http\Controllers;

class HomeController extends Controller
{
    public function home() {
        print_r('Home page works');
        dd(getenv('HAS_ENV'));
    }

    public function about() {
        print_r('About page works');
    }

}
