<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use  app\common\model\Brand as BrandModel;

class Brand extends Controller
{
  //显示品牌信息
  public function index(Request $request)
  {
    //api/brand/index
    header('Access-Control-Allow-Origin:*');
    // 响应类型
    header('Access-Control-Allow-Methods:GET');
    $brands = collection(BrandModel::all())->toArray();
    return json($brands);
  }
  //保存品牌信息
  public function update(Request $request)
  {
    header('Access-Control-Allow-Origin:*');
    header('Access-Control-Allow-Methods:POST');
    header('Content-Type:application/json;charset=utf-8');
    if ($request->isPost()) {
      $id =  $request->param('id');
      $mobile =  $request->param('mobile');
      $owner =  $request->param('owner');
      $data['mobile'] = $mobile;
      $data['owner'] = $owner;
      $result = BrandModel::where('id', $id)->update($data);
      if ($result) {
        $res = [
          'status' => 200,
          'msg' => 'update success!',
        ];
      } else {
        $res = [
          'status' => 500,
          'msg' => 'update failure!',
        ];
      }
      return json_encode($res);
    }
  }
}
