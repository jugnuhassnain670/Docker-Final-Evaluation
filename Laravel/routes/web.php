<?php

 use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;

Route::get('/', function () {
    $postgresConnected = DB::connection('postgres')->getPdo()->query('SELECT 1')->fetchColumn();
    $redisConnected = Redis::connection()->ping();

    return view('index', [
        'postgresConnected' => $postgresConnected,
        'redisConnected' => $redisConnected,
    ]);
});

