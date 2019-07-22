<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----申请发票</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-applyinvoice.css">
</head>
<body>
    <!-- 顶部 -->
  <div class="top">
    <div class="header w clearfix">
      <!-- logo区域 -->
      <div class="logo l">
        <a href="/main.index.do" style="display: inline-block;">
          <img src="${skin}front/img/logo.png" alt="">
        </a>
      </div>
      <!-- 导航部分 -->
      <div class="nav l">
        <ul class="clearfix">
                 <li class="l"><a href="/userQd.center.do">个人中心</a></li>
                 <li class="l"><a href="/userQd.tenderserver.do">在线客服</a></li>
                 <li class="l"><a href="/userQd.memberserver.do">会员服务</a></li>
                 <li class="l"><a href="/userQd.promotionserver.do">推广服务</a></li>
            <li class="l"><a href="/orderInfo.index.do">发票申请</a></li>
        </ul>
      </div>
      <!-- 个人中心部分 -->
      <div class="personal r">
        <div class="detail clearfix">
          <div class="l">
            <a href="/systemQd.systeminformation.do"><img src="${skin}front/img/icon-email.jpg" alt=""></a>
          </div>
          <div class="l">
            <a href="/systemQd.paymentInstruction.do"><img src="${skin}front/img/icon-rang.jpg" alt=""></a>
          </div>
          <div class="l">
            <img src="${user.portraitUrl}" alt="">
            <span>${user.showName}</span>
            <i class="fa fa-angle-down"></i>
          </div>
          <ul class="ul">
            <li>
              <a href="/userQd.accountInformationIndex.do">账号信息</a>
            </li>
            <li>
               <a href="/userQd.changePwdIndex.do">安全设置</a>
            </li>
            <li>
              <a href="/userQd.logout.do">退出登录</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- 主体部分 -->
  <div class="main">
    <div class="middle w clearfix">
      <!-- 左侧 -->
      <div class="left l">
        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
          <li class="layui-nav-item"><a href="userQd.center.do">基本信息</a></li>
          <li class="layui-nav-item">
            <a href="javascript:;">招标服务</a>
            <dl class="layui-nav-child">
              <dd><a href="/trackerFront.page.do">跟踪信息</a></dd>
              <dd><a href="/designedinfo.listIndex.do">项目专盯</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">供应商库</a>
            <dl class="layui-nav-child">
              <dd><a href="/application.entry.do">申请入驻</a></dd>
              <dd><a href="/application.listShow.do">产品展示</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">发布信息</a>
            <dl class="layui-nav-child">
              <dd><a href="/publishInformation.index.do">发布信息</a></dd>
              <dd><a href="/mangerelease.index.do">管理发布</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item"><a href="/userCollection.listIndex.do">我的收藏</a></li>
          <li class="layui-nav-item"><a href="/browsingHistory.listIndex.do">浏览历史</a></li>
        </ul>
      </div>
            <!-- 右侧 -->
            <div class="right r">
                <div class="t_right">
                    <form class="layui-form" action="">
                        <div class="layui-form-item clearfix">
                            <div class="title l">填写开票信息</div>
                            <button class="r editer">修改</button>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">发票抬头</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="北京中汇恒升互联网信息服务有限公司" class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">发票类型</label>
                            <input type="radio" name="name" value="" title="企业增值税普通发票">
                            <input type="radio" name="name" value="" title="增值税专用发票" checked>
                        </div>
                        <div class="layui-form-item">
                          <div class="clearfix">
                            <label class="layui-form-label l">税务登记证号</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请填写15位或20位纳税人识别号" class="layui-input l">
                            <span class="l">
                                <i class="layui-badge-dot"></i>
                                请与贵公司财务人员核实后，仔细填写准确的三证合一后的社会统一信用代码或税务登记证号，否则将影响后续发票的正常使用</span>
                          </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开户行名称</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请填写您许可证上的开户银行" class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开户行账号</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请填写您许可证上的开户行账号" class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">注册场所地址</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请填写您营业执照上的开户地址" class="layui-input">
                        </div>
                       <div class="layui-form-item">
                            <label class="layui-form-label">注册固定电话</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请填写您公司有效的联系方式" class="layui-input">
                        </div>
                        <!-- 保存上传 -->
                        <div class="layui-form-item">
                          <div class="layui-input-block">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">完成修改</button>
                          </div>
                        </div>  
                    </form>
                </div>
            </div>
        </div>
    </div>
    
     <!-- 底部 -->
   <%@ include file="../common/footer.jsp"%>
   
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script>
        
        //入口函数
    $(function(){
    	/* 去除input记忆 */
        $("input").attr({"autocomplete":"off"});
    	
        // 手风琴导航
        $('.parentWrap>.menuGroup:nth-child(1)>.groupTitle').css({
          "background-color":"#e8f5fc",
          "color":"#ba3f44",
          "border-left":"4px solid #ba3f44"
        });
        $('.parentWrap>.menuGroup>.groupTitle').click(function () {
            $(this).css({
                "background-color":"#e8f5fc",
                "color":"#ba3f44",
                "border-left":"4px solid #ba3f44"
            });
            $(this).siblings().slideDown();
            $(this).parent().siblings().children('div').slideUp();
            $(this).parent().siblings().children('span').css({
                "background-color":"",
                "color":"",
                "border-left": ""
            });
        });
        // 下拉菜单部分
        // 1.鼠标进入一级菜单后，显示二级菜单
        $('.top .personal .detail div:nth-child(3)').mouseover(function(){
            $(this).siblings('ul').show();
        });
        // 2.鼠标离开一级菜单后，隐藏二级菜单
        $('.top .personal .detail div:nth-child(3)').mouseout(function(){
            $(this).next().hide();
        });
        // 3.鼠标进入二级菜单，显示二级菜单
        $('.detail>.ul').mouseover(function(){
            $(this).show();
        });
        // 4.鼠标离开二级菜单，隐藏二级菜单
        $('.detail>.ul').mouseout(function(){
            $(this).hide();
        });
      });
    </script>
</body>
</html>