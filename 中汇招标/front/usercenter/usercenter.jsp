<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心----基本信息</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-basicInformation.css">
</head>
  <style type="text/css">
/*     .test1{
    position: absolute;
    left: 188px;
    top: -40px;
    width: 100px;
    height: 100px;
    }
    .test2{
    position: absolute;
    left:-11px;
    top: -89px;
    width: 100px;
    height: 100px;
    }
    .test3{
    position: absolute;
    left: 142px;
    top: -85px;
    width: 100px;
    height: 100px;
    }
 */    
    .test1,.test2,.test3{
      width:100px;
      height:100px;
    }
    .license{
    position: relative;
    }
    .picture{
    	position: relative;
    }
    #fmz{
    	font-size:13px!important;
    }
    #scyyzz{
    	height: 120px;
    }
  	.scyyzz{
    position: relative;
    top: 30px;
    left: -126px;
    font-size: 13px!important;
    width: 100px!important;
    height: 30px!important;
    line-height: 30px!important;
  	}
  	.sczmz{
    position: absolute;
    top: -19px;
    left: -211px;
    font-size: 13px!important;
    width: 100px!important;
    height: 30px!important;
    line-height: 30px!important;
  	}
    .scfmz{
    position: absolute;
    top: -17px;
    left: -57px;
    font-size: 13px!important;
    width: 100px!important;
    height: 30px!important;
    line-height: 30px!important;
    }
    .uploadState:hover{
     cursor: pointer;
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
          <form class="layui-form">
            <div class="layui-form-item">
              <div class="title">基本信息</div>
            </div>
            <div class="layui-form-item clearfix">
              <input name="id" type="hidden" value="${company.id }"/>
              <div class="l"> 
                <label class="layui-form-label">企业名称</label>
                <input type="text" name="title" id="title" lay-verify="company_title"value="${company.title}"
                  class="layui-input">

              </div>
              <div class="l">
                <label class="layui-form-label">法定代表人</label>
                <input type="text" name="legalPerson" id='company_legalPerson'lay-verify="required"  value="${company.legalPerson}"
                  class="layui-input">

              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="l">
                <label class="layui-form-label">统一信用代码</label>
                <input type="text" name="creditCode" lay-verify="company_number"  value="${company.creditCode}"
                  class="layui-input">
              </div>
              <div class="l">
                <label class="layui-form-label">法人身份证号</label>

                <input type="text" name="idCard" lay-verify="identity" value="${company.idCard}"
                  class="layui-input">

              </div>
            </div>
            <!-- 所在地区 -->
            <div class="layui-form-item">
              <label class="layui-form-label">所在地区</label>
              <div class="layui-input-inline">
                <select id="province" lay-verify="required" lay-filter="provinceFilter">
                  <option ></option>
                </select>
                 <input type="hidden" name="province" id="province_id" value='${company.province}'/>
              </div>
              <div class="layui-input-inline">
                <select id="city" lay-verify="required" lay-filter="cityFilter">
                  <option></option>
                </select>
                <input type="hidden" name="city" id="city_id" value='${company.city}'/>
              </div>
              <div class="layui-input-inline">
                <select id="county" lay-filter="countyFilter">
                  <option></option>
                </select>
                <input type="hidden" name="county" id="county_id" value='${company.county}'/>
              </div>
            </div>
            <!-- 所属行业 -->
            <div class="layui-form-item">
              <label class="layui-form-label">所属行业</label>
              <div class="layui-input-inline">
                <select id="industryOne" lay-verify="required" lay-filter="industryOneFilter">
                  <option value=""></option>
                  <input type="hidden"  name="industryOne" id="industryOne_id" value='${company.industryOne}'/>
                </select>
              </div>
              <div class="layui-input-inline">
                <select id="industryTwo" lay-verify="required" lay-filter="industryTwoFilter">
                  <option value=""></option>
                  <input type="hidden"  name="industryTwo" id="industryTwo_id" value='${company.industryTwo}'/>
                </select>
              </div>
              <div class="layui-input-inline">
                <select id="industryThree" lay-verify="required" lay-filter="industryThreeFilter">
                  <option value=""></option>
                  <input type="hidden"  name="industryThree" id="industryThree_id"  value='${company.industryThree}'/>
                </select>
              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="l">
                <label class="layui-form-label">详情地址</label>
                <input type="text" id='address'name="address" autocomplete="off" lay-verify="company_address"value="${company.address}"
                  class="layui-input">
              </div>
              <div class="l">
                <label class="layui-form-label">邮政编码</label>
                <input type="text" id='postalCode'name="postalCode" autocomplete="off"lay-verify="company_postalCode"value="${company.postalCode}"
                  class="layui-input">

              </div>
            </div>
            <div class="layui-form-item clearfix">
              <div class="l">
                <label class="layui-form-label">联系人</label>
                <input type="text" id='contacts'name="contacts"  lay-verify="company_contacts"autocomplete="off" value="${company.contacts}"
                  class="layui-input">
              </div>
              <div class="l">
                <label class="layui-form-label">手机号码</label>
                <input type="tel" id='phone'name="number"  autocomplete="off" lay-verify="phone"value="${company.number}"
                  class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="email">
                <label class="layui-form-label">邮箱地址</label>
                <input type="text" id='emailAddress'name="emailAddress" lay-verify="email"autocomplete="off" value="${company.emailAddress}"
                  class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="title">企业资质</div>
            </div>
            <div class="layui-form-item" id="scyyzz">
              <%-- <div  class="license">
                <label class="layui-form-label">上传营业执照</label>
                <img class="test1"src="${company.businessLicenseUrl}">
                <button type="button" class="scyyzz uploadState layui-btn layui-btn-normal" id="test1">上传执照</button>
                 <input type="hidden" id="businessLicense_id" lay-verify="required" name="businessLicense" value="${company.businessLicense}">
              </div> --%>
              <div class="license">
                <label class="layui-form-label">上传营业执照</label>
                <span style="margin-top: 10px;margin-left: 20px;color: #ba3f44;display: inline-block;">为了保证您的审核顺利通过 请您上传与填写的资料完全符合，感谢您的积极参与支持！</span>
              </div>
              <div class="picture">
                <div style="display:inline-block;"><img class="uploadState" id="test1" src="${skin}front/img/add.jpg" alt=""></div>
                <div class="photo" id="photo1">
                <c:if test="${company.businessLicenseUrl != ''}">
                	<img src="${company.businessLicenseUrl}" class="test1" alt=""></div>
                </c:if>
                <c:if test="${company.businessLicenseUrl == ''}">
                	<img src="${skin}front/img/shili.png" class="test1" alt=""></div>
                </c:if>
              </div>
               <input type="hidden" id="businessLicense_id" lay-verify="required" name="businessLicense" value="${company.businessLicense}">
            </div>
            <div class="layui-form-item l" style="margin-top:40px">
	              	 <div class="license">
                		上传法人手持身份证
              </div>
              <div class="idcard clearfix">
                <div class="picture l">
                  <div style="display:inline-block;"><img class="uploadState" id="test2" src="${skin}front/img/add.jpg" alt=""></div>
                  <div class="photo" id="photo2">
                  <c:if test="${company.frontCardUrl != ''}">
                		<img class="test2"src="${company.frontCardUrl}">
                  </c:if>
                  <c:if test="${company.frontCardUrl == ''}">
                  		<img class="test2" src="${skin}front/img/zheng.png">
                  </c:if>
                  </div>
                  <p>上传法人手持身份证正面照</p>
                  <input type="hidden" id="frontCard_id"lay-verify="required" name="frontCard" value="${company.frontCard}">
                </div>
                <div class="picture l">
                  <div style="display:inline-block;"><img class="uploadState" id="test3" src="${skin}front/img/add.jpg" alt=""></div>
                  <div class="photo" id="photo3">
                  <c:if test="${company.backCardUrl != ''}">
                    <img class="test3" src="${company.backCardUrl}">
                  </c:if>
                   <c:if test="${company.backCardUrl == ''}">
                	<img class="test3"  src="${skin}front/img/fan.png">
                  </c:if>
                  </div>
                  <p>上传法人手持身份证反面照</p>
                  <input type="hidden" id="backCard_id" lay-verify="required"name="backCard" value="${company.backCard}">
                </div>
              </div>
            </div>
            <!-- 保存上传 -->
            <div class="layui-form-item">
              <div class="layui-input-block">
                <button id='usercheck' class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">点击上传审核</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- 底部 -->
  <%@ include file="../common/footer.jsp" %> 
  
  <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
  <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
  <script>
	    $(function () {
                  var state="${company.state}";
                  if(state!=0){
                      $("#usercheck").addClass("layui-btn-disabled");
                      $("#usercheck").attr("disabled","disabled");
                      $(".uploadState").attr("layui-btn-disabled");
                      $(".uploadState").attr("disabled","disabled");
                      $(".uploadState").addClass("uploadStates");
                      switch(state)
                      {
                       case "1":
                       $("#usercheck").html("审核通过");
                       break;
                       case "2":
                       $("#usercheck").html("审核未通过");
                       break;
                       case "3":
                       $("#usercheck").html("审核中");
                       break;
                  	}
                     
                  }
	    	layui.use('form', function() 
	    	{
      			var form = layui.form;
      			//监听提交
      			form.on('submit(formDemo)', function(data) 
      			{
      				var index = layer.load(1, 
              {
                      shade: [0.1,'#fff'] //0.1透明度的白色背景
                      });
      				//添加缓存
                  $.post('company.auditing.do',data.field,function(res)
                   {
                	  
                      	layer.close(index);
                      	if(res=="succ")
                      	{
                      		layer.alert("保存成功", 
                          {
                                  icon: 1,
                                  skin: 'layer-ext-moon'
                              })
      					$("#usercheck").addClass("layui-btn-disabled");
                        $("#usercheck").attr("disabled","disabled");
                        $("#usercheck").html("等待审核");
                        $(".uploadState").attr("layui-btn-disabled");
                        $(".uploadState").attr("disabled","disabled");
                        $(".uploadState").addClass("uploadStates");
                      	}else if(res=="fail")
                        {
                          	layer.alert("保存失败", 
                            {
                                  icon: 2,
                                  skin: 'layer-ext-moon'
                            })
                           
                          }
                      	else{
                      		 layer.msg(res,{icon:5});
                      		 return false;
                      	   }
                       })  
      				return false;
      			});
      		});
          //用户中心用户信息上传图片功能
	      layui.use('upload', function()
	      {
		        var $ = layui.jquery
		        ,upload = layui.upload;
  			    var uploadInst = upload.render(
            {
      			    elem: '#test1,#test2,#test3'
      			    ,url: 'attach.uploadImage.do'
      			    ,accept: 'images' //允许上传的文件类型
      			    , size: 5120 //限制文件大小，单位 KB
      			    ,before: function(obj)
  	            {
  	           	    //判断点击的是哪个上传图片，将图片添加到指定的位置
    	     	        var id=$(this)[0].item.attr("id");
    	     	   	    obj.preview(function(index, file, result)
  	     			  {
  			   			    $('.'+id).attr('src', result); 	
  	      			});
  	     	   }
        	    ,done: function(res)
        	    {
        	       	 var id=$(this)[0].item.attr("id");
        	       	 if("test1"==id)
        	       	 {
        	       		 var id = res.data.src;
        	       		 $("#businessLicense_id").val(id);
        	       	 }
        	       	  else if("test2"==id)
        	       	 {
        	       		 var id = res.data.src;
        	       		 $("#frontCard_id").val(id);
        	       	 }
        	       	  else if("test3"==id)
        	       	 {
        	       		 var id = res.data.src;
        	       		 $("#backCard_id").val(id);
        	       	 }
        	       	  //如果上传失败
        		      if(res.code > 0){
        		      return layer.msg('上传失败');
      	      }
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


      //添加用户省市县信息
      var industryOne='${company.industryOne}';
      var industryTwo='${company.industryTwo}';
      var industryThree='${company.industryThree}';
  	  var cityFlag = true;
  	  var proFlag = true;
   	  var province = '${company.province}';
   	  var city = '${company.city}';
   	  var county = '${company.county}';
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
      function addOption(url, id, name, fenlei) 
      {
        $.ajax({
          url: url,
          dataType: 'json',
          type: 'get',
          data:{
          	id:id
          },
          success: function (data) 
          {
            $.each(data, function (index, item)
            {
              if(fenlei=="item.title")
              {
            	   if(proFlag)
                  {

            		  if("industryOne"==name)
            		  {
            		  	  if(industryOne=='')
            		  	  {
            		  	  	 proFlag = false;
            		  	   $('#' + name).append(new Option(item.title, item.id));
            		  	  }
            		  	  else if (industryOne==item.title)
            		  	  {
            		  	  	  $('#' + name).append(new Option(item.title, item.id,true,true));
            		  	  	  addOption(url, item.id, "industryTwo", fenlei);
            		  	  }
            		  	  else
            		  	  {
            		  	  	 $('#' + name).append(new Option(item.title, item.id));
            		  	  }
            		  }
            		  else if("industryTwo"==name)
            		  {
            		  	if(industryTwo=='')
            		  	{
            		  		proFlag = false;
            		  		 $('#' + name).append(new Option(item.title, item.id));
            		  	}
            		  	else if(industryTwo == item.title)
            		  	{
 							 $('#' + name).append(new Option(item.title, item.id,true,true));
            		  	  	 addOption(url, item.id, "industryThree", fenlei);
            		  	}
            		  	else
            		  	{
            		  		$('#' + name).append(new Option(item.title, item.id));
            		  	}
						
            		  }
            		  else if("industryThree" == name)
            		  { 
            			  if(industryThree=='')
            			  {
            			  	 proFlag = false;
            			  	 $('#' + name).append(new Option(item.title, item.id));
            			  }
            			 else if(industryThree == item.title)
            		  	 {
 							 $('#' + name).append(new Option(item.title, item.id,true,true));
            		  	  	 proFlag = false;
            		  	 }
            		  	 else
            		   	 {
            		  		$('#' + name).append(new Option(item.title, item.id));
            		  	 }
            		  }
                  }	  
            	  else
            	  {
            		  $('#' + name).append(new Option(item.title, item.id));
            	  }
              }
              else
              {
            	  
            	  if(cityFlag)
                  {

            		  if("province"==name)
            		  {
            		  	  if(province=='')
            		  	  {
            		  	  	 cityFlag = false;
            		  	  	$('#' + name).append(new Option(item.regionName, item.id));
            		  	  }
            		  	  else if (province==item.regionName)
            		  	  {
            		  	  	  $('#' + name).append(new Option(item.regionName, item.id,true,true));
            		  	  	  addOption(url, item.id, "city", fenlei);
            		  	  }
            		  	  else
            		  	  {
            		  	  	 $('#' + name).append(new Option(item.regionName, item.id));
            		  	  }
            		  }
            		  else if("city"==name)
            		  {
            		  	if(city=='')
            		  	{
            		  		cityFlag = false;
            		  		 $('#' + name).append(new Option(item.regionName, item.id));
            		  	}
            		  	else if(city == item.regionName)
            		  	{
 							 $('#' + name).append(new Option(item.regionName, item.id,true,true));
            		  	  	 addOption(url, item.id, "county", fenlei);
            		  	}
            		  	else
            		  	{
            		  		$('#' + name).append(new Option(item.regionName, item.id));
            		  	}
						
            		  }
            		  else if("county" == name)
            		  { 
            			  if(county=='')
            			  {
            			  	 cityFlag = false;
            			  	$('#' + name).append(new Option(item.regionName, item.id));
            			  }
            			 else if(county == item.regionName)
            		  	 {
 							 $('#' + name).append(new Option(item.regionName, item.id,true,true));
            		  	  	 cityFlag = false;
            		  	 }
            		  	 else
            		   	 {
            		  		$('#' + name).append(new Option(item.regionName, item.id));
            		  	 }
            		  }
                  }	  
            	  else
            	  {
            		  $('#' + name).append(new Option(item.regionName, item.id));
            	  }
 	             
              }
              layui.form.render("select")
            })
          }
        })
      }
      //用户首页基本信息
      //各种基于事件的操作，下面会有进一步介绍
      //入口函数
      //用户
      // 引入公共底部
      // $.get('../../slide/footer.html',function (result) {
      //   $result = $(result);
      //   $result.find('.footer_content').appendTo('.footer');
      // },'html');
      // 手风琴导航
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
      /* 去除input记忆 */
      $("input").attr({"autocomplete":"off"});
    });
	    layui.use([ 'form', 'jquery' ], function() 
				{
			        /*表单验证*/
					var form = layui.form, $ = layui.$;
						form.verify(
						{
							company_title: function(value, item) 
							{
								if (value.length > 50 || value.length < 1) 
								{
									return '请输入正确的1-50位的企业名称';
								}
							},
							company_legalPerson: function(value, item) 
							{
								if (value.length > 50 || value.length < 1) 
								{
									return '请输入正确的1-50位的法定代表人';
								}
							},
							company_number: function(value, item) 
							{
								if (value.length > 18 || value.length < 15) 
								{
									return '请输入正确的15-18位的统一代码';
								}
							},
							company_postalCode: function(value, item) 
							{
								if (value.length != 6 ) 
								{
									return '请输入正确的邮政编码';
								}
							},
							 company_contacts: function(value, item) 
							{
								if (value.length > 10 || value.length < 1) 
								{
									return '请输入正确的1-10位的联系人';
								}
							},  
							company_address: function(value, item) 
							{
								if (value.length > 50 || value.length < 1) 
								{
									return '请输入正确的地址详情';
								}
							}
					     });
				});
	    $('#photo1').on('click', function () {
	    	  var img1;
	    	  if($(".test1").attr("src") == "${skin}front/img/shili.png" || '${company.businessLicenseUrl}' != ''){
	    		  img1='${company.businessLicenseUrl}' !=''?'${company.businessLicenseUrl}':'${skin}/front/img/yyzz.png';
	    	  }else{
	    		 img1=$(".test1").attr("src");
	    	  }
	        layer.open({
	          type: 1,
	          title: [''],
	          area: '625px',
	          shade: 0.2,
	          id: 'layui',
	          anim: 2,
	          resize: false,
	          content: "<img style=width:625px src="+img1+" alt=''>",
	          end: function () {
	            // $('.shenqing').hide()
	          }
	        })
	      })
	      $('#photo2').on('click', function () {
	    	  var img2;
	    	  if($(".test2").attr("src") == "${skin}front/img/zheng.png" || '${company.frontCardUrl}' != ''){
		    	 img2='${company.frontCardUrl}' !=''?'${company.frontCardUrl}':'${skin}/front/img/zheng1.png';
	    	  }else{
	    		 img2=$(".test2").attr("src");
	    	  }
	        layer.open({
	          type: 1,
	          title: [''],
	          area: '625px',
	          shade: 0.2,
	          id: 'layui',
	          anim: 2,
	          resize: false,
	          content: "<img style=width:625px src="+img2+" alt=''>",
	          end: function () {
	            // $('.shenqing').hide()
	          }
	        })
	      })
	      $('#photo3').on('click', function () {
	    	  var img3;
	    	  if($(".test3").attr("src") == "${skin}front/img/fan.png" || '${company.frontCardUrl}' != ''){
	    		  img3='${company.backCardUrl}' !=''?'${company.backCardUrl}':'${skin}/front/img/fan1.png';
	    	  }else{
	    		 img3=$(".test3").attr("src");
	    	  }
	        layer.open({
	          type: 1,
	          title: [''],
	          area: '625px',
	          shade: 0.2,
	          id: 'layui',
	          anim: 2,
	          resize: false,
	          content: "<img style=width:625px src="+img3+" alt=''>",
	          end: function () {
	            // $('.shenqing').hide()
	          }
	        })
	      })
  </script>
</body>

</html>