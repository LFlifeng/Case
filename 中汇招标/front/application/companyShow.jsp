<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>企业展示</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/companyShow.css">
    <style type="text/css">
	    [v-cloak] {
		    display: none;
		}
		.tab_content{
		    height:550px;
		}
    </style>
</head>

<body>
    <div class="header">
        <div class="t_top">
            <div class="top_content clearfix">
                <a href="/main.index.do">返回首页</a>
                <div class="top_info r">
                    <span class="r10">客服电话：400-888-1234</span>
                    <span class="web_map r10">
                        <a href="service.index.do" class="">服务标准</a>
                    </span>
                <!--     <span><a href="./personal/p-payment.html" class="">付费指导</a></span> -->
                    <span id="userHead_1" style="display: none">
                        <a href="" id="userName" style="display:inline-block;width:127px; text-align:center;"></a>
                        <i class="fa fa-angle-down"></i>
                        <div id="userHead_2" class="info" style="display:none;">
                            <div class="user_info_head clearfix">
                                <img src="${user.portraitUrl}" class="l">
                                <div class="user_jj l">
                                    <div class="user_level"  id="user_lv">会员级别：<span>普通会员</span></div>
                                    <div class="user_date" id="effectiveTime" style="display:none">有效期至2019年10月22日</div>
                                </div>
                            </div>
                            <div class="user_info_footer">
								<a href="/userQd.center.do">个人中心</a>
								<a href="/userQd.logout.do">退出登录</a>
                            </div>
                        </div>
                    </span>
                </div>
            </div>
        </div>
        <div class="company_name">
            <h1 class="w" id="companyName"></h1>
        </div>
    </div>
    <div class="company_info w clearfix">
        <div class="company_list l">
            <div class="title">公司产品 <span>PRODUCT</span></div>
            <ul>
                <li class="active">供应产品<i class="fa fa-angle-right"></i></li>
                <li>投标采购<i class="fa fa-angle-right" style="display:none;"></i></li>
                <li>资质展示<i class="fa fa-angle-right" style="display:none;"></i></li>
            </ul>
            <div class="title">关于我们 <span>ABOUT US</span></div>
            <ul>
                <li>公司介绍<i class="fa fa-angle-right" style="display:none;"></i></li>
                <li>联系方式<i class="fa fa-angle-right" style="display:none;"></i></li>
            </ul>
        </div>
        <div class="company_content l">
            <div class="tab_content active" id="productsList" v-cloak>
                <div class="company_content_title">
                    供应产品
                </div>
                <ul class="clearfix">
                    <li class="l" v-for="products in productsList" :key="products.id"> 
                        <img :src="products.pictureUrl" alt="" style="width:180px;height:135px;">
                        <p>{{products.productName}}</p>
                        <p>{{products.productDescribe}}</p>
                    </li>

                </ul>
                <!-- 分页 -->
                <div id="paging1" style="margin-top: 50px;"></div>
            </div>
            <div class="tab_content" id="biddingInfoList" v-cloak>
                <div class="company_content_title">
                    投标采购
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>项目类别</th>
                                <th>项目名称</th>
                                <th>所在地区</th>
                                <th>日期</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="biddingInfo in biddingInfoList" :key="biddingInfo.id"> 
                                <td>{{biddingInfo.projectType}}</td>
                                <td><a :href="'biddinginfo.details.do?id=' +biddingInfo.id" target="blank">{{biddingInfo.projectName}}</a></td>
                                <td>{{biddingInfo.province}}</td>
                                <td>{{biddingInfo.deadline}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 分页 -->
                <div id="paging2" style="margin-top: 50px;"></div>
            </div>
            <div class="tab_content" id="qualificationList" v-cloak>
                <div class="company_content_title">
                    资质展示
                </div>
                <div class="qualification clearfix" >
                    <div class="l" v-for="qualification in qualificationList" :key="qualification.id">
                        <img :src="qualification.pictureUrl" alt="" style="width:150px;height:180px;">
                        <p>{{qualification.aptitudeName}}</p>
                    </div>

                </div>
            </div>
            <div class="tab_content">
                <div class="company_content_title">
                    公司介绍
                </div>
                <div class="company_info" >
                    <span id="companyInfo"></span>
                </div>
            </div>
            <div class="tab_content" id="contactInformationInfo" v-cloak>
                <div class="company_content_title">
                    联系我们
                </div>
                <div class="contact">
                    <div>
                        <span>地址：</span>
                        <span>{{contactInfo.address}}</span>
                    </div>
                    <div>
                        <span>邮编：</span>
                        <span>{{contactInfo.postalCode}}</span>
                    </div>
                    <div>
                        <span>电话：</span>
                        <span>{{contactInfo.phone}}</span>
                    </div>
                    <div>
                        <span>联系人：</span>
                        <span>{{contactInfo.contacts}}</span>
                    </div>
                    <div>
                        <span>网址：</span>
                        <span>{{contactInfo.corporatewebsite}}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- 公共底部 -->
	<%@ include file="../common/footer.jsp"%>

    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
    
    
    <script type="text/javascript">
	//定义全局变量
    var id = '${applicationId}';
	var pageIndex = 1;
	var pageSize = 10;
	var totalCount = 0;
	//供应产品
	var products = new Vue({
    	el:"#productsList",
    	data:
    	{
    		productsList:[]
    	},
   	  	created: function ()
        {
   	  		productsList();
        }
		
	});                     
	//投标采购
    var biddingInfo = new Vue({
    	el:"#biddingInfoList",
    	data:
    	{
    		biddingInfoList:[]
    	},
   	  	created: function ()
        {
   	  		biddingInfoList();
        }
    });
    //资质展示
	var qualification = new Vue({
    	el:"#qualificationList",
    	data:
    	{
    		qualificationList:[]
    	},
   	  	created: function ()
        {
   	  		qualificationList();
        }
	});
	//联系方式
	var contactInformation = new Vue({
    	el:"#contactInformationInfo",
    	data:
    	{
    		contactInfo:[]
    	},
   	  	created: function ()
        {
   	  		contactInformation();
        }
	});
	
    function productsList() {
    	pageSize = 8;
		//查询条件
		var param = {
			page : pageIndex,
			rows : pageSize,
			applicationId:id
		};
		$.ajax({
			type : 'POST',
			url : '/product.companyProductList.do',
			dataType : 'json',
			data : param,
			
			success : function(data) {
				products.productsList = data.rows;
				totalCount = data.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging1',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						limits: [8],
						layout : [ 'count', 'prev', 'page', 'next',
								'limit', 'refresh', 'skip' ],
						jump : function(obj, first) {
							//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
							if (!first) {
								pageIndex = obj.curr;
								pageSize = obj.limit;
								productsList();
			
							}
						}
					});
				});
			}

		});
	};
    
	function biddingInfoList() {
		//查询条件
		var param = {
			page : pageIndex,
			rows : pageSize,
			applicationId:id
		};
		$.ajax({
			type : 'POST',
			url : '/biddinginfo.companyBiddingInfolist.do',
			dataType : 'json',
			data : param,
			
			success : function(data) {
				biddingInfo.biddingInfoList = data.rows;
				totalCount = data.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging2',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						limits: [10],
						layout : [ 'count', 'prev', 'page', 'next',
								'limit', 'refresh', 'skip' ],
						jump : function(obj, first) {
							//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
							if (!first) {
								pageIndex = obj.curr;
								pageSize = obj.limit;
								biddingInfoList();
			
							}
						}
					});
				});
			}

		});
	};
    
    function qualificationList() {
		//查询条件
		var param = {
			applicationId:id
		};
		$.ajax({
			type : 'POST',
			url : '/qualification.companyQualificationList.do',
			dataType : 'json',
			data : param,
			success : function(data) {
				qualification.qualificationList = data;
				
			}
		});
	};
	
	
	function contactInformation(){
		//查询条件
		var param = {
			applicationId:id
		};
		$.ajax({
			type : 'POST',
			url : '/application.companyContactInfo.do',
			dataType : 'json',
			data : param,
			success : function(data) {
				contactInformation.contactInfo = data;
				//公司名
	        	var companyName = data.enterpriseName;
	        	$('#companyName').html(companyName);
	        	//公司简介
	        	var companyInfo = data.introduction;
	        	$('#companyInfo').html(companyInfo);
			}
		});
	}
    
    $(function(){
		var userName = '${user.showName}';
		var grade='${user.grade}';
		if(userName){
			$("#userHead_1").css("display","inline-block");  
	  	    $("#userName").html(userName);
	  	  switch (grade)
  	        {
  	    	    case "0":
  	    		$("#user_lv span").html('普通用户');
  	    		break;
  	    		case "1":
  	    		$("#user_lv span").html('普通会员');
  	    		$("#effectiveTime").css("display","");  
  	    		break;
  	    		case "2":
  	    		$("#user_lv span").html('高级会员');
  	    		$("#effectiveTime").css("display","");
  	    		break;
  	    		case "3":
  	    		$("#user_lv span").html('vip高级会员');
  	    		$("#effectiveTime").css("display","");
  	    		break;
  	    		case "4":
  	    		$("#user_lv span").html('钻石会员');
  	    		$("#effectiveTime").css("display","");
  	            break;
  	       }  
		}else{
			$("#userHead_1").css("display","none");     
			$("#userHead_2").css("display","none");     
		}
	});
    </script>
    <script>
        $(function () {
        	
      /*       // 引入公共头部和底部
            $('.footer').load('../slide/footer.html'); */
/*             // 分页
            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage, layer = layui.layer;
                //总页数大于页码总数
                laypage.render({
                    elem: 'demo1',
                    count: 70, //数据总数,
                    jump: function (obj) {
                    }
                });
                laypage.render({
                    elem: 'demo2'
                    , count: 100
                    , theme: '#1E9FFF'
                });
            }); */
            //切换栏
            $('.company_list ul li').on('click',function(){
                $(this).children('i').show().end().siblings('li').children('i').hide();
                $(this).parent().siblings('ul').children('li').children('i').hide();
            })
            // 1. 获取一组li
            var lis = document.querySelectorAll('.company_list li');
            // 2. 获取一组div显示项
            var divs = document.querySelectorAll('.company_content .tab_content');
            // 3. for循环遍历给每一个li注册一个点击事件，给每一个li添加一个index属性，表示li的下标
            for (var i = 0; i < lis.length; i++) {
                // 3.1 给每一个li添加一个index属性
                lis[i].index = i;
                // 3.2 注册事件
                lis[i].onclick = function () {
                    // 4. 在事件处理程序中，① 切换li  ② 切换div
                    // 4.1 循环遍历去掉所有li 和 所有div的类名active
                    for (var j = 0; j < lis.length; j++) {
                        lis[j].className = '';
                        divs[j].className = 'tab_content';
                    }
                    // 4.2 给当前点击的li添加类名active
                    this.className = 'active';
                    // 4.3 获取当前点击的li的下标
                    var num = this.index;
                    // 找到对应的div项，显示
                    divs[num].className = 'tab_content active';
                };
            }
        });
    </script>
</body>

</html>