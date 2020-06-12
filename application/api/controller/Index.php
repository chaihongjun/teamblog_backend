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
        // echo "1";
        // return;
      }
      //【栏目ID】存在【分页】不存在
      else {
        // 【栏目ID】存在【分页】不存在【limit】不存在
        if (empty($limit)) {
          $data =  collection(ArticleModel::where('cid', $categoryID)->select())->toArray();
          // [
          //  
          //
          //
          // ]
          $total = count($data);
          // $per_page = $pagesize;
          // $current_page = null;
          // $last_page = null;
          $cateName =  CategoryModel::where('id', $categoryID)->value('name');
          $cateDir = CategoryModel::where('name', $cateName)->value('dir');
          //添加 分类名称 分类目录 分类ID到结果
          $Blogs['total'] =   $total;
          $Blogs['cateName'] =  $cateName;
          $Blogs['cateDir'] =  $cateDir;
          $blogs['categoryID'] = $categoryID;
          $Blogs['data'] =   $data;
          // echo "2";
          // return;
        }
        // 【栏目ID】  存在   【分页】   不存在 【limit】  存在
        else {
          $data =  collection(ArticleModel::where('cid', $categoryID)->limit($limit)->select())->toArray();
          // [
          //  
          //
          //
          // ]
          $total = count($data);
          // $per_page = $pagesize;
          // $current_page = null;
          // $last_page = null;
          $cateName =  CategoryModel::where('id', $categoryID)->value('name');
          $cateDir = CategoryModel::where('name', $cateName)->value('dir');
          //添加 分类名称 分类目录 分类ID到结果
          $Blogs['total'] =   $total;
          $Blogs['cateName'] =  $cateName;
          $Blogs['cateDir'] =  $cateDir;
          $blogs['categoryID'] = $categoryID;
          $Blogs['data'] =   $data;
          // echo "3";
          // return;
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
        // 0 => 
        //   array (size=1)
        //     'cid' => int 1
        // 1 => 
        //   array (size=1)
        //     'cid' => int 4
        // 2 => 
        //   array (size=1)
        //     'cid' => int 1
        // 3 => 
        //   array (size=1)
        //     'cid' => int 4
        // var_dump($cateIDPerPage);
        // exit;
        // $cateIDPerPage[0]['cid']  获取当前页面第一个文章的栏目ID
        // 获取全部栏目名称和对应ID
        //$cateDirPerPage = CategoryModel::column('name, dir', 'id');

        // array (size=5)
        // 1 => 
        //   array (size=3)
        //     'id' => int 1
        //     'name' => string '科技' (length=6)
        //     'dir' => string '/tech' (length=5)
        // 2 => 
        //   array (size=3)
        //     'id' => int 2
        //     'name' => string '产品中心' (length=12)
        //     'dir' => string '/product' (length=8)
        // 3 => 
        //   array (size=3)
        //     'id' => int 3
        //     'name' => string '电脑' (length=6)
        //     'dir' => string '/product/computer' (length=17)
        // 4 => 
        //   array (size=3)
        //     'id' => int 4
        //     'name' => string 'pc机' (length=5)
        //     'dir' => string '/product/computer/pc' (length=20)
        // 5 => 
        //   array (size=3)
        //     'id' => int 5
        //     'name' => string '网站公告' (length=12)
        //     'dir' => string '/notice' (length=7)


        //  $cateDirPerPage[1]['id']  $cateDirPerPage[1]['name']  $cateDirPerPage[1]['dir']
        // var_dump($cateDirPerPage);
        // exit;
      }
      // 【栏目ID】 不存在  【分页】 不存在
      else {
        // 【栏目ID】 不存在  【分页】 不存在  【Limit】 存在
        if (!empty($limit)) {
          $data = collection(ArticleModel::limit($limit)->select())->toArray();
          // [
          //  
          //
          //
          // ]
          $total = count($data);
          // $per_page = $pagesize;
          // $current_page = null;
          // $last_page = null;
          $Blogs['total'] =   $total;
          $Blogs['data'] =   $data;
          $per_page = null;  //清空分页
          // echo "5";
          // return;
        }
        // 【栏目ID】 不存在  【分页】 不存在  【Limit】 不存在
        else {
          $data = collection(ArticleModel::all())->toArray();
          // [
          //  
          //
          //
          // ]
          $total = count($data);
          // $per_page = $pagesize;
          // $current_page = null;
          // $last_page = null;
          $Blogs['total'] =   $total;
          $Blogs['data'] =   $data;
          $per_page = null;  //清空分页 
          // echo "6";
          // return;
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
    // echo  '$categoryID: ' . $categoryID;
    // echo '</br>';
    // echo    '$limit: ' . $limit;
    // var_dump($categoryID);
    // return;
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
    // {
    //   "id": 1,
    //   "cid": 1,
    //   "title": "云适配获千万美金B轮融资，将开发移动端企业安全浏览器",
    //   "shorttitle": "云适配获千万美金B轮融资",
    //   "introduction": "不论是打车，买菜，交水电费，乃至于按摩，现在几乎你能想到的消费行为都能通过移动端进行操作——事实已经证明移动端的对消费者服务是个大市场。那么对企业移动端的服务的市场又怎样呢？至少近日晨兴创投和 IDG 资本对云适配千万美元级的投资能告诉我们，风险资本觉得这个市场正在变好。",
    //   "content": "<p><img src=\"https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/110.jpg\"/></p><p>不论是打车，买菜，交水电费，乃至于按摩，现在几乎你能想到的消费行为都能通过移动端进行操作——事实已经证明移动端的对消费者服务是个大市场。那么对企业移动端的服务的市场又怎样呢？至少近日晨兴创投和 IDG 资本对云适配千万美元级的投资能告诉我们，风险资本觉得这个市场正在变好。</p><p>云适配创立于 2012 年，主要业务是通过网页内容的抓取和适配，将PC端的网页自动转化为适合移动端的网页。通过这项名为跨屏云 Xcloud 的服务，企业用户不用修改任何网页的前端设计便能把让本不支持移动端浏览的网页获得适应移动端排版和布局。 三年来，云适配的技术被用在了超过 30 万的企业网站上，其中包括中国政府网，北京大学官网，联想海信的官网等。<br/></p><p>大部分企业用户的网页再适配都是在公有云完成，这部分服务云适配免费提供。不过一些对信息安全极为重视的客户，比如政府和金融企业等，会选择将跨屏云部署在自己的私有云上，云适配会向这些用户收取一定的费用。<br/></p><p>除了网页适配外，云适配的另一项服务是开源的 HTML 5 前端框架 Amaze UI。Amaze UI 是一款类似 Bootsrap 的前端模块库，相较于 Twitter 驰名天下的 Boostrap，Amaze UI 做了更多针对中文和国内主流浏览器的优化。目前Amaze UI 在 GitHub上 有 4000 多的收藏和 1000 多的fork。利用 Amaze UI，开发者能使用和修改现成的 HTML 5 模块，从而加速开发。<br/></p><p>当然，一个仅仅是现金流良好的自动化网页适配公司并不需要千万美元级的 B轮融资。云适配正在开发一款移动安全浏览器，试图利用跨屏云带来的用户基础进入更深层的企业服务市场。这款安全浏览器支持缓存数据沙盒化，以及VPN 网络沙盒化等功能，从而在网页端提供一个安全的移动互联网办公环境。目前这款浏览器尚在开发中，预计今年九月发布。<br/></p><p>对于这次的融资，云适配的创始人，前微软 IE 工程师陈本峰说道，“因为我自己是 HTML 5 的中国区布道师，所以我觉得我们这次融资不仅是对这个企业，也是市场对 HTML 5 在更宽广的应用前景上的认可。”<br/></p><p><br/></p>",
    //   "author": "admin",
    //   "status": 1,
    //   "reading": 0,
    //   "thumb": "",
    //   "photo": false,
    //   "is_top": 0,
    //   "is_recommend": 0,
    //   "sort": 0,
    //   "create_time": "2017-04-11 14:10:10",
    //   "publish_time": "2017-04-11 14:09:45"
    //   }
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
