<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----服务标准</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-server.css">
    <style>
     .money{
    	margin-top:49px!important
      }
      .memberGrade span{
		    width: 70px;
		    height: 15px;
		    background: url('${skin}front/img/userlevelicon.png') 0px 15px no-repeat;
		    cursor: pointer;
		    margin-left: 3px;
		    display: inline-block;
		    top: 1px;
		    position: relative;
		    background-position: 0px -33px;   
      }
      .buy{
          margin-top: 20px;
      }
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
            <div class="right r">
                <div class="t_right clearfix">
                    <dl class="l">
                        <dt>基本信息</dt>
                        <dd>登陆账号：&nbsp; ${user.phone}</dd>
                        <dd>企业名称：&nbsp;${company.title}</dd>
                        <dd>企业类型：&nbsp;${company.companytype}</dd>
                    </dl>
                    <dl class="l">
                        <dt>服务信息</dt>
                        <dd class='memberGrade'>会员等级：&nbsp;<span></span></dd>
                        <dd>权限地区：&nbsp;全国</dd>
                    </dl>                 
                       <dl class="l">
	                        <dt>专属客服</dt>
	                        <dd>专属客服：&nbsp;<c:if test="${user.grade > 0}">${systemInfo.exclusiveService}</c:if></dd>
	                        <dd>联系方式：&nbsp;<c:if test="${user.grade > 0}">${systemInfo.contact}</c:if></dd>
	                        <dd>客服邮箱：&nbsp;<c:if test="${user.grade > 0}">${systemInfo.serviceMailbox}</c:if></dd>
                       </dl>
                </div>
            </div>
            <div class="right r">
                <div class="t_right">
                    <h3>会员服务</h3>
                    <div class="members clearfix">
                        <!-- 普通会员 -->
                        <div class="ordinary l">
                            <p>招标中心</p>
                            <ul>
                               <li>
                                    <a href="#">
                                        <img src="${skin}front/img/1user_zbxx.png" alt="">
                                        招标信息
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/2user_zbgz.png" alt="">
                                        招标追踪
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/3user_ydd.png" alt="">
                                        移动客户端
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/4user_yjdy.png" alt="">
                                        邮件订阅
                                    </a>
                                </li>
                            </ul>
                            <div class="money">
                                <span>￥</span>
                                <span>5800</span>
                                <span>元/年</span>
                            </div>
                            <%--  <div style="text-align:center;"><a onclick="payImg(2,1)" href="#"><img src="${skin}front/img/wechapay.png"></a><br><a href="/pay.index.do?payType=1&productType=1" target="_blank" style="margin-top:10px;display:block;"><img src="${skin}front/img/zhifubaopay.png"></a></div>
                        --%>    
                          <div class="buy"><a onclick="payImg(2,1)" href="#"><img src="${skin}front/img/wechat.png" alt=""> 微信支付</a></div>
                          <div class="buy"><a href="/pay.index.do?payType=1&productType=1" target="_blank"><img src="${skin}front/img/ali.png" alt=""> 支付宝支付</a></div>
                           <div>普通会员</div> 
                        </div>
                        <!-- 高级会员 -->
                        <div class="senior l">
                            <p>招标中心</p>
                            <ul>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/5user_jxxx.png" alt="">
                                        精选项目
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/6user_xmzz.png" alt="">
                                        项目追踪
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/7user_nzjxm.png" alt="">
                                        拟在建项目
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/8user_xmzd.png" alt="">
                                        项目专盯
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/9user_yxgys.png" alt="">
                                        优秀供应商认证
                                    </a>
                                </li>
                            </ul>
                            <div class="money" style="margin-top: 20px!important">
                                <span>￥</span>
                                <span>15800</span>
                                <span>元/年</span>
                            </div>
                             <div class="buy"><a href="/pay.index.do?payType=1&productType=2" target="_blank"><img src="${skin}front/img/ali.png" alt=""> 支付宝支付</a></div>
                             <div class="buy buy1" style="border:none;background-color: #ba3f44;"><a href="#" style="color:#fff"> 银行支付</a></div>
<%--                              <div style="text-align:center;"><a onclick="payImg(2,2)" href="#"><img src="${skin}front/img/wechapay.png"></a><br><a  href="/pay.index.do?payType=1&productType=2" target="_blank"   style="margin-top:10px;display:block;"><img src="${skin}front/img/zhifubaopay.png"></a></div>
 --%>                         <div>高级会员</div>
                        </div>
                        <!-- VIP会员 -->
                        <div class="vip l">
                            <p>招标中心</p>
                            <ul>
                                 <li>
                                    <a href="#">
                                        <img src="${skin}front/img/10user_vip.png" alt="">
                                        VIP独家项目
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/11user_yzwt.png" alt="">
                                        业主委托项目
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/12user_xyztj.png" alt="">
                                        向业主推荐
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/13user_yxxmsx.png" alt="">
                                        优秀项目筛选
                                    </a>
                                </li>
                            </ul>
                            <div class="money">
                                <span>￥</span>
                                <span>25800</span>
                                <span>元/年</span>
                            </div>
                            <%-- <div style="text-align:center;"><a onclick="payImg(2,3)" href="#"><img src="${skin}front/img/wechapay.png"></a><br><a href="/pay.index.do?payType=1&productType=3" target="_blank"    style="margin-top:10px;display:block;"><img src="${skin}front/img/zhifubaopay.png"></a></div>
                             --%>
                             <div class="buy buy1" style="border:none;background-color: #ba3f44;"><a href="#" style="color:#fff"> 银行支付</a></div>
                             <div>VIP会员</div>
                        </div>
                        <!-- 钻石会员 -->
                        <div class="diamond l">
                            <p>招标中心</p>
                            <ul>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/15user_xyzwytj.png" alt="">
                                        向业主唯一推荐
                                    </a>
                                    </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/14user_qyjz.png" alt="">
                                        企业建站
                                    </a>
                                    </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/16user_hybg.png" alt="">
                                        行业报告
                                    </a>
                                    </li>
                                <li>
                                    <a href="#">
                                        <img src="${skin}front/img/17user_jprz.png" alt="">
                                        金牌认证
                                    </a>
                                    </li>
                            </ul>
                            <div class="money">
                                <span>￥</span>
                                <span>35800</span>
                                <span>元/年</span>
                            </div>
<%--                              <div style="text-align:center;"><a onclick="payImg(2,4)" href="#"><img src="${skin}front/img/wechapay.png"></a><br><a href="/pay.index.do?payType=1&productType=4" target="_blank"    style="margin-top:10px;display:block;"><img src="${skin}front/img/zhifubaopay.png"></a></div>
 --%>
                             <div class="buy buy1" style="border:none;background-color: #ba3f44;"><a href="#" style="color:#fff"> 银行支付</a></div>
                             <div>钻石会员</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right r">
                <div class="Qrcode clearfix">
                    <img src="${skin}front/img/code.jpg" alt="">
                </div>
            </div>
        </div>
    </div>

     	<!-- 底部 -->
   	<%@ include file="../common/footer.jsp"%>

 
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js" charset="utf-8"></script>
    <script src="${skin}front/js/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script>
        //入口函数
        $(function () {
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
                $(this).siblings().show();
                $(this).parent().siblings().children('div').hide();
                $(this).parent().siblings().children('span').css({
                    "background-color": "",
                    "color": "",
                    "border-left": ""
                });
            });
        });
      	
    	/*判断用户信息级别样式替换为图片*/
    	var grade='${user.grade}';
			switch (grade) {
			case "0":
				$(".memberGrade span").css({"background":'none'}).html("普通用户");
				break;
			case "1":
				$(".memberGrade span").css({"background-position":'0 0px'})
				break;
			case "2":
				$(".memberGrade span").css({"background-position":'0 -17px'})
				break;
			case "3":
				$(".memberGrade span").css({"background-position":'0 -33px'})
				break;
			case "4":
				$(".memberGrade span").css({"background-position":'0 -51px'})
				break;
		}
			
	    function payImg(payType,productType)
	    {
	    
	    	layui.use('layer', function () {
	              var layer = layui.layer;
	              layer.open({
	                title: [''],
	                type: 2,
	                content: ["/pay.index.do?payType="+payType+"&productType="+productType],
	                offset: 'auto',
	                area: ['850px','650px'],
	                scrollbar: true,
	                iframeScrolling:true,
	                shadeClose: true, //开启遮罩关闭
	                end: function () 
	                {
	                	if(localStorage.getItem("paySuccessKey"))
	                	{
	                		localStorage.removeItem("paySuccessKey")
	                		window.location.href="/main.index.do";
	                	}
	                	
	                },
	              });
	            });
	    }
	    
	    
	    $('.buy1').on('click', function () {
            layer.open({
                type: 1,
                title: ['银行支付方式'],
                area: '1000px',
                shade: 0.2,
                id: 'layui',
                anim: 2,
                resize: false,
                content: `<div class="t_right">
                    <div class="title">付费指导</div>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">对公账号:</label>
                            <input type="text" name="tel" lay-verify="tel" autocomplete="off" placeholder="银行电汇汇款方式"
                                class="layui-input" readonly>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">账户名称:</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                placeholder="中汇恒升（北京）信息咨询有限公司" class="layui-input" readonly>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">银行账户:</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                placeholder="321030100101505944" class="layui-input" readonly>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开户银行:</label>
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                placeholder="兴业银行北京分行朝外支行" class="layui-input" readonly>
                        </div>
                    </form>
                    <div class="title">客服电话</div>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">客服电话:</label>
                            <input type="text" name="tel" lay-verify="tel" autocomplete="off" placeholder="010-57287075"
                                class="layui-input" readonly>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱地址:</label>
                            <input type="text" name="email" lay-verify="email" autocomplete="off"
                                placeholder="zhonghuizhaobiao@126.com" class="layui-input" readonly>
                        </div>
                    </form>
                    <div class="title">特别提示</div>
                    <div class="word">
                        <p>1、通过线下转账请您务必完整填写我公司名称、开户行和账户等信息，请不要随意删减信息内容，以免造成退汇、错汇而耽误您的信息服务。</p>
                        <p>2、完成会员服务费支付，若需提供发票，请您通过客服专员或网站平台申请发票，我们将需要提供发票抬头等信息用于发票开具。</p>
                    </div>
                </div>`,
            })
        })
	    
    </script>
</body>

</html>