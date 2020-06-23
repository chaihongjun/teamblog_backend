<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use  app\common\model\Article as ArticleModel;
use  app\common\model\Category as CategoryModel;

class Index extends Controller
{
  /**
   * 显示资源列表
   *
   * @return \think\Response
   */
  public function index(Request $request)
  {
    $categoryID = $request->param('categoryID');  //获取访问的栏目ID
    $pageNumber = $request->param('pageNumber');  //获取当前的分页页码;
    $limit = $request->param('limit');
    $pagesize = 4; //  分页条数
    $Blogs = null;
    $cateName = null;
    $total = null;
    $cateDir = null;
    $per_page = $pagesize;
    $current_page = null;
    $last_page = null;
    $res = [];
    $status = 200;
    $message = "请求成功！";
    $cateDirPerPage = [];
    // 【栏目ID】 存在
    if (!empty($categoryID)) {
      //【栏目ID】  存在   【分页】   存在
      if (!empty($pageNumber)) {
        $Blogs = ArticleModel::where('cid', $categoryID)->paginate($pagesize, false, ['page' => $pageNumber, 'list_rows' => $pagesize])->toArray();
        // {
        //   "total": 7,
        //   "per_page": 4,
        //   "current_page": 1,
        //   "last_page": 2,
        //    "cateName" : 'XXX',    分类名称 
        //    "cateDir" : 'yyy',     分类目录
        //    "categoryID" : '234',  分类ID
        //    "data": [
        //            'id':'xxx',
        //             'cid':'xxx',
        //                  ......  
        //]
        //   }
        $cateName =  CategoryModel::where('id', $categoryID)->value('name');
        $cateDir = CategoryModel::where('name', $cateName)->value('dir');
        //添加 分类名称 分类目录 分类ID到结果
        $Blogs['cateName'] =  $cateName;
        $Blogs['cateDir'] =  $cateDir;
        $blogs['categoryID'] = $categoryID;
      }
      //【栏目ID】存在【分页】不存在
      else {
        // 【栏目ID】存在【分页】不存在【limit】不存在
        if (empty($limit)) {
          $data =  collection(ArticleModel::where('cid', $categoryID)->select())->toArray();

          $total = count($data);

          $cateName =  CategoryModel::where('id', $categoryID)->value('name');
          $cateDir = CategoryModel::where('name', $cateName)->value('dir');
          //添加 分类名称 分类目录 分类ID到结果
          $Blogs['total'] =   $total;
          $Blogs['cateName'] =  $cateName;
          $Blogs['cateDir'] =  $cateDir;
          $blogs['categoryID'] = $categoryID;
          $Blogs['data'] =   $data;
        }
        // 【栏目ID】  存在   【分页】   不存在 【limit】  存在
        else {
          $data =  collection(ArticleModel::where('cid', $categoryID)->limit($limit)->select())->toArray();

          $total = count($data);

          $cateName =  CategoryModel::where('id', $categoryID)->value('name');
          $cateDir = CategoryModel::where('name', $cateName)->value('dir');
          //添加 分类名称 分类目录 分类ID到结果
          $Blogs['total'] =   $total;
          $Blogs['cateName'] =  $cateName;
          $Blogs['cateDir'] =  $cateDir;
          $blogs['categoryID'] = $categoryID;
          $Blogs['data'] =   $data;
        }
      }
    }
    //【栏目ID】 不存在
    else {
      //【栏目ID】 不存在  【分页】 存在
      if (!empty($pageNumber)) {
        $Blogs = ArticleModel::paginate($pagesize, false, ['page' => $pageNumber])->toArray();
        //分页查询文章对应的 栏目ID
        $articleCateID = ArticleModel::where('id', '>', 0)->field('cid')->paginate($pagesize, false, ['page' => $pageNumber])->toArray();
      }
      // 【栏目ID】 不存在  【分页】 不存在
      else {
        // 【栏目ID】 不存在  【分页】 不存在  【Limit】 存在
        if (!empty($limit)) {
          $data = collection(ArticleModel::limit($limit)->select())->toArray();

          $total = count($data);

          $Blogs['total'] =   $total;
          $Blogs['data'] =   $data;
          $per_page = null;  //清空分页

        }
        // 【栏目ID】 不存在  【分页】 不存在  【Limit】 不存在
        else {
          $data = collection(ArticleModel::all())->toArray();

          $total = count($data);

          $Blogs['total'] =   $total;
          $Blogs['data'] =   $data;
          $per_page = null;  //清空分页 

        }
      }
    }
    //包装成 response 对象
    if ($Blogs) {
      $status = 200;
      $message = "请求成功";
    } else {
      $status = 404;
      $message = "请求失败";
    }

    //获取全部栏目名称和对应ID
    $cateDirPerPage = CategoryModel::column('name, dir', 'id');
    $res = [
      'host' => $this->request->host(),
      'url' => $this->request->url(),
      'message' => $message,
      'status' =>  $status,
      'total' => isset($Blogs['total']) ? $Blogs['total'] : $total,
      'per_page' => isset($Blogs['per_page']) ? $Blogs['per_page'] : $per_page,
      'current_page' => isset($Blogs['current_page']) ? $Blogs['current_page'] : $current_page,
      'last_page' =>   isset($Blogs['last_page']) ? $Blogs['last_page'] : $last_page,
      'cateName' => isset($Blogs['cateName']) ? $Blogs['cateName'] : $cateName,
      'cateDir' => isset($Blogs['cateDir']) ? $Blogs['cateDir'] : $cateDir,
      'cateId' => isset($Blogs['categoryID']) ? $Blogs['categoryID'] : $categoryID,
      'cateDirPerPage' => $cateDirPerPage,
      'data' => isset($Blogs['data']) ? $Blogs['data'] : $Blogs,
    ];
    return json($res);
  }











  /**
   * random 查询随机数据
   *
   * @param  mixed $request
   * @return void
   */
  public function random(Request $request)
  {
    $categoryID = $request->param('categoryID');  //获取访问的栏目ID
    $limit = $request->param('limit');

    //获取N条随机数
    $data =  collection(ArticleModel::randQuery($categoryID,  $limit))->toArray();

    //获取全部栏目名称和对应ID
    $cateDirPerPage = CategoryModel::column('name, dir', 'id');

    $res['cateId'] = $categoryID;
    $res['total'] = $limit;
    $res['cateDirPerPage'] = $cateDirPerPage;
    $res['data'] = $data;

    return json($res);
  }
  public function other(Request $request)
  {
    $res = [
      'message' => '请求无效',
      'status' =>  400,
    ];
    return json($res);
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
  public function read(Request $request)
  {
    $detailID = $request->param('detailID');  //获取指定内容ID
    $data = ArticleModel::get($detailID)->toArray();

    $cateID = $data['cid'];
    $cateDir =  CategoryModel::where('id', $cateID)->value('dir');
    $cateName =  CategoryModel::where('id', $cateID)->value('name');
    $res = [
      'cateDir' => $cateDir,
      'cateName' => $cateName,
      'data' => $data,
    ];
    return json($res);
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
