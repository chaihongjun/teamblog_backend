<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:55:"D:\xampp\htdocs\backend\themes/admin/category\edit.html";i:1590745616;s:46:"D:\xampp\htdocs\backend\themes\admin\base.html";i:1590538902;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <title>后台管理</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="/public/static/js/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/public/static/css/font-awesome.min.css" />
    <!--CSS引用-->
    
    <link rel="stylesheet" href="/public/static/css/admin.css" />
    <!--[if lt IE 9]>
      <script src="/public/static/css/html5shiv.min.js"></script>
      <script src="/public/static/css/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="layui-layout layui-layout-admin">
      <!--头部-->
      <div class="layui-header header">
        <a href=""
          ><img class="logo" src="/public/static/images/admin_logo.png" alt=""
        /></a>
        <ul
          class="layui-nav"
          style="position: absolute; top: 0; right: 20px; background: none;"
        >
          <li class="layui-nav-item">
            <a href="<?php echo url('/'); ?>" target="_blank">前台首页</a>
          </li>
          <li class="layui-nav-item">
            <a href="" data-url="<?php echo url('admin/system/clear'); ?>" id="clear-cache"
              >清除缓存</a
            >
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;"><?php echo session('admin_name'); ?></a>
            <dl class="layui-nav-child">
              <!-- 二级菜单 -->
              <dd>
                <a href="<?php echo url('admin/change_password/index'); ?>">修改密码</a>
              </dd>
              <dd><a href="<?php echo url('admin/login/logout'); ?>">退出登录</a></dd>
            </dl>
          </li>
        </ul>
      </div>

      <!--侧边栏-->
      <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
          <ul class="layui-nav layui-nav-tree">
            <li class="layui-nav-item layui-nav-title"><a>管理菜单</a></li>
            <li class="layui-nav-item">
              <a href="<?php echo url('admin/index/index'); ?>"
                ><i class="fa fa-home"></i> 网站信息</a
              >
            </li>
            <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): if( count($menu)==0 ) : echo "" ;else: foreach($menu as $key=>$vo): if(isset($vo['children'])): ?>
            <li class="layui-nav-item">
              <a href="javascript:;"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
              <dl class="layui-nav-child">
                <?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): if( count($vo['children'])==0 ) : echo "" ;else: foreach($vo['children'] as $key=>$v): ?>
                <dd><a href="<?php echo url($v['name']); ?>"> <?php echo $v['title']; ?></a></dd>
                <?php endforeach; endif; else: echo "" ;endif; ?>
              </dl>
            </li>
            <?php else: ?>
            <li class="layui-nav-item">
              <a href="<?php echo url($vo['name']); ?>"
                ><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a
              >
            </li>
            <?php endif; endforeach; endif; else: echo "" ;endif; ?>

            <li
              class="layui-nav-item"
              style="height: 30px; text-align: center;"
            ></li>
          </ul>
        </div>
      </div>

      <!--主体-->
      
<div class="layui-body">
    <!--tab标签-->
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class=""><a href="<?php echo url('admin/category/index'); ?>">栏目管理</a></li>
            <li class=""><a href="<?php echo url('admin/category/add'); ?>">添加栏目</a></li>
            <li class="layui-this">编辑栏目</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form form-container" action="<?php echo url('admin/category/update'); ?>" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">上级栏目</label>
                        <div class="layui-input-block">
                            <select name="pid" lay-verify="required">
                                <option value="0">一级栏目</option>
                                <?php if(is_array($category_level_list) || $category_level_list instanceof \think\Collection || $category_level_list instanceof \think\Paginator): if( count($category_level_list)==0 ) : echo "" ;else: foreach($category_level_list as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>" <?php if($category['id']==$vo['id']): ?> disabled="disabled"<?php endif; if($category['pid']==$vo['id']): ?> selected="selected"<?php endif; ?>><?php if($vo['level'] != '1'): ?>|<?php for($i=1;$i<$vo['level'];$i++){echo ' ----';} endif; ?> <?php echo $vo['name']; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">栏目名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" value="<?php echo $category['name']; ?>" required  lay-verify="required" placeholder="请输入栏目名称" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">别名</label>
                        <div class="layui-input-block">
                            <input type="text" name="alias" value="<?php echo $category['alias']; ?>" placeholder="（选填）请输入栏目别名" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                      <label class="layui-form-label">目录</label>
                      <div class="layui-input-block">
                          <input type="text" name="dir" value="<?php echo $category['dir']; ?>" placeholder="请输入对应目录名称(英文比如: news)" class="layui-input">
                      </div>
                  </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图标</label>
                        <div class="layui-input-block">
                            <input type="text" name="icon" value="<?php echo $category['icon']; ?>" placeholder="（选填）如：fa fa-home" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">缩略图</label>
                        <div class="layui-input-block">
                            <input type="text" name="thumb" value="<?php echo $category['thumb']; ?>" class="layui-input layui-input-inline" id="thumb">
                            <input type="file" name="file" class="layui-upload-file">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">内容</label>
                        <div class="layui-input-block">
                            <textarea name="content" class="layui-textarea" id="content"><?php echo $category['content']; ?></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <select name="type" lay-verify="required">
                                <option value="1" <?php if($category['type']==1): ?> selected="selected"<?php endif; ?>>列表</option>
                                <option value="2" <?php if($category['type']==2): ?> selected="selected"<?php endif; ?>>单页</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">排序</label>
                        <div class="layui-input-block">
                            <input type="text" name="sort" value="<?php echo $category['sort']; ?>" required  lay-verify="required" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">列表模板</label>
                        <div class="layui-input-block">
                            <input type="text" name="list_template" value="<?php echo $category['list_template']; ?>" placeholder="（选填）请输入模板文件名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">详情模板</label>
                        <div class="layui-input-block">
                            <input type="text" name="detail_template" value="<?php echo $category['detail_template']; ?>" placeholder="（选填）请输入模板文件名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="hidden" name="id" value="<?php echo $category['id']; ?>">
                            <button class="layui-btn" lay-submit lay-filter="*">更新</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


      <!--底部-->
      <div class="layui-footer footer">
        <div class="layui-main">
          <p>
            2016-2017 &copy;
            <a
              href="http://www.sucainiu.com/thinkphp5-layui.html"
              target="_blank"
              >素材牛</a
            >
          </p>
        </div>
      </div>
    </div>

    <script>
      // 定义全局JS变量
      var GV = {
        current_controller: "admin/<?php echo (isset($controller) && ($controller !== '')?$controller:''); ?>/",
        base_url: "/public/static",
      };
    </script>
    <!--JS引用-->
    <script src="/public/static/js/jquery.min.js"></script>
    <script src="/public/static/js/layui/lay/dest/layui.all.js"></script>
    <script src="/public/static/js/admin.js"></script>
    
<script src="/public/static/js/ueditor/ueditor.config.js"></script>
<script src="/public/static/js/ueditor/ueditor.all.min.js"></script>

    <!--页面JS脚本-->
    
<script>
    var ue = UE.getEditor('content');
</script>

  </body>
</html>
