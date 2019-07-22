<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>个人中心----账号信息</title>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${skin}front/css/base.css">
<link rel="stylesheet" href="${skin}front/css/footer.css">
<link rel="stylesheet" href="${skin}front/css/personal.css">
<link rel="stylesheet" href="${skin}front/css/p-accountinformation.css">
</head>

<body>
	<!-- 顶部 -->
	<div class="top">
		<div class="header w clearfix">
			<!-- logo区域 -->
			<div class="logo l">
				<a href="/main.index.do" style="display: inline-block;"> <img
					src="${skin}front/img/logo.png" alt=""></a>
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
						<a href="/systemQd.systeminformation.do"><img
							src="${skin}front/img/icon-email.jpg" alt=""></a>
					</div>
					<div class="l">
						<a href="/systemQd.paymentInstruction.do"><img
							src="${skin}front/img/icon-rang.jpg" alt=""></a>
					</div>
					<div class="l">
						<img src="${user.portraitUrl}" alt=""> <span>${user.showName}</span>
						<i class="fa fa-angle-down"></i>
					</div>
					<ul class="ul">
						<li><a href="/userQd.accountInformationIndex.do">账号信息</a></li>
						<li><a href="/userQd.changePwdIndex.do">安全设置</a></li>
						<li><a href="/userQd.logout.do">退出登录</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	</div>
	<!-- 主体部分 -->
	<div class="main">
		<div class="middle w clearfix">
			<!-- 左侧 -->
			<div class="left l">
			<!-- 	<!-- 手风琴效果 -->
				<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
		          <li class="layui-nav-item"><a href="/userQd.accountInformationIndex.do">账号信息</a></li>
		          <li class="layui-nav-item">
		            <a href="javascript:;">安全设置</a>
		            <dl class="layui-nav-child">
		              <dd><a href="/userQd.changePwdIndex.do">密码修改</a></dd>
		              <dd><a href="/userQd.changePhoneIndex.do">更改手机</a></dd>
		              <dd><a href="/userQd.bindEmailIndex.do">绑定邮箱</a></dd>
		            </dl>
		          </li>
        		</ul>
			</div>
			<!-- 右侧 -->
			<div class="right r">
				<div class="t_right">
					<form class="layui-form" action="" id="accountInformation">
						<div class="layui-form-item">
							<div class="title">账号信息</div>
						</div>
						<div class="layui-form-item">
							<div class="photo">
								<img src="${user.portraitUrl}" alt="" id="portrait">
								<button type="button" class="layui-btn" id="channePortrait">修改头像</button>
								<input type="hidden" id="portraitSrc"
									lay-verify="required|portrait" name="portrait"
									value="${user.portrait}"> <input type="hidden"
									id="portraitUrl" lay-verify="required" name="portraitUrl"
									value="${user.portraitUrl}">
							</div>
						</div>
						<div class="layui-form-item">
							<div>
								<label class="layui-form-label">用户名：</label> <input type="text"
									name="name" lay-verify="title" autocomplete="off"
									value="${user.showName}" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-form-item">
							<div>
								<label class="layui-form-label">昵称：</label> <input type="text"
									name="nickName" lay-verify="text|required|nickName"
									autocomplete="off" value="${user.nickname}" class="layui-input">
								<!-- 								<p id="repeat" style="display: none;">
									<span class="layui-badge-dot layui-bg-orange"></span> <span>已和其他用户同名请更换昵称</span>
								</p> -->
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">生日：</label>
							<c:if test="${ user.birthday.length() > 0}">
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="year" name="year"
										value="${user.birthday.substring(0,4)}"  readonly
										lay-verif="required|year">
								</div>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="month" name="month"
										value="${user.birthday.substring(5,7)}" readonly
										lay-verif="required|month">
								</div>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="date" name="date"
										value="${user.birthday.substring(8,10)}" readonly
										lay-verif="required|date">
								</div>
							</c:if>
							<c:if test="${ user.birthday.length() == 0}">
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="year" name="year" readonly
										value="" lay-verif="required|year"> 
								</div>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="month" name="month" readonly
										value="" lay-verif="required|month">
								</div>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="date" name="date" readonly
										value="" lay-verif="required|date">
								</div>
							</c:if>


						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">性别：</label>
							<div class="layui-input-block">
								<input type="radio" name="sex" value="0" title="男"> <input
									type="radio" name="sex" value="1" title="女">
							</div>
						</div>
						<!-- 保存上传 -->
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn layui-btn-normal" lay-submit
									lay-filter="formDemo">完成修改</button>
							</div>
						</div>
					</form>
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

	<script type="text/javascript">
		$(function() {
			layui.use('form', function() {
				var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
				var user = '${user}';
				if (user == null) {
					return false;
				}
				var sex = '${user.sex}';

				if (sex) {
					if (sex == 1) {
						$("input[name=sex]:eq(1)").attr("checked", "");
					} else if (sex == 0) {
						$("input[name=sex]:eq(0)").attr("checked", "");
					}
				}
				form.render();
				//监听提交
				form.on('submit(formDemo)', function(data) {
					$.ajax({
						type : 'POST',
						url : '/userQd.updateAccountInformation.do',
						data : data.field,
						success : function(data) {
							if (data == "succ") {
								layer.msg('修改成功', {
									icon : 1,
									time : 1000, //1s后自动关闭
									shade : [ 0.8, '#393D49' ]
								// 透明度  颜色
								});
/*                      		$("#accountInformation")[0].reset();
								layui.form.render(); */
								//   location.reload(); 
							} else if (data == "fail") {
								layer.msg('修改失败', {
									icon : 2,
									time : 1000, //1s后自动关闭
									shade : [ 0.8, '#393D49' ]
								// 透明度  颜色
								});
/* 								$("#accountInformation")[0].reset();
								layui.form.render();
								location.reload(); */
							} else {
								layer.msg(data, {
									icon : 2,
									time : 1000, //1s后自动关闭
									shade : [ 0.8, '#393D49' ]
								// 透明度  颜色
								});
/* 								$("#accountInformation")[0].reset();
								layui.form.render();
								location.reload(); */
							}
						}
					});
					return false;
				});

				//自定义验证规则
				form.verify({
					portrait : function(value) {
						if (value.length > 100) {
							return '图片名称不能超过100';
						}
					},
					nickName : function(value) {
						if (value.length > 50) {
							return '昵称不能超过50';
						}
					},
					year : function(value) {
						if (value.length != 4) {
							return '请选择正确的年份';
						}
					},
					month : function(value) {
						if (value.length != 2) {
							return '请选择正确的月份';
						}
					},
					date : function(value) {
						if (value.length != 2) {
							return '请选择正确的日期';
						}
					}
				});

			});

			layui.use('laydate', function() {
				var laydate = layui.laydate;
				//年选择器
				laydate.render({
					elem : '#year',
					type : 'year'
				});
				//年月选择器
				laydate.render({
					elem : '#month',
					type : 'month',
					format : 'MM'
				});
				//日期时间选择器
				laydate.render({
					elem : '#date',
					type : 'date',
					format : 'dd'
				});

			});
		});

		/* 		function removeCss(){
		 $("#repeat").css("display","none");
		 } */
	</script>

	<script>
		//入口函数
		$(function() {
			// 手风琴导航
			$('.parentWrap>.menuGroup>.groupTitle').click(function() {
				$(this).css({
					"background-color" : "#e8f5fc",
					"color" : "#ba3f44",
					"border-left" : "4px solid #ba3f44"
				});
				$(this).siblings().slideDown();
		        $(this).parent().siblings().children('div').slideUp();
				$(this).parent().siblings().children('span').css({
					"background-color" : "",
					"color" : "",
					"border-left" : ""
				});
			});
			// 上传附件
			layui.use('upload', function() {
				var $ = layui.jquery, upload = layui.upload;
				//设定文件大小限制
				upload.render({
					elem : '#channePortrait',
					url : 'attach.uploadImage.do',
					file : 'images',
					before : function(obj) {
						obj.preview(function(index, file, result) {
							$("#portrait").attr('src', result);
						});
					},
					done : function(res) {
						if (res.code == '0') {
							layer.msg('上传成功', {
								icon : 1,
								shade : [ 0.8, '#393D49' ]
							// 透明度  颜色
							});
							var src = res.data.src;
							var url = res.data.url;
							$("#portraitSrc").val(src);
							$("#portraitUrl").val(url);

						} else if (res.code == '1') {
							layer.msg('上传失败', {
								icon : 2,
								shade : [ 0.8, '#393D49' ]
							// 透明度  颜色
							});
						}
					}
				});
			});
		});
	</script>
</body>

</html>