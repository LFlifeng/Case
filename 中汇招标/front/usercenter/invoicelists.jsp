<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----发票列表</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-invoicelists.css">
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
                    <div class="t_top clearfix">
                        <h3 class="l">发票列表</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  <th>序号</th>
                                  <th>订单编号</th>
                                  <th>申请时间</th>
                                  <th>产品名称</th>
                                  <th>发票总额</th>
                                  <th>发票状态</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>SQ2019012621</td>
                                  <td>2019-11-21 12:00</td>
                                  <td>开通会员</td>
                                  <td>￥5880</td>
                                  <td>
                                    <p>申请</p>
                                    <p style="display:none;">已完成</p>
                                    <p style="display:none;">申请中</p>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>SQ2019012621</td>
                                  <td>2019-11-21 12:00</td>
                                  <td>会员续费</td>
                                  <td>￥5880</td>
                                  <td>
                                    <p style="display:none;">申请</p>
                                    <p>已完成</p>
                                    <p style="display:none;">申请中</p>
                                  </td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>SQ2019012621</td>
                                  <td>2019-11-21 12:00</td>
                                  <td>会员续费</td>
                                  <td>￥5880</td>
                                  <td>
                                    <p style="display:none;">申请</p>
                                    <p style="display:none;">已完成</p>
                                    <p>申请中</p>
                                  </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
    $(function()
    {
      
        // 手风琴导航
        $('.parentWrap>.menuGroup:nth-child(2)>.groupTitle').css({
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