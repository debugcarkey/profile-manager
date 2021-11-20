<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/',function(){
    return redirect('/api/documentation/');
});

$router->get('/health',function(){
    return redirect('/api/documentation/');
});

$router->group(['prefix' => 'organizations/{slug:[a-z-0-9\-]+}'], function ($router) {
    $router->get('/', 'OrganizationController@show');

});