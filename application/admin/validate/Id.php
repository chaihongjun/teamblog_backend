<?php

namespace app\admin\validate;

use think\Validate;

class Id extends Validate
{
  protected $rule = [
    'id'           => 'require|integer|gt:0',
  ];
}
