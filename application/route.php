<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;



//api 资源路由
// get api api/Index/index 显示列表
// get api/create api/Index/create  新增
// post api api/Index/save       保存
// get api/:id   api/index/read    读取详情
// get api/:id/edit   api/index/edit   编辑
// put api/:id   api/index/update     更新
// delete api/:id   api/index/delete   删除     

Route::resource('api', 'api/index');
Route::get('api/page/:pagenumber', 'api/index/index', [
  'pagenumber' => '\d+'
]);


//前台 路由
// Route::group('index',[

//       'tech/:id' = > 'index/article/'



// ])