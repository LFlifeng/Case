<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title id="titlie">中汇招标登录页面</title>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css" href="${skin}front/css/login.css">
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<style>
/* 报错提示字体颜色 */
.tscolor {
	color: red;
	display: block;
    height: 20px;
}

.login_logo img:hover {
	cursor: pointer;
}
</style>
</head>
<script type="text/javascript">
	var cookies = document.cookie.split(';');
	function login() {
		tsclear();
		var remember = $('#remember').prop('checked');
		var phone = $(".user_phone").val();
		var password = $(".user_psd").val();
		var unionId = '${openId}';
		if (!/^1[3|4|5|7|8][0-9]\d{8,11}$/.test(phone)) {
			if (null == phone || "" == phone) {
				$("#tishi").html("请您输入手机号")
				return;
			} else {
				$("#tishi").html("请您正确的手机号")
				return;
			}
		}
		if (password.length < 6) {
			if (null == password || "" == password) {
				$("#tishi").html('请您输入密码');
				return;
			} else {
				$("#tishi").html('用户名或密码错误,请您重新输入');
				return;
			}

		}
		$.ajax({
			url : '/userQd.doLogin.do',
			type : 'POST',
			data : {
				remember : remember,
				phone : phone,
				password : password,
				unionid : unionId
			},
			error : function() {
				tishi('系统错误，请稍后重试');
			},
			success : function(res) {
				if ('succ' == res) {
					window.location.href = "/main.index.do";
				} else {
					tishi(res);
				}
			}
		});

	}

	//点击登录错误提示功能
	function tishi(a) {
		$("#tishi").html(a);
	}
	//清空提示信息
	function tsclear() {
		$("#zh").html("");
		$("#pwd").html("");
		$("#tishi").html("");
	}
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$(".submit").trigger("click");
		}
	});
	//查看cookie用户密码信息自动填写
	window.onload = function() {
		var array = document.cookie.split("=");
		var phone = null;
		var password = null;
		if (document.cookie) {
			cookie = JSON.parse(JSON.parse(array[1]));
			$(".user_phone").val(cookie.phone);
			$(".user_psd").val(cookie.key);
		}
	}
	function loginLogo() {
		window.location.href = "/main.index.do";
	}

	/*  去除input框记忆 */
	$(function() {
		$("input").attr({
			"autocomplete" : "off"
		});
		var  openId = '${sessionScope.openId}';
		var unionId = '${sessionScope.unionId}';
		if(openId){
			$("#titile").text("中汇招标绑定账号页面");
    		$("#titile_one").text("绑定账号");
    		$("#btn").val("绑定");
		}
	})
</script>
<body>
	<div class="login_top">
		<div class="login_logo">
			<img onclick="loginLogo();" src="${skin}front/img/logo.png" alt="">
		</div>
	</div>
	<div class="login_content clearfix">
		<div class="w">
			<div class="login_content">
				<div class="login_center r">
					<div class="login_login">
						<h2 id="titile_one">用户登录</h2>
						<input class="user_phone" type="text" placeholder="请输入手机号"
							value='${registerPhone}'  name="phone" autocomplete="off"/> <input class="user_psd" type="password"
							placeholder="请输入密码" name="psd" />
						<div class="check">
							<input class="fl" type="checkbox" id='remember' autocomplete="off"/><span>记住密码</span>

							<span class="fr"><a href="/userQd.foundpwd.do">忘记密码？</a></span>

						</div>
						<span id='tishi' class='tscolor'></span> <input id="btn"
							class="login_btn submit" type="button" value="登录"
							onclick="login();" />
						<div class="wechat">
							<p>
								<span></span> <i>第三方登录</i> <span></span>
							</p>
							<a class="img"  href="/wx.login.do"> <img src="${skin}front/img/weixin.png"  alt="">
								
							</a>
						</div>
						<div id="reg" class='reg'>
							<a href="/userQd.register.do">没有账号?立即注册</a>
						</div>
					</div>
				</div>
				<div class="content r">
					<div class="title clearfix">
						<h1 class="l">及时</h1>
						<h1 class="l">高效</h1>
						<h1 class="l">服务</h1>
					</div>
					<div class="text clearfix">
						<p class="l">
						<span><i>◆</i>海量信息数据库</span>
						<span><i>◆</i>订阅后及时推送信息</span>
						<span><i>◆</i>微信公众号、pc、邮件三端展示</span>
						<span><i>◆</i>免费发布招标信息</span>
					</p>
					<p class="l">
						<span><i>◆</i>近千家供应商、采购商库</span>
						<span><i>◆</i>随时随地&nbsp;私人定制查询</span>
						<span><i>◆</i>一对一资深客服对接</span>
						<span><i>◆</i>智能检测企业招标动态</span>
					</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>
