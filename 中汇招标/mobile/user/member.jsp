<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>中汇招标----会员管理</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="favicon.ico" type="${skin}mobile/favicon.ico">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/mui/css/mui.picker.css">
    <link rel="stylesheet" href="${skin}mobile/res/mui/css/mui.poppicker.css">
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/member.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar mui-bar mui-bar-nav ">
            <a href="m.profile.do" class="l"><img src="${skin}mobile/img/back.png" alt=""></a>
            <span>会员管理</span>
        </header>
        <div class="zh_container">
            <div class="mui-scroll-wrapper">
                <div class="mui-scroll">
                    <div class="zh_content">
                        <div class="m_member">
                            <div class="m_title">会员等级</div>
                            <div id="wrapper">
                                <div class="m_content clearfix" onclick="loaded()">
                                    <div class="img l active">
                                        <img productType='1' src="${skin}mobile/img/user1.png" alt="">
                                    </div>
                                    <div class="img l">
                                        <img productType='2' src="${skin}mobile/img/user2.png" alt="">
                                    </div>
                                    <div class="img l">
                                        <img productType='3' src="${skin}mobile/img/user3.png" alt="">
                                    </div>
                                    <div class="img l">
                                        <img productType='4' src="${skin}mobile/img/user4.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pay">
                            <div id="erweima" class="b_pay">点击购买</div>
                            <div class="o_pay">其他付费途径</div>
                        </div>
                        <!-- 七大权益 -->
                        <div class="rights clearfix">
                            <div class="r_title">入驻会员享受7大权益</div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity1.png" alt="">
                                <div>专属客服</div>
                            </div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity2.png" alt="">
                                <div>私人订制</div>
                            </div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity3.png" alt="">
                                <div>精选项目</div>
                            </div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity4.png" alt="">
                                <div>VIP精选</div>
                            </div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity5.png" alt="">
                                <div>项目专盯</div>
                            </div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity6.png" alt="">
                                <div>供应商认证</div>
                            </div>
                            <div class="right l">
                                <img src="${skin}mobile/img/equity7.png" alt="">
                                <div>续费提醒</div>
                            </div>
                        </div>
                        <div class="o_payWay">
                            <div class="clearfix">
                                <div class="o_payTitle l">其他付费途径：银行转账</div>
                                <div class="fanhui r">返回</div>
                            </div>
                            <form class="layui-form" action="">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">对公账号:</label>
                                    <input type="text" name="tel" lay-verify="tel" autocomplete="off" placeholder="${systemInfo.corporateNumber}"
                                        class="layui-input" readonly>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">账户名称:</label>
                                    <input type="text" name="title" lay-verify="title" autocomplete="off"
                                        placeholder="${systemInfo.accountName }"  class="layui-input" readonly>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">银行账户:</label>
                                    <input type="text" name="title" lay-verify="title" autocomplete="off"
                                        placeholder="${systemInfo.bankNumber }" class="layui-input" readonly>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">开户银行:</label>
                                    <input type="text" name="title" lay-verify="title" autocomplete="off"
                                        placeholder="${systemInfo.openBank }" class="layui-input" readonly>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
        <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
        <script src="${skin}mobile/js/wechat.js">
        <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js" charset="utf-8"></script>
        <script src="${skin}mobile/js/iscroll.js"></script>
        <!-- <script src="js/common.js"></script> -->
        <script type="text/javascript">
            $('.m_content .img').on('tap', function () {
                $(this).addClass('active').siblings().removeClass('active');
            })
            $('.o_pay').on('tap',function(){
                $('.o_payWay').show();
                $('.rights').hide();
            })
            $('.fanhui').on('tap',function(){
                $('.o_payWay').hide();
                $('.rights').show();
            })
            //横向滑动
            var myScroll;
            function loaded() {
                myScroll = new IScroll("#wrapper", {
                    eventPassthrough: true,
                    freeScroll: true,
                    hScrollbar: true,
                    scrollX: true,//横向滚动
                    scrollY: false,
                    vScroll: false,//为true时允许y轴滚动
                });
                // myScroll.scrollToElement('.active',true,true);//特定元素居中
            }
            window.addEventListener("load", loaded, false);
            mui.init(
                {
                    pullRefresh: {
                        container: ".mui-scroll-wrapper",//下拉刷新、上拉加载容器标识
                        // 上拉加载
                        up: {
                            contentrefresh: '正在加载...',
                            callback: function () {
                                mui('.mui-scroll-wrapper').pullRefresh().disablePullupToRefresh();
                            }
                        }
                    }
                }
            )
            /*点击购买生成二维码付款*/
            $("#erweima").on("tap",function()
         	{
            	/* payType 支付类型   1支付宝  2微信 */
             	var payType="2";  
             	/* productType 会员类型 1普通会员  2高级会员 3vip 4砖石 */
            	var productType=$(".m_content").find(".active").children("img").attr("productType");
            	$.post("payMobile.pay.do",{productType:productType,openId:"${openId}"},function(res){
            		  if(res != "fail"){
            			  res=JSON.parse(res);
            			  WeixinJSBridge.invoke(
                     		      'getBrandWCPayRequest', {
                     		         "appId":res.appID,     //公众号名称，由商户传入     
                     		         "timeStamp":res.timeStamp,         //时间戳，自1970年以来的秒数     
                     		         "nonceStr":res.nonceStr,     //随机串     
                     		         "package":res.packages,     
                     		         "signType":res.signType,         //微信签名方式：     
                     		         "paySign":res.paySign //微信签名 
                     		      },
                     		      function(res){
                     		      if(res.err_msg == "get_brand_wcpay_request:ok" )
                     		      {
                     		      
                     		    	 window.location.href="/orderQd.ali.do";
                     		      } 
                     		   }); 
            		  }
            		})
         		}) 
             		if (typeof WeixinJSBridge == "undefined"){
             		   if( document.addEventListener ){
             		       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
             		   }else if (document.attachEvent){
             		       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
             		       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
             		   }
             		}else{
             		   onBridgeReady();
             		}
        </script>
        
        
        
</body>

</html>