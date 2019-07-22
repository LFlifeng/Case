<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心----申请入驻</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-application.css">
</head>
<style>

	 .layui-anim
	 {
		    width: 190px!important;
		    top: 38px!important;
		    left: 1px!important;
		    height: 250px!important
	 }
	    
  .buildstyle
  {
    background-color: #ba3f44;
    border: none;
    width: 100px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    color: #fff;
    border-radius: 5px;
  }
  
  .buildstyle:hover
  {
    color:#FFF !important;
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
          <form class="layui-form">
            <div class="layui-form-item">
              <div class="title">申请入驻</div>
            </div>
            <div class="layui-form-item clearfix">
              <input type='hidden' name='id' value='${application.id}'>
              <div class="l">
                <label class="layui-form-label">企业名称</label>
                <input type="text" name="enterpriseName" lay-verify="enterpriseName" value='${application.enterpriseName}'autocomplete="off" placeholder="请输入企业名称"
                  class="layui-input">

              </div>
              <div class="l">
                <label class="layui-form-label">法定代表人</label>
                <input type="text" name="representative" lay-verify="representative" autocomplete="off" value='${application.representative}'placeholder="请输入法定代表人"
                  class="layui-input">

              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="l">
                <label class="layui-form-label">统一信用代码</label>
                <input type="text" name="code" lay-verify="code" value='${application.code}'autocomplete="off" placeholder="请输入统一信用代码"
                  class="layui-input">
              </div>
              <div class="l">
                <label class="layui-form-label">法人身份证号</label>

                <input type="text" name="identity" lay-verify="identity" value='${application.identity}'autocomplete="off" placeholder="请输入法人身份证号码"
                  class="layui-input">

              </div>
            </div>
           <div class="layui-form-item">
              <label class="layui-form-label">所在地区</label>
              <div class="layui-input-inline">
                <select id="province" lay-verify="required" lay-filter="provinceFilter">
                  <option ></option>
                </select>
                 <input type="hidden" name="province" id="province_id" value='${application.province}'/>
              </div>
              <div class="layui-input-inline">
                <select id="city" lay-verify="required" lay-filter="cityFilter">
                  <option></option>
                </select>
                <input type="hidden" name="city" id="city_id" value='${application.city}'/>
              </div>
              <div class="layui-input-inline">
                <select id="county" lay-filter="countyFilter">
                  <option></option>
                </select>
                <input type="hidden" name="county" id="county_id" value='${application.county}'/>
              </div>
            </div>
            <!-- 所属行业 -->
            <div class="layui-form-item">
              <label class="layui-form-label">所属行业</label>
              <div class="layui-input-inline">
                <select id="industryOne" lay-verify="required" lay-filter="industryOneFilter">
                  <option value=""></option>
                  <input type="hidden"  name="industryOne" id="industryOne_id" value='${application.industryOne}'/>
                </select>
              </div>
              <div class="layui-input-inline">
                <select id="industryTwo" lay-verify="required" lay-filter="industryTwoFilter">
                  <option value=""></option>
                  <input type="hidden"  name="industryTwo" id="industryTwo_id" value='${application.industryTwo}'/>
                </select>
              </div>
              <div class="layui-input-inline">
                <select id="industryThree" lay-verify="required" lay-filter="industryThreeFilter">
                  <option value=""></option>
                  <input type="hidden"  name="industryThree" id="industryThree_id"  value='${application.industryThree}'/>
                </select>
              </div>
            </div>
            <!-- 上传附件 -->
            <div class="layui-form-item">
             <%--  <label class="layui-form-label">上传营业执照</label>
              <button type="button" name='businessLicense'class="layui-btn layui-btn-danger" id="test1">点击上传</button>
              <div class="layui-inline layui-word-aux">上传大小不超过5MB</div>
              <c:if test="${application.businessLicenseUrl != ''}">
     	         <img class="tupian" style='width: 73px;height: 73px;'src="${application.businessLicenseUrl}">
              </c:if>
              <c:if test="${application.businessLicenseUrl == ''}">
     	         <img class="tupian" style='width: 73px;height: 73px;'>
              </c:if> --%>
              
             <div class="license">
                <label class="layui-form-label">上传营业执照</label>
              </div>
              <div class="picture">
                <div style="display:inline-block;"><img style="cursor: pointer;" class="uploadState" id="test1" src="${skin}front/img/add.jpg" alt=""></div>
                 <div class="photo" style="display:inline-block;margin-left: 40px;">
                <c:if test="${application.businessLicenseUrl != ''}">
                	<img style="width: 100px;height: 100px;" src="${application.businessLicenseUrl}" class="tupian" alt=""></div>
                </c:if>
                <c:if test="${application.businessLicenseUrl == ''}">
                	<img style="width: 100px;height: 100px;" src="${skin}front/img/shili.png" class="tupian" alt="">
               </div>
                </c:if>
                <input type="hidden" id="business_license"lay-verify="required" name="businessLicense" value="${application.businessLicense}">
              </div>
            <br>
            
            <div class="layui-form-item">
              <label class="layui-form-label">公司类型</label>
              <div class="layui-input-inline">
                <select class='companytype'name="companytype" lay-verify="required" lay-search="">
                  <option value=""></option>
                </select>
              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="l">
                <label class="layui-form-label">详情地址</label>
                <input type="text" name="address" value='${application.address}' lay-verify="address" autocomplete="off" placeholder="请输入公司详情地址"
                  class="layui-input">
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              </div>
              <div class="l">
                <label class="layui-form-label">邮政编码</label>
                <input type="text" name="postalCode" value='${application.postalCode}'lay-verify="postalCode" autocomplete="off" placeholder="请输入邮政编码"
                  class="layui-input">
              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="l">
                <label class="layui-form-label">联系人</label>
                <input type="text" name="contacts" value='${application.contacts}'lay-verify="contants" autocomplete="off" placeholder="请输入联系人姓名"
                  class="layui-input">
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              </div>
              <div class="l">
                <label class="layui-form-label">手机号码</label>
                <input type="tel" name="phone" value='${application.phone}' lay-verify="required|phone" autocomplete="off" placeholder="请输入联系人手机号码"
                  class="layui-input">
              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="money l">
                <label class="layui-form-label">注册资本</label>
                <input type="text" name="registeredcapital" value='${application.registeredcapital}' lay-verify="registeredcapital" autocomplete="off" placeholder="请输入注册资本金额"
                  class="layui-input">
                <span>万元</span>
              </div>
              <!-- 日期 -->
              <div class="date l">
                <label class="layui-form-label">注册时间</label>
                <div class="layui-input-inline">
                  <div class="layui-input-inline">
                    <input name='registerctime'type="text" readonly class="layui-input" value='${application.registerctime}'lay-verify="date" id="test5" placeholder="">
                  </div>
                </div>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">公司网站</label>
              <div class="layui-input-block">
                <input type="text" name="corporatewebsite" value='${application.corporatewebsite}'lay-verify="corporatewebsite" autocomplete="off" placeholder="请输入公司网站地址"
                  class="layui-input">
              </div>
            </div>
	        <div class="layui-form-item">
	              <label class="layui-form-label">公司介绍</label>
	            </div>
                 <div class="layui-form-item">
	              <div class=".layui-input-block">
	                <div id="editor">
	                ${application.introduction}
	                </div>
	              </div>
	              <div style="display: none;">
					<textarea id="introduction"  name="introduction" style="width:100%; height:200px;" lay-verify="required">
					</textarea>
				  </div>
	            </div>
            <div class="business">
              <div class="t_top clearfix">
                <h3 class="l">经营情况</h3>
                <a class="r buildstyle" onclick="buildJyzz();">+新建</a>
              </div>
              <div class="table-responsive" id='jjqk'>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>经营年限</th>
                      <th>主营产品</th>
                      <th>所属行业</th>
                      <th>销售额</th>
                      <th>修改</th>
                    </tr>
                    <tr class="t_t" v-for="(application,index) in applicationslist">
                    		<td>{{index+1}}</td>
							<td>{{application.operations}}</td>
							<td>{{application.product}}</td>
							<td>{{application.industry}}</td>
							<td>{{application.sale}}</td>
							<td><button type="button" class="btn btn-sm btn-danger" @click="clickItem(application.id)">删除</button></td>
					</tr>
                  </thead>
                </table>
              </div>
            </div>
            <div class="business company">
              <div class="t_top clearfix">
                <h3 class="l">企业资质</h3>
                <a class="r buildstyle" onclick="buildWyzz();">+新建</a>
              </div>
              <div class="table-responsive" id='qyzz'>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>企业资质名称</th>
                      <th>图片</th>
                      <th>修改</th>
                    </tr>
                     <tr class="t_t" v-for="(qualification,index) in qualificationlist">
                    		<td>{{index+1}}</td>
							<td>{{qualification.aptitudeName}}</td>
							<td><img style="width: 35px;height: 35px;" v-bind:src='qualification.pictureUrl'></td>
							<td><button type="button" class="btn btn-sm btn-danger" @click="clickItem(qualification.id)">删除</button></td>
					</tr>
                  </thead>
                </table>
              </div>
            </div>
            <!-- 保存上传 -->
            <div class="layui-form-item">
              <div class="layui-input-block">
                <button id='scsh'class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">点击上传审核</button>
              </div>
            </div>
        </div>
          </form>
      </div>
    </div>
  </div>
  <!-- 底部 -->
  <%@ include file="../common/footer.jsp"%>
  </div>
  <script src='${skin}front/data/enterpriseType.js'></script>
  <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
  <script src="${skin}front/js/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js"></script>
  <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
  <script>
  function loadLists()
  {
	  $.ajax({
           url: '/qualification.list.do',
           type: 'post'
       }).then(function (data)
      {
			 data = JSON.parse(data);
			 qyzz.qualificationlist = data.rows;
       }).fail(function () {});
  }
  function loadList()
  {
	  $.ajax({
           url: '/manageCondition.list.do',
           type: 'post'
       }).then(function (data)
      {
    	   
			 data = JSON.parse(data);
			 jjqk.applicationslist = data.rows;
       }).fail(function () {});
  }
  function buildWyzz(){
	  layui.use('layer', function () 
		    	  {
		               var layer = layui.layer;
		               layer.open({
		                 title: ['添加'],
		                 type: 2,
		                 content: "qualification.buildQyzz.do",
		                 offset: 'auto',
		                 area: ['570px', '350px'],
		                 shadeClose: true, //开启遮罩关闭
		                 end: function () 
		                 {
		   
		                	 if(localStorage.getItem("buildQyzzSucc"))
		                	 {
		                		 localStorage.removeItem("buildQyzzSucc");
		                		 loadLists();
		                	 } 
		                 },
		               });
		           });
	  
	  
  }
  function buildJyzz(){
	  layui.use('layer', function () 
	    	  {
	               var layer = layui.layer;
	               layer.open({
	                 title: ['添加'],
	                 type: 2,
	                 content: "/manageCondition.buildJyzz.do",
	                 offset: 'auto',
	                 area: ['620px', '460px'],
	                 shadeClose: true, //开启遮罩关闭
	                 end: function () 
	                 {
	                	
	                	 if(localStorage.getItem("buildJyzzSucc"))
	                	 {
	                		 localStorage.removeItem("buildJyzzSucc");
	                		 loadList();
	                	 } 
	                	
	                 },
	               });
	           });
	  
  }
    //入口函数
    $(function () {
    	
    	/* 去除input记忆 */
        $("input").attr({"autocomplete":"off"});
    	 // 富文本编辑器
        // $('#editor').wysiwyg();
        var E = window.wangEditor;
        var editor = new E('#editor');
        /* editor.customConfig.zIndex = 100; */
        
        editor.customConfig.onchange = function (html) {
	        // 监控变化，同步更新到 textarea
	         $('#introduction').val(html)
	    }
        // 或者 var editor = new E( document.getElementById('editor') )
        
        editor.create();
        $('#introduction').val(editor.txt.html())
    	
    	
      if('${application.state}' != 0)
      {
    	  $("#scsh").addClass("layui-btn-disabled");
          $("#scsh").attr("disabled","disabled");
          $("#scsh").html("等待审核");
      }
      var industryOne='${application.industryOne}';
      var industryTwo='${application.industryTwo}';
      var industryThree='${application.industryThree}';
      var cityFlag = true;
      var proFlag = true;
      var province = '${application.province}';
      var city = '${application.city}';
      var county = '${application.county}';
      ThreeLianDong("sysCity.city.do", "0", "province", "city","county", "item.regionName");
      ThreeLianDong("industry.getChildren.do", "0","industryOne", "industryTwo", "industryThree", "item.title");
      addOption("sysCity.city.do","0", "province",  "item.regionName");
      addOption("industry.getChildren.do","0", "industryOne",  "item.title");
      function ThreeLianDong(url, param, name, name1, name2, name3) 
      {
          layui.use(['form', 'upload', 'layer'], function ()
           {
  	          var form = layui.form;
  	          //      //获取选中后的省或市id
  	          form.on('select(' + name + 'Filter)', function (data)
               {
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
    	  if(id==""){
    		  alert(id)
    		  return;
    	  }
          $.ajax({
              url: url,
              dataType: 'json',
              type: 'get',
              data: {
                  id: id
              },
              success: function(data) {
                  $.each(data,
                  function(index, item) {
                      if (fenlei == "item.title") {
                          if (proFlag) {
                              if ("industryOne" == name) {
                                  if (industryOne == '') {
                                      proFlag = false;
                                      $('#' + name).append(new Option(item.title, item.id));
                                  } else if (industryOne == item.title) {
                                      $('#' + name).append(new Option(item.title, item.id, true, true));
                                      addOption(url, item.id, "industryTwo", fenlei);
                                  } else {
                                      $('#' + name).append(new Option(item.title, item.id));
                                  }
                              } else if ("industryTwo" == name) {
                                  if (industryTwo == '') {
                                      proFlag = false;
                                      $('#' + name).append(new Option(item.title, item.id));
                                  } else if (industryTwo == item.title) {
                                      $('#' + name).append(new Option(item.title, item.id, true, true));
                                      addOption(url, item.id, "industryThree", fenlei);
                                  } else {
                                      $('#' + name).append(new Option(item.title, item.id));
                                  }

                              } else if ("industryThree" == name) {
                                  if (industryThree == '') {
                                      proFlag = false;
                                      $('#' + name).append(new Option(item.title, item.id));
                                  } else if (industryThree == item.title) {
                                      $('#' + name).append(new Option(item.title, item.id, true, true));
                                      proFlag = false;
                                  } else {
                                      $('#' + name).append(new Option(item.title, item.id));
                                  }
                              }
                          } else {
                              $('#' + name).append(new Option(item.title, item.id));
                          }
                      } else {

                          if (cityFlag) {

                              if ("province" == name) {
                                  if (province == '') {
                                      cityFlag = false;
                                      $('#' + name).append(new Option(item.regionName, item.id));
                                  } else if (province == item.regionName) {
                                      $('#' + name).append(new Option(item.regionName, item.id, true, true));
                                      addOption(url, item.id, "city", fenlei);
                                  } else {
                                      $('#' + name).append(new Option(item.regionName, item.id));
                                  }
                              } else if ("city" == name) {
                                  if (city == '') {
                                      cityFlag = false;
                                      $('#' + name).append(new Option(item.regionName, item.id));
                                  } else if (city == item.regionName) {
                                      $('#' + name).append(new Option(item.regionName, item.id, true, true));
                                      addOption(url, item.id, "county", fenlei);
                                  } else {
                                      $('#' + name).append(new Option(item.regionName, item.id));
                                  }

                              } else if ("county" == name) {
                                  if (county == '') {
                                      cityFlag = false;
                                      $('#' + name).append(new Option(item.regionName, item.id));
                                  } else if (county == item.regionName) {
                                      $('#' + name).append(new Option(item.regionName, item.id, true, true));
                                      cityFlag = false;
                                  } else {
                                      $('#' + name).append(new Option(item.regionName, item.id));
                                  }
                              }
                          } else {
                              $('#' + name).append(new Option(item.regionName, item.id));
                          }

                      }
                      layui.form.render("select")
                  })
              }
          })
      }
      
    //上传图片功能
      layui.use('upload', function()
      {
	        var $ = layui.jquery
	        ,upload = layui.upload;
			    var uploadInst = upload.render(
        {
  			    elem: '#test1'
  			    ,url: 'attach.uploadImage.do'
  			    , size: 5120 //限制文件大小，单位 KB
  			    ,accept: 'images' //允许上传的文件类型
    				// ,size: 10 //最大允许上传的文件大小
  			    ,before: function(obj)
	            {	
	           	    //将图片添加到指定的位置
	     	   	    obj.preview(function(index, file, result)
	     			  {
			   			    $('.tupian').attr('src', result); 	
	      			});
	     	   }
    	    ,done: function(res)
    	    {
   	       		 var id = res.data.src;
   	       		 $("#business_license").val(id);
    	       	  //如果上传失败
    		      if(res.code > 0){
    		      return layer.msg('上传失败');
  	         }
          //上传成功
	    }
	    ,error: function()
	    {
	      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
	          uploadInst.upload();
	      });
	    }
	    });
	    })
      
          //添加公司类型
          $.each(JSON.parse(enterpriseTypeArr),function(index, item) 
          {
        	  if(item.n=='${application.companytype}')
        	  {
        		  $('.companytype').append(new Option(item.n,item.n, true, true))
        	  }
        	  $('.companytype').append(new Option(item.n,item.n))
          			layui.form.render("select")
          })
          
           //上传审批功能
          layui.use([ 'form', 'jquery' ], function() 
          {
        	  var form = layui.form, $ = layui.$;
        	  form.on('submit(formDemo)',function(data)
        	  {
	        		  $.ajax({
	        			  url:"application.uploadAudt.do",
	        			  data:data.field,
	        			  type:"POST",
	        			  success:function(res)
	        			  {
								 if(res=="succ")
			                	{
		                		layer.alert("保存成功", 
		                		{
		                            icon: 1,
		                            skin: 'layer-ext-moon'
		                        })
		                        $("#scsh").addClass("layui-btn-disabled");
		                        $("#scsh").attr("disabled","disabled");
		                        $("#scsh").html("等待审核");
		                        
		                    }else if(res=="fail")
		                    {
		                    	layer.alert("保存失败", 
		                    	{
		                            icon: 2,
		                            skin: 'layer-ext-moon'
		                        })
		                    } 
		                    else
		                    {
		                    	layer.msg(res,{icon:5}); 
		                    } 
        			  	}
        		 	 })
        		 	 return false;
        	  })
          })
         
      loadList();
      //重新加载
     
     
    loadLists();
      
          
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
      // 下拉菜单部分
      // 1.鼠标进入一级菜单后，显示二级菜单
      $('.top .personal .detail div:nth-child(3)').mouseover(function () {
        $(this).siblings('ul').show();
      });
      // 2.鼠标离开一级菜单后，隐藏二级菜单
      $('.top .personal .detail div:nth-child(3)').mouseout(function () {
        $(this).next().hide();
      });
      // 3.鼠标进入二级菜单，显示二级菜单
      $('.detail>.ul').mouseover(function () {
        $(this).show();
      });
      // 4.鼠标离开二级菜单，隐藏二级菜单
      $('.detail>.ul').mouseout(function () {
        $(this).hide();
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
      // 日期设置
      layui.use('laydate', function () {
        var laydate = layui.laydate;
        //初始赋值
        laydate.render({
          elem: '#test5',
          format: 'yyyy-MM-dd'
        });
      });
    });
    
    /*vue渲染经济情况*/
    var jjqk = new Vue({
		el : "#jjqk",
		data : {
			applicationslist : []
		},
		methods:
		{
			clickItem:function(index){
	            	layer.confirm('您是否确定删除？', {
	            		  btn: ['是','否'] //按钮
	            		}, function(){
	            			var param = {
	                    			id : index
	                    	};
	                    	$.ajax({
	        			        type: 'POST',
	        			        url: '/manageCondition.deletelist.do',
	        			        data: param,
	        			        success: function (data)
	        			        {
	        			        	if(data=="succ")
	        			        	{
	        			        		layer.alert('删除成功');
		        						loadList();	
	        			        	}
	        			        	else
	        			        	{
	        			        		layer.alert('删除失败');
	        			        	}
	        			        	
	        			        }
		
	        			    });
	            		 
	            		}, function(){
	            			
	            		});
	            }
		}
	});
    /*vue渲染经济情况*/
    var qyzz = new Vue({
	el : "#qyzz",
	data : {
		qualificationlist : []
	},
	methods:
	{
		clickItem:function(index){
       	layer.confirm('您是否确定删除？', {
       		  btn: ['是','否'] //按钮
       		}, function(){
       			var param = {
               			id : index
               	};
               	$.ajax({
   			        type: 'POST',
   			        url: '/qualification.deletelist.do',
   			        data: param,
   			        success: function (data)
   			        {
   			        	if(data=="succ")
   			        	{
   			        		layer.alert('删除成功');
       						loadLists();	
   			        	}else if(res=="fail")
                        {
                          	layer.alert("保存失败", 
                            {
                                  icon: 2,
                                  skin: 'layer-ext-moon'
                            })
                           
                          }
   			        	else{
                     		 layer.msg(data,{icon:5});
                     		 return false;
                     	   }
   			        	
   			        }

   			    });
       		 
       		}, function(){
       			
       		});
       }
	}
});
    
    layui.use([ 'form', 'jquery' ], function() 
			{
		        
				var form = layui.form, $ = layui.$;
						
					form.verify(
					{
						registeredcapital: function(value, item) 
						{
							if (value.length > 11 || value.length < 1) 
							{
								return '请输入正确的1-11位的注册资本';
							}
						},
					corporatewebsite: function(value, item) 
					{
						if (value.length > 50 || value.length < 1) 
						{
							return '请输入正确的1-50位的详情地址';
						}
					},
					address: function(value, item) 
					{
						if (value.length > 50 || value.length < 1) 
						{
							return '请输入正确的1-50位的公司网站';
						}
					},
					representative: function(value, item) 
					{
						if (value.length > 50 || value.length < 1) 
						{
							return '请输入正确的1-50位的法定代表人';
						}
					},
					enterpriseName: function(value, item) 
					{
						if (value.length > 50 || value.length < 1) 
						{
							return '请输入正确的1-50位的企业名称';
						}
					},
					code: function(value, item) 
					{
						if (value.length > 18 || value.length < 15) 
						{
							return '请输入正确的15-18位的统一信用代码';
						}
					} ,
					contants: function(value, item) 
					{
						if ((value.length > 10 || value.length < 1)) 
						{
							return '请输入正确1-10位的联系人';
						}
					} 
					,postalCode: function(value, item) 
					{
						if ((value.length != 6)) 
						{
							return '请输入正确6位的邮箱编码';
						}
					}
					
			     });
			})
  </script>
</body>

</html>