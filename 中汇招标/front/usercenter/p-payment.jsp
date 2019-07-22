<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----付费指导</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-payment.css">
    <style>
    </style>
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
                <!-- 手风琴效果 -->
                <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
		          <li class="layui-nav-item"><a href="/userQd.memberserver.do">服务标准</a></li>
		          <li class="layui-nav-item"><a href="/userQd.serviceStandards.do">会员服务</a></li>
		          <li class="layui-nav-item"><a href="/userQd.paymentInstruction.do">付费指导</a></li>
                </ul>
            </div>
            <!-- 右侧 -->
            <div class="right r" style="height:750px">
                <div class="t_right">
                    <div class="title">付费指导</div>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">对公账号:</label>
                            <input type="text" name="tel" lay-verify="tel" autocomplete="off" value="${systemInfo.corporateNumber}"
                                class="layui-input" readonly>
                                <span onclick="copy(this)" style="cursor:pointer;display:none;color:#588def">复制</span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">账户名称:</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                value="${systemInfo.accountName }" class="layui-input" readonly>
                                <span onclick="copy(this)"style="cursor:pointer;display:none;color:#588def">复制</span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">银行账户:</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                value="${systemInfo.bankNumber }" class="layui-input" readonly>
                                <span onclick="copy(this)"style="cursor:pointer;display:none;color:#588def">复制</span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开户银行:</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                value="${systemInfo.openBank }" class="layui-input" readonly>
                                <span onclick="copy(this)"style="cursor:pointer;display:none;color:#588def">复制</span>
                        </div>
                    </form>
<%--                     <div class="title">支付方式</div>
                    <div class="pay clearfix">
                        <div class="wechat l">
                            <div><img src="${skin}front/img/wechat.jpg" alt=""></div>
                            <div><img src="${systemInfo.wechatPayUrl}" alt=""></div>
                            <div>打开微信——扫码支付——输入金额</div>
                        </div>
                        <div class="wechat l">
                            <div><img src="${skin}front/img/zhifubao.jpg" alt=""></div>
                            <div><img src="${systemInfo.useAlipayToPayUrl}" alt=""></div>
                            <div>打开支付宝——扫码支付——输入金额</div>
                        </div>
                    </div>
 --%>                    <div class="title">客服电话</div>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">客服电话:</label>
                            <input type="text" name="tel" lay-verify="tel" autocomplete="off" value="${systemInfo.servicePhone }"
                                class="layui-input" readonly>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱地址:</label>
                            <input type="text" name="email" lay-verify="email" autocomplete="off"
                                value="${systemInfo.eMaiAddress}" class="layui-input" readonly>
                        </div>
                    </form>
                    <div class="title">特别提示</div>
                    <div class="word">
                        <p>1、通过线下转账请您务必完整填写我公司名称、开户行和账户等信息，请不要随意删减信息内容，以免造成退汇、错汇而耽误您的信息服务。</p>
                        <p>2、完成会员服务费支付，若需提供发票，请您通过客服专员或网站平台申请发票，我们将需要提供发票抬头等信息用于发票开具。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

     	<!-- 底部 -->
   	<%@ include file="../common/footer.jsp"%>

    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script>

        //入口函数
        $(function () {
            // 引入公共底部
         /*    $('.footer').load('../../slide/footer.html');
            $('.top').load('./p-top.html'); */
            // 手风琴导航
            $('.parentWrap>.menuGroup:nth-child(3)>.groupTitle').css({
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
                $(this).siblings().show();
                $(this).parent().siblings().children('div').hide();
                $(this).parent().siblings().children('span').css({
                    "background-color": "",
                    "color": "",
                    "border-left": ""
                });
            });
        });
        $(".t_right form:nth-child(2) .layui-form-item").hover(function(){
        	$(this).children("span").show();
        },function(){
        	$(this).children("span").hide();
        })
        
        function copy(that){
			var inp =document.createElement('input'); // create input标签
				document.body.appendChild(inp) // 添加到body中
				inp.value =$(that).prev().val() // 给input设置value属性为需要copy的内容
				inp.select(); // 选中
				document.execCommand('copy',false); // copy已经选中的内容
				inp.remove(); // 删除掉这个dom
			}
    </script>
</body>

</html>