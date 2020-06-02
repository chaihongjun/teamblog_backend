<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use  app\common\model\Article;
use  app\common\model\Category;
use think\response\Json;
use think\response\Jsonp;

class Index extends Controller
{
  /**
   * 显示资源列表
   *
   * @return \think\Response
   */
  public function index(Request $request)
  {
    $pagenumber = $request->param('pagenumber');
    // return;
    // 显示全部博客文章信息
    $blogs = Article::paginate(2, false, ['page' => $pagenumber])->toArray();
    //包装成 response 对象
    if ($blogs) {
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
      'total' => $blogs['total'],
      'per_page' => $blogs['per_page'],
      'current_page' => $blogs['current_page'],
      'last_page' =>  $blogs['last_page'],
      'data' => $blogs['data'],
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
    /*     header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: token, Origin, X-Requested-With, Content-Type, Accept, Authorization");
    header('Access-Control-Allow-Methods: POST,GET,PUT,DELETE'); */
    //判断是否是get请求
    if ($this->request->isGet()) {
      $id = $this->request->param();
      // var_dump($id);
      // return;
      $validate_result  =  $this->validate($id, 'admin/Id');
      if ($validate_result !== true) {
        $this->error($validate_result);
      } else {
        $blog = Article::get($id);
        // 获取文章所在栏目ID
        $cid = $blog['cid'];
        // 获取文章所在栏目
        $dir =  Category::get(function ($query) use ($cid) {
          $query->where('id',  $cid);
        })->value('dir');
        $res = [
          'host' => $this->request->host(),
          'url' => $this->request->url(),
          'id' =>  $this->request->param('id'),
          'message' => "请求成功",
          'dir' =>   $dir,
          'data' => $blog,
        ];
        return json($res);
      }
    }
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
