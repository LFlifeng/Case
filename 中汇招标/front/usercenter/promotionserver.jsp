<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心----推广服务</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-promotionserver.css">
</head>
<style>
	.groupTitle{
	    background-color: rgb(232, 245, 252);
	    color: rgb(186, 63, 68);
	    border-left: 4px solid rgb(186, 63, 68);
	}
</style>
<body>
 <div class="top">
	 <div class="header w clearfix">
	  <!-- logo区域 -->
	  <div class="logo l">
	    <a href="/main.index.do">
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
        <!-- 手风琴效果 -->
              <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
		          <li class="layui-nav-item"><a href="/userQd.promotionserver.do">推广服务</a></li>
                </ul>
          </li>
        </ul>
      </div>
      <!-- 右侧 -->
      <div class="right r">
        <div class="t_right">
          <div class="t_top">
            <h3>推广服务</h3>
          </div>
          <span>一、首页广告位</span>
          <div class="clearfix">
            <div class="l"><img src="${skin}front/img/pcad.jpg" alt=""></div>
            <div class="r">
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>编号</th>
                      <th>广告形式</th>
                      <th>尺寸规格</th>
                      <th>价格</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>A1</td>
                      <td>图片广告</td>
                      <td>666*210px</td>
                      <td>3000元/月</td>
                    </tr>
                    <tr>
                      <td>A2</td>
                      <td>图片广告</td>
                      <td>100*1200px</td>
                      <td>2500元/月</td>
                    </tr>
                    <tr>
                      <td>A3</td>
                      <td>图片广告</td>
                      <td>100*1200px</td>
                      <td>2500元/月</td>
                    </tr>
                    <tr>
                      <td>A4</td>
                      <td>图片广告</td>
                      <td>100*1200px</td>
                      <td>2000元/月</td>
                    </tr>
                    <tr>
                      <td>A5</td>
                      <td>图片广告</td>
                      <td>100*1200px</td>
                      <td>2000元/月</td>
                    </tr>
                    <tr>
                      <td>A6</td>
                      <td>图片广告</td>
                      <td>330*300px</td>
                      <td>1000元/月</td>
                    </tr>
                    <tr>
                      <td>A7</td>
                      <td>图片广告</td>
                      <td>330*160px</td>
                      <td>1000元/月</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <span>二、频道页广告位</span>
          <div class="clearfix">
            <div class="l"><img src="${skin}front/img/pcad2.jpg" alt=""></div>
            <div class="r">
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>编号</th>
                      <th>广告形式</th>
                      <th>尺寸规格</th>
                      <th>价格</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>B1</td>
                      <td>图片广告</td>
                      <td>300*240px</td>
                      <td>1500元/月</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <span>三、频道页广告位</span>
          <div class="clearfix">
            <div class="l"><img src="${skin}front/img/pcad3.jpg" alt=""></div>
            <div class="r">
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>编号</th>
                      <th>广告形式</th>
                      <th>尺寸规格</th>
                      <th>价格</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>C1</td>
                      <td>图片广告</td>
                      <td>300*180px</td>
                      <td>1000元/月</td>
                    </tr>
                    <tr>
                      <td>C2</td>
                      <td>图片广告</td>
                      <td>300*180px</td>
                      <td>1000元/月</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
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

    //入口函数
    $(function ()
   {
      // 手风琴导航
      $('.parentWrap>.menuGroup>.groupTitle').click(function () {
        $(this).css({
          "background-color": "#e8f5fc",
          "color": "#ba3f44",
          "border-left": "4px solid #ba3f44"
        });
        $(this).siblings().show();
        $(this).parent().siblings().children('div').hide();
        $(this).parent().siblings().children('span').css({
          "background-color": "",
          "color": "",
          "border-left": ""
        });
      });
    });
  </script>
</body>

</html>
</html>