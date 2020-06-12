<?php

namespace app\common\model;

use think\Model;
use think\Session;

class Article extends Model
{
  protected $insert = ['create_time'];
  /**
   * 文章作者
   * @param $value
   * @return mixed
   */
  protected function setAuthorAttr($value)
  {
    return $value ? $value : Session::get('admin_name');
  }
  /**
   * 反转义HTML实体标签
   * @param $value
   * @return string
   */
  protected function setContentAttr($value)
  {
    return htmlspecialchars_decode($value);
  }
  /**
   * 序列化photo图集
   * @param $value
   * @return string
   */
  protected function setPhotoAttr($value)
  {
    return serialize($value);
  }
  /**
   * 反序列化photo图集
   * @param $value
   * @return mixed
   */
  protected function getPhotoAttr($value)
  {
    return unserialize($value);
  }
  /**
   * 创建时间
   * @return bool|string
   */
  protected function setCreateTimeAttr()
  {
    return date('Y-m-d H:i:s');
  }
  /**
   * randQuery    随机查询 N 条
   *
   * @param  mixed $categoryID  栏目ID
   * @param  mixed $limit     N条  
   * @return void
   */
  public static  function randQuery($categoryID, $limit)
  {
    $cates = [];
    //全站
    if (empty($categoryID)) {
      $count = self::count('id');   //可查询数
      $min  = self::min('id');   //文章ID最小值
    } else {
      //指定栏目
      $cates = collection(self::where('cid', $categoryID)->field('id')->order('id asc')->select())->toArray(); //  [3,5,6.7,9,20,56,]

      // var_dump($cates);
      // return;

      $count = self::where('cid', $categoryID)->field('id')->order('id asc')->count('id');   //可查询数
      $min  =  self::where('cid', $categoryID)->field('id')->order('id asc')->min('id');   //文章ID最小值
    }
    if ($count < $limit) {
      $limit = $count;
    }
    $i = 1;
    $flag = 0;
    $arr = array();
    $data = null;
    $randNumber = null;
    while ($i <= $limit) {
      if (empty($categoryID)) {
        $randNumber = rand($min, $count); //抽取随机数 (从最小ID和最大ID中随机)
      } else {

        $xiabiao = rand(0, $count - 1);

        $randNumber =  $cates[$xiabiao]['id'];
      }
      if ($flag != $randNumber) {
        //过滤重复 
        if (!in_array($randNumber, $arr)) {
          $arr[] = $randNumber;   //生成的随机数(ID)数组
          $flag = $randNumber;   // 当前随机数作为对比标准
        } else {
          // 排除已经生成的随机数，减少生成次数
          $i--;
        }
        //生成了和上一个随机数相同的情况，增加生成次数
        $i++;
      }
    }

    // if (empty($categoryID)) {
    //   $data = self::where('id', 'in', $arr)->select();
    // } else {

    //   $data = self::where('id', 'in', $arr)->select();
    // }

    $data = self::where('id', 'in', $arr)->select();
    return $data;
  }
}
