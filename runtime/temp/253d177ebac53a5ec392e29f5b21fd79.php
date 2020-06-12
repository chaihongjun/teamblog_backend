<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:54:"D:\xampp\htdocs\backend\themes/admin/article\edit.html";i:1590564867;s:46:"D:\xampp\htdocs\backend\themes\admin\base.html";i:1590538902;}*/ ?>
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
            <li class=""><a href="<?php echo url('admin/article/index'); ?>">文章管理</a></li>
            <li class=""><a href="<?php echo url('admin/article/add'); ?>">添加文章</a></li>
            <li class="layui-this">编辑文章</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form form-container" action="<?php echo url('admin/article/update'); ?>" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属栏目</label>
                        <div class="layui-input-block">
                            <select name="cid" lay-verify="required">
                                <?php if(is_array($category_level_list) || $category_level_list instanceof \think\Collection || $category_level_list instanceof \think\Paginator): if( count($category_level_list)==0 ) : echo "" ;else: foreach($category_level_list as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>" <?php if($article['cid']==$vo['id']): ?> selected="selected"<?php endif; ?>><?php if($vo['level'] != '1'): ?>|<?php for($i=1;$i<$vo['level'];$i++){echo ' ----';} endif; ?> <?php echo $vo['name']; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" value="<?php echo $article['title']; ?>" required  lay-verify="required" placeholder="请输入标题" class="layui-input">
                        </div>
                    </div>


                     
                    <div class="layui-form-item">
                      <label class="layui-form-label">短标题</label>
                      <div class="layui-input-block">
                          <input type="text" name="shorttitle" value="<?php echo $article['shorttitle']; ?>"  placeholder="(选填)请输入短标题" class="layui-input">
                      </div>
                  </div>



                    <div class="layui-form-item">
                        <label class="layui-form-label">作者</label>
                        <div class="layui-input-block">
                            <input type="text" name="author" value="<?php echo $article['author']; ?>" placeholder="（选填）请输入作者" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">简介</label>
                        <div class="layui-input-block">
                            <textarea name="introduction" placeholder="（选填）请输入简介" class="layui-textarea"><?php echo $article['introduction']; ?></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">内容</label>
                        <div class="layui-input-block">
                            <textarea name="content" lay-verify="content" placeholder="" class="layui-textarea" id="content"><?php echo $article['content']; ?></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">缩略图</label>
                        <div class="layui-input-block">
                            <input type="text" name="thumb" value="<?php echo $article['thumb']; ?>" class="layui-input layui-input-inline" id="thumb">
                            <input type="file" name="file" class="layui-upload-file">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图集</label>
                        <div class="layui-input-block">
                            <button type="button" id="upload-photo-btn" class="layui-btn">上传图集</button>
                            <div id="photo-container">
                                <?php if(!empty($article['photo'])): if(is_array($article['photo']) || $article['photo'] instanceof \think\Collection || $article['photo'] instanceof \think\Paginator): if( count($article['photo'])==0 ) : echo "" ;else: foreach($article['photo'] as $key=>$vo): ?>
                                <div class="photo-list">
                                    <input type="text" name="photo[]" value="<?php echo $vo; ?>" class="layui-input layui-input-inline">
                                    <button type="button" class="layui-btn layui-btn-danger remove-photo-btn">移除</button>
                                </div>
                                <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="status" value="1" title="已审核" <?php if($article['status']==1): ?> checked="checked"<?php endif; ?>>
                            <input type="radio" name="status" value="0" title="未审核" <?php if($article['status']==0): ?> checked="checked"<?php endif; ?>>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">置顶</label>
                        <div class="layui-input-block">
                            <input type="radio" name="is_top" value="1" title="置顶" <?php if($article['is_top']==1): ?> checked="checked"<?php endif; ?>>
                            <input type="radio" name="is_top" value="0" title="未置顶" <?php if($article['is_top']==0): ?> checked="checked"<?php endif; ?>>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">推荐</label>
                        <div class="layui-input-block">
                            <input type="radio" name="is_recommend" value="1" title="推荐" <?php if($article['is_recommend']==1): ?> checked="checked"<?php endif; ?>>
                            <input type="radio" name="is_recommend" value="0" title="未推荐" <?php if($article['is_recommend']==0): ?> checked="checked"<?php endif; ?>>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">发布时间</label>
                        <div class="layui-input-block">
                            <input type="text" name="publish_time" value="<?php echo $article['publish_time']; ?>" class="layui-input datetime">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">排序</label>
                        <div class="layui-input-block">
                            <input type="text" name="sort" value="<?php echo $article['sort']; ?>" required  lay-verify="required" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="hidden" name="id" value="<?php echo $article['id']; ?>">
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
    $(function() {
        var ue = UE.getEditor('content'),
            uploadEditor = UE.getEditor('upload-photo-btn'),
            photoListItem,
            uploadImage;

        uploadEditor.ready(function () {
            uploadEditor.setDisabled();
            uploadEditor.hide();
            uploadEditor.addListener('beforeInsertImage', function (t, arg) {
                $.each(arg, function (index, item) {
                    photoListItem = '<div class="photo-list"><input type="text" name="photo[]" value="' + item.src + '" class="layui-input layui-input-inline">';
                    photoListItem += '<button type="button" class="layui-btn layui-btn-danger remove-photo-btn">移除</button></div>';

                    $('#photo-container').append(photoListItem).on('click', '.remove-photo-btn', function () {
                        $(this).parent('.photo-list').remove();
                    });
                });
            });
        });

        $('#upload-photo-btn').on('click', function () {
            uploadImage = uploadEditor.getDialog("insertimage");
            uploadImage.open();
        });
        
        $('.remove-photo-btn').on('click', function () {
            $(this).parent('.photo-list').remove();
        });
    });
</script>

  </body>
</html>
