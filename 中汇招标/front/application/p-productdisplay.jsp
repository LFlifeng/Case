<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心----产品展示</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
  <link rel="shortcut icon" href="${skin}front/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-productdisplay.css">
</head>
<style type="text/css">

  .build{
    background-color: #ba3f44;
    border: none;
    width: 100px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    color: #fff;
    border-radius: 5px;
  }
  .build:hover{
    cursor: pointer;
  }

[v-cloak] {
    display: none;
}
</style>

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
              <a href="/userQd.center.do">账号信息</a>
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
            <div class="business company">
              <div class="t_top clearfix">
                <h3 class="l">产品展示</h3>
                <div class="l">(每个产品最多上传3张图片，单张大小5MB以内)</div>
                <span onclick="buildCpzs();"class="r build">+新建产品</span>
              </div>
              <div class="table-responsive" id='cpzs' v-cloak>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>产品名称</th>
                      <th>产品描述</th>
                      <th>添加图片</th>
                      <th>修改</th>
                    </tr>
                    <tr class="t_t" v-for="(product,index) in productList">
                        <td>{{index+1}}</td>
                        <td><span>{{product.productName}}</span></td>
                        <td><span>{{product.productDescribe}}</span></td>
                        <td><img style="width: 35px;height: 35px;" v-bind:src='product.pictureUrl'></td>
                        <td>
                         <!--  <button type="button" class="btn btn-sm btn-success" @click="updateItem(product.productName,product.id,product.productDescribe,product.picture,product.pictureUrl)">编辑</button> -->
                          <button type="button" class="btn btn-sm btn-danger" @click="delItem(product.id)">删除</button>
                        </td>
                   </tr>
                  </thead>
                  <tbody>
                </table>
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
  <script src="${skin}front/js/common.js"></script>
  <script>
    function loadLists()
    {
      $.ajax({
             url: '/product.listshow.do',
             type: 'post'
         }).then(function (data)
        {
         data = JSON.parse(data);
         cpzs.productList = data.rows;
         }).fail(function () {});
    }


/*vue渲染经济情况*/
    var cpzs = new Vue({
    el : "#cpzs",
    data : {
      productList : []
    },
    methods:
    {
      delItem:function(index){
                layer.confirm('您是否确定删除？', {
                    btn: ['是','否'] //按钮
                  }, function(){
                    var param = {
                            id : index
                        };
                        $.ajax({
                        type: 'POST',
                        url: '/product.deletelist.do',
                        data: param,
                        success: function (data)
                        {
                          if(data=="succ")
                          {
                            layer.alert('删除成功');
                            loadLists(); 
                          }
                          else
                          {
                            layer.alert('删除失败');
                          }
                          
                        }
    
                    });
                   
                  }, function(){
                    
                  });
              },
     updateItem:function(index,name,des,picture,url){
                   localStorage.arr=[index,name,des,picture,url];
                   layui.use('layer', function () 
                  {
                   var layer = layui.layer;
                   layer.open({
                     title: ['编辑'],
                     type: 2,
                     content: "product.buildCpzs.do",
                     offset: 'auto',
                     area: ['570px', '390px'],
                     shadeClose: true, //开启遮罩关闭
                     end: function () 
                     {
                       localStorage.setItem("isUpdate",false);
                       if(localStorage.getItem("buildCpzsSucc"))
                       {
                         localStorage.removeItem("buildCpzsSucc");
                           loadLists();
                         } 
                       },success:function(){
                           layer.setTop(index);
                       }
                     });
                 });
              }


    }
  });

     function buildCpzs(){
    layui.use('layer', function () 
            {
                   var layer = layui.layer;
                   layer.open({
                     title: ['添加'],
                     type: 2,
                     content: "product.buildCpzs.do",
                     offset: 'auto',
                     area: ['570px', '390px'],
                     shadeClose: true, //开启遮罩关闭
                     end: function () 
                     {
       
                       if(localStorage.getItem("buildCpzsSucc"))
                       {
                         localStorage.removeItem("buildCpzsSucc");
                         loadLists();
                       } 
                     },
                   });
               });
  }
 



    //入口函数
    $(function () {
      loadLists();
      // 引入公共底部
      $('.footer').load('../../slide/footer.html');
      $('.top').load('./p-top.html');
      // 手风琴导航
      $('.parentWrap>.menuGroup:nth-child(2)>.groupTitle').css({
        "background-color": "#e8f5fc",
        "color": "#ba3f44",
        "border-left": "4px solid #ba3f44"
      });
      $('.parentWrap>.menuGroup>.groupTitle').click(function () {
        $(this).css({
          "background-color": "#e8f5fc",
          "color": "#ba3f44",
          "border-left": "4px solid #ba3f44"
        });
        $(this).siblings().slideDown();
        $(this).parent().siblings().children('div').slideUp();
        $(this).parent().siblings().children('span').css({
          "background-color": "",
          "color": "",
          "border-left": ""
        });
      });
      // 上传附件
      layui.use('upload', function () {
        var $ = layui.jquery, upload = layui.upload;
        //设定文件大小限制
        upload.render({
          elem: '#test7'
          , url: '/upload/'
          , size: 5120 //限制文件大小，单位 KB
          , done: function (res) {
          }
        });
      });
    });

  </script>
</body>

</html>