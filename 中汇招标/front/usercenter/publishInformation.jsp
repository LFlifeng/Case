<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>个人中心----发布信息</title>
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
<link rel="stylesheet" href="${skin}front/css/p-publicInformation.css">

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
						<img src="${user.portraitUrl}" alt=""> <span>${user.showName}</span> <i class="fa fa-angle-down"></i>
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
					<form class="layui-form" id="publishForm">
						<div class="layui-form-item">
							<div class="title">发布信息</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">项目名称</label>
							<div class="layui-input-block">
								<input type="text" name="projectName" lay-verify="required|projectName" 
									autocomplete="off" placeholder="请输入项目名称" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item clearfix">
							<div class="l">
								<label class="layui-form-label">项目编码</label> <input type="text"
									name="projectCode" lay-verify="required|projectCode" autocomplete="off"
									placeholder="请输入项目编码" class="layui-input">
							</div>
							<div class="l">
								<label class="layui-form-label">项目类型</label>
								<div class="layui-input-inline" style="z-index: 100000001;">
									<select name="projectType" id="projectType"  lay-verify="required">
										<option value="">请选择</option>
										<c:forEach var="item" items="${categorys}" varStatus="status">
											<option value="${item.title}">${item.title}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">所在地区</label>
							<div class="layui-input-inline" style="z-index: 10000001;">
								<select name="province" id="province" lay-verify="required"
									lay-filter="provinceFilter">
									<option></option>
									<input name="province" id="province_id"  type="hidden" value="" />
								</select>
							</div>
							<div class="layui-input-inline" style="z-index: 10000001;">
								<select name="city" id="city" lay-verify="required"
									lay-filter="cityFilter">
									<option></option>
									<input name="city" id="city_id"  type="hidden" value="" />
								</select>
							</div>
							<div class="layui-input-inline" style="z-index: 10000001;">
								<select name="county" id="county" 
									lay-filter="countyFilter">
									<option></option>
									<input name="county" id="county_id"  type="hidden" value="" />
								</select>
							</div>
						</div>
						<!-- 所属行业 -->
						<div class="layui-form-item">
							<label class="layui-form-label">所属行业</label>
							<div class="layui-input-inline" style="z-index: 10000000;">
								<select lay-verify="required" id="industryOne"
									lay-filter="industryOneFilter">
									<!-- <option value="">${company.industryOne}</option> -->
									<option value=""></option>
									<input name="industryOne" id="industryOne_id"  type="hidden" value="" />
								</select>
							</div>
							<div class="layui-input-inline" style="z-index: 10000000;">
								<select  id="industryTwo" lay-verify="required"
									lay-filter="industryTwoFilter">
									<!-- <option value="">${company.industryTwo}</option> -->
									<option value=""></option>
									<input name="industryTwo" id="industryTwo_id"  type="hidden" value="" />
								</select>
							</div>
							<div class="layui-input-inline" style="z-index: 10000000;">
								<select  id="industryThree" lay-verify="required"
									lay-filter="industryThreeFilter">
									<!-- <option value="">${company.industryThree}</option> -->
									<option value=""></option>
									<input name="industryThree" id="industryThree_id" type="hidden" value="" />
								</select>
							</div>
						</div>
						<!-- 日期 -->
						<div class="layui-form-item">
							<label class="layui-form-label">投标截止</label>
							<div class="layui-input-inline">
								<input type="text" class="layui-input" id="test5" lay-verify="required"
									name="deadline" >
							</div>
						</div>
						<!-- 富文本编辑器 -->
						<div class="layui-form-item">
							<label for="" class="layui-form-label">发布内容</label>
						</div>
						<div class="layui-form-item">
							<div class=".layui-input-block">
								<div id="editor">
								</div>
								<div style="display: none;">
									<textarea id="content"  name="content" style="width:100%; height:200px;" lay-verify="required">
									</textarea>
								</div>
							
							</div>
						</div>
						<!-- 发布人 -->
						<div class="layui-form-item clearfix">
							<div class="l">
								<label class="layui-form-label">发布人</label> <input type="text"
									name="issuer" lay-verify="title" autocomplete="off"
									placeholder="请输入姓名" class="layui-input">
							</div>
							<div class="l">
								<label class="layui-form-label">发布人电话</label> <input type="tel"
									name="issuerPhone" lay-verify="required|phone"
									autocomplete="off" placeholder="请输入电话号码" class="layui-input">
							</div>
						</div>
						<!-- 上传附件 -->
						<div class="layui-form-item">
							<label class="layui-form-label">上传附件</label>
							<button type="button" class="layui-btn layui-btn-danger"
								id="test7">
								<i class="fa fa-paperclip"></i>上传附件
							</button>
							<div class="layui-inline layui-word-aux">这里以限制 2MB</div>
							<div class="layui-inline layui-word-aux" id="fileList"
								style="display: none;">
								<input id="fileName" type="hidden" name="uploadAttachment" value=""   style="width: 500px;"/>
								<span id="fileShow"></span>
								<button  type="button" class="layui-btn layui-btn-danger" onclick="removeDiv()">删除</button>
							</div>
						</div>
						<!-- 保存上传 -->
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn layui-btn-normal"  lay-submit lay-filter="formDemo">立即发布</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"
		charset="utf-8"></script>
	<script
		src="${skin}front/js/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js"></script>

	<script src="${skin}front/data/region.js"></script>


	<script type="text/javascript">
		//添加用户省市县信息
		var industryOne = '${company.industryOne}';
		var industryTwo = '${company.industryTwo}';
		var industryThree = '${company.industryThree}';
		var cityFlag = true;
		var proFlag = true;
		var province = '${company.province}';
		var city = '${company.city}';
		var county = '${company.county}';
		ThreeLianDong("sysCity.city.do", "0", "province", "city", "county",
				"item.regionName");

		ThreeLianDong("industry.getChildren.do", "0", "industryOne", "industryTwo", "industryThree",
				"item.title");

		addOption("sysCity.city.do", "0", "province", "item.regionName");
		addOption("industry.getChildren.do", "0", "industryOne", "item.title");

		function ThreeLianDong(url, param, name, name1, name2, name3) {
			layui.use([ 'form', 'upload', 'layer' ], function() {
				var form = layui.form;
				//      //获取选中后的省或市id
				form.on('select(' + name + 'Filter)', function(data) {
					//选中的赋值给ids
					ids = data.value;
					$('#' + name1 + ' option').nextAll().remove();
					$('#' + name2 + ' option').nextAll().remove();
		            var text = $(data.elem).find("option:selected").text();
		            if('item.regionName'==name3)
		            {
		            	$("#province_id").val(text);
		            }
		            else
		            {
		            	$("#industryOne_id").val(text);
		            }
		            
		            
		            addOption(url, ids, name1,name3);
		          })
		          form.on('select(' + name1 + 'Filter)', function (data)
	              {
		            ids = data.value;
		            $('#' + name2 + ' option').nextAll().remove();
		            addOption(url, ids , name2, name3);
		            var text = $(data.elem).find("option:selected").text();
		            if('item.regionName'==name3)
		            {
		            	$("#city_id").val(text);
		            }
		            else
		            {
		            	$("#industryTwo_id").val(text);
		            }
		            
		         })
		          form.on('select(' + name2 + 'Filter)', function (data)
	              {
		            var text = $(data.elem).find("option:selected").text();
		            if('item.regionName'==name3)
		            {
		            	$("#county_id").val(text);
		            }
		            else
		            {
		            	$("#industryThree_id").val(text);
		            }
		            
		         })
			})
		}

		//动态添加option并赋值
		function addOption(url, id, name, fenlei) {
			$.ajax({
				url : url,
				dataType : 'json',
				type : 'get',
				data : {
					id : id
				},
				success : function(data) {
					$.each(data, function(index, item) {
						if (fenlei == "item.title") {
							if (proFlag) {

								if ("industryOne" == name) {
									if (industryOne == '') {
										proFlag = false;
										$('#' + name).append(new Option(item.title, item.id));
									} else if (industryOne == item.title) {
										$('#' + name).append(
												new Option(item.title, item.id,
														true, true));
										addOption(url, item.id, "industryTwo", fenlei);
									} else {
										$('#' + name)
												.append(
														new Option(item.title,
																item.id));
									}
								} else if ("industryTwo" == name) {
									if (industryTwo == '') {
										proFlag = false;
										$('#' + name).append(new Option(item.title, item.id));
									} else if (industryTwo == item.title) {
										$('#' + name).append(
												new Option(item.title, item.id,
														true, true));
										addOption(url, item.id, "industryThree", fenlei);
									} else {
										$('#' + name)
												.append(
														new Option(item.title,
																item.id));
									}

								} else if ("industryThree" == name) {
									if (industryThree == '') {
										proFlag = false;
										$('#' + name).append(new Option(item.title, item.id));
									} else if (industryThree == item.title) {
										$('#' + name).append(
												new Option(item.title, item.id,
														true, true));
										proFlag = false;
									} else {
										$('#' + name)
												.append(
														new Option(item.title,
																item.id));
									}
								}
							} else {
								$('#' + name).append(
										new Option(item.title, item.id));
							}
						} else {

							if (cityFlag) {

								if ("province" == name) {
									if (province == '') {
										cityFlag = false;
										$('#' + name).append(new Option(item.regionName, item.id));
									} else if (province == item.regionName) {
										$('#' + name).append(
												new Option(item.regionName,
														item.id, true, true));
										addOption(url, item.id, "city", fenlei);
									} else {
										$('#' + name).append(
												new Option(item.regionName,
														item.id));
									}
								} else if ("city" == name) {
									if (city == '') {
										cityFlag = false;
										$('#' + name).append(new Option(item.regionName, item.id));
									} else if (city == item.regionName) {
										$('#' + name).append(
												new Option(item.regionName,
														item.id, true, true));
										addOption(url, item.id, "county", fenlei);
									} else {
										$('#' + name).append(
												new Option(item.regionName,
														item.id));
									}

								} else if ("county" == name) {
									if (county == '') {
										cityFlag = false;
										$('#' + name).append(new Option(item.regionName, item.id));
									} else if (county == item.regionName) {
										$('#' + name).append(
												new Option(item.regionName,
														item.id, true, true));
										cityFlag = false;
									} else {
										$('#' + name).append(
												new Option(item.regionName,
														item.id));
									}
								}
							} else {
								$('#' + name).append(
										new Option(item.regionName, item.id));
							}

						}
						layui.form.render("select")
					})
				}
			})
		}
	</script>

	<script>
		//移除附件div
		function removeDiv() {
			$("#fileName").text('');
			$("#fileName").val('');
			$("#fileShow").html('');
			$("#fileList").hide();
		}
	
		//入口函数
		$(function() {
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(formDemo)', function(data) {
	                	$.ajax({
	    			        type: 'POST',
	    			        url: '/biddinginfo.add.do',
	    			        data: data.field,
	    			        success: function (data)
	    			        {
	    			        	if(data == "succ"){
        			        		layer.msg('发布成功', {
                             		    icon: 1,
                             		   	time: 1000, //1s后自动关闭
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             		});
        	                        $("#publishForm")[0].reset();
        	                        layui.form.render();
        	                        editor.txt.html('<p><br></p>');
	    			        	}else if(data == "fail"){
        			        		layer.msg('发布失败', {
                             		    icon: 2,
                             		    time: 1000, //1s后自动关闭
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             		});
        	                        $("#publishForm")[0].reset();
        	                        layui.form.render();
        	                        editor.txt.html('<p><br></p>');
	    			        	}else{
        			        		layer.msg(data, {
                             		    icon: 2,
                             		    time: 1000, //1s后自动关闭
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             		});
        	                        $("#publishForm")[0].reset();
        	                        layui.form.render();
        	                        editor.txt.html('<p><br></p>');
	    			        	}
	    			        }
	    			    });
					return false;
				});
				
			      //自定义验证规则
			      form.verify({
			    	  projectName: function(value){
				          if(value.length > 100){
				            return '项目名称不能超过100';
				          }
			          },
			          projectCode: function(value){
				          if(value.length > 20){
				            return '项目编号不能超过20';
				          }
				      }
			    
				    });

			});
			
				
			$("#fileList").hide();
			// 富文本编辑器
			// $('#editor').wysiwyg();
			var E = window.wangEditor;
			var editor = new E('#editor');
			
		    editor.customConfig.onchange = function (html) {
		        // 监控变化，同步更新到 textarea
		         $('#content').val(html)
		    }
			// 或者 var editor = new E( document.getElementById('editor') )
			editor.create();
			$('#content').val(editor.txt.html())
			// editor.txt.html('<p>用 JS 设置的内容</p>');
			// 引入公共底部

			// 手风琴导航
			$('.parentWrap>.menuGroup:nth-child(3)>.groupTitle').css({
				"background-color" : "#e8f5fc",
				"color" : "#ba3f44",
				"border-left" : "4px solid #ba3f44"
			});
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
			// 下拉菜单部分
			// 1.鼠标进入一级菜单后，显示二级菜单
			$('.top .personal .detail div:nth-child(3)').mouseover(function() {
				$(this).siblings('ul').show();
			});
			// 2.鼠标离开一级菜单后，隐藏二级菜单
			$('.top .personal .detail div:nth-child(3)').mouseout(function() {
				$(this).next().hide();
			});
			// 3.鼠标进入二级菜单，显示二级菜单
			$('.detail>.ul').mouseover(function() {
				$(this).show();
			});
			// 4.鼠标离开二级菜单，隐藏二级菜单
			$('.detail>.ul').mouseout(function() {
				$(this).hide();
			});
			// 日期设置
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				//初始赋值
				laydate.render({
					elem : '#test5',
					type : 'date',
					format: 'yyyy-MM-dd'
				});
			});
			// 上传附件
			layui.use('upload', function() {
				var $ = layui.jquery, upload = layui.upload;
				//设定文件大小限制
				upload.render({
					elem : '#test7',
					url : 'attach.upload.do',
					accept : 'file',
					size : 2 * 1024 * 1024 //限制文件大小，单位 KB
					,
					before : function(obj) {
						obj.preview(function(index, file, result) {
							$("#test7").attr('src', result);
						});
					},
					done : function(res, index, upload) { //上传后的回调
						if(res.code == '0'){
							var fileName = res.data.src;
			        		layer.msg('上传成功', {
	                 		    icon: 1,
	                 		    shade: [0.8, '#393D49'] // 透明度  颜色
	                 		});
							$("#fileName").text(fileName);
							$("#fileName").val(fileName);
							$("#fileShow").html(fileName);
							$("#fileList").show();
						}else if(res.code == '1'){
			        		layer.msg('上传失败', {
	                 		    icon: 2,
	                 		    shade: [0.8, '#393D49'] // 透明度  颜色
	                 		});
						}
						
					},error: function(){
					      //请求异常回调
						layer.alert('上传失败！');
				    }

				});
			});
		});
	</script>
</body>

</html>