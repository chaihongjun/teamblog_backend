<?php

namespace app\index\controller;

use think\Controller;

class Brand extends Controller
{
  public function index()
  {
    return $this->fetch();
  }
}
