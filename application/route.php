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
// 返回全部数据 （分页）
Route::get('api/page/:pageNumber', 'api/index/index', [
  'pageNumber' => '\d+',
  'complete_match' => true,
]);
// 返回各栏目数据 （不分页）
Route::get('api/cate/:categoryID', 'api/index/index', [
  'categoryID' => '\d+',
  'complete_match' => true,
]);
// 返回各栏目数据 （分页）
Route::get('api/cate/:categoryID/page/:pageNumber', 'api/index/index', [
  'categoryID' => '\d+',
  'pageNumber' => '\d+',
  'complete_match' => true,
]);
// 返回各栏目数据  limit 条数限制
Route::get('api/cate/:categoryID/limit/:limit', 'api/index/index', [
  'categoryID' => '\d+',
  'limit' => '\d+',
  'complete_match' => true,
]);
// 返回全部栏目数据  limit 条数限制
Route::get('api/limit/:limit', 'api/index/index', [
  'limit' => '\d+',
  'complete_match' => true,
]);
// 返回全部栏目[随机]数据  limit 条数限制
Route::get('api/rand/limit/:limit', 'api/index/random', [
  'limit' => '\d+',
  'complete_match' => true,
]);
// 返回指定栏目[随机]数据  limit 条数限制
Route::get('api/cate/:categoryID/rand/limit/:limit', 'api/index/random', [
  'categoryID' => '\d+',
  'limit' => '\d+',
  'complete_match' => true,
]);
//获取内容详情
Route::get('api/detail/:detailID', 'api/index/read', [
  'detailID' => '\d+',
  'complete_match' => true,
]);

//获取轮播图数据
Route::get('api/slide/:limit', 'api/index/slide', [

  ':limit' => '\d+',
  'complete_match' => true,

]);


// 获取相关内容

Route::get('api/relate/:keyword/limit/:limit/id/:id', 'api/index/relate', [
  ':keyword' => '\w+',
  ':limit' => '\d+',
  ':id' => '\d+',
  'complete_match' => true,

]);






//显示查询页面
Route::get('index/brand/index', 'index/brand/index');
// 后台接口数据
Route::get('api/brand/index', 'api/brand/index');
// 提交服务器接口
Route::post('api/brand/update', 'api/brand/update');


//错误
Route::get('api', 'api/index/other');
