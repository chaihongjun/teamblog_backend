<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use  app\common\model\Article;
use  app\common\model\Category as CategoryModel;
use think\response\Json;
use think\response\Jsonp;

class Category extends Controller
{



  /**
   * categoryList 返回栏目资源列表
   *
   * @param  mixed $request
   * @return void
   */
  public function index(Request $request)
  {

    echo "cate";

    $categoryID = $request->param('categoryID');  //获取访问的栏目ID
    $pageNumber = $request->param('pageNumber');  //获取当前的分页页码

    // if (empty($pageNumber)) {
    //   $pageNumber = 1;
    // }


    // 显示指定栏目博客
    $cateBlogs = Article::where('cid', $categoryID)->paginate(4, false, ['page' => $pageNumber])->toArray();
    $cateName =  CategoryModel::where('id', $categoryID)->value('name');


    $catalog = CategoryModel::where('name', $cateName)->value('dir');

    //包装成 response 对象
    if ($cateBlogs) {
      $status = 200;
      $message = "请求成功";
    } else {
      $status = 404;
      $message = "请求失败";
    }
    $res = [
      'host' => $this->request->host(),
      'url' => $this->request->url(),
      'message' => $message,
      'status' =>  $status,
      'total' => $cateBlogs['total'],
      'per_page' => $cateBlogs['per_page'],
      'current_page' => $cateBlogs['current_page'],
      'last_page' =>  $cateBlogs['last_page'],
      'categoryName' => $cateName,
      'catalogDir' => $catalog,
      'catalogId' => $categoryID,
      'data' => $cateBlogs['data'],
    ];
    return json($res);
    //return json_encode($res);
  }



  /**
   * 显示创建资源表单页.
   *
   * @return \think\Response
   */
  public function create()
  {
    //
  }
  /**
   * 保存新建的资源
   *
   * @param  \think\Request  $request
   * @return \think\Response
   */
  public function save()
  {
    //
  }
  /**
   * 显示指定的资源
   *
   * @param  int  $id
   * @return \think\Response
   */
  public function read($id)
  {
  }
  /**
   * 显示编辑资源表单页.
   *
   * @param  int  $id
   * @return \think\Response
   */
  public function edit($id)
  {
    //
  }
  /**
   * 保存更新的资源
   *
   * @param  \think\Request  $request
   * @param  int  $id
   * @return \think\Response
   */
  public function update(Request $request, $id)
  {
    //
  }
  /**
   * 删除指定资源
   *
   * @param  int  $id
   * @return \think\Response
   */
  public function delete($id)
  {
    //
  }
}
