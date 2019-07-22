<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>中汇招标----详情页</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="shortcut icon" href="${skin}mobile/favicon.ico"
	type="image/x-icon">
<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${skin}mobile/css/base.css">
<link rel="stylesheet" href="${skin}mobile/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<style>
.zh_content{
  margin-bottom: 50px;
}
.details td {
	text-align: center;
}

.zh_content {
	width: 100% !important;
	padding-right: 24px;;
}

.arc_arc {
	width: 100% !important;
	word-break: break-all;
	overflow: auto;
}

.arc_arc div {
	white-space: pre-wrap;
}

table {
	margin: 0 !important;
}
.arc_arc table tr,.arc_arc table td,.arc_arc table th{
    width: auto !important;
}
.arc_arc table {
	margin: 0px;
	table-layout: fixed;
	width: 100% !important;
	white-space: pre-wrap;
}

.arc_arc table tr td {
	width: 100% !important;
	white-space: pre-wrap;
}

.arc_arc table table {
    table-layout: fixed;
    word-break: break-all;
    text-align: left;
    width: 100% !important;
}

.arc_arc div {
	text-align: left !important;
	width: 100% !important;
	text-indent: 20px !important;
	margin-left: 0 !important;
}
</style>
</head>

<body>
	<div class="zh_layout">
		<header class="zh_topBar mui-bar mui-bar-nav ">
			<a href="javascript:history.back()" class="l"><img
				src="${skin}mobile/img/back.png" alt=""></a> <span
				style="font-size: 16px; font-weight: bold; position: relative; top: 6px;">详情</span>
		</header>
		<div class="zh_container">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
						<li class="mui-table-view-cell mui-media"><a
							href="javascript:;">
								<div class="mui-media-body"
									style="overflow: auto; text-overflow: clip; white-space: normal">
									${detail.name}
									<div class="item_flex">
										<div class="flex">
											<i><img src="${skin}mobile/img/icon6.png"></i>${detail.province}
										</div>
										<div class="flex">
											<i><img src="${skin}mobile/img/icon7.png"></i>${detail.type}
										</div>
										<div class="flex">
											<i><img src="${skin}mobile/img/icon8.png"></i>${detail.time }
										</div>
									</div>
								</div>
						</a></li>
					</ul>
					<div id="notice_id" class="zh_content" style="overflow: auto;">
						<table>
							<tbody>
								<tr>
									<td>项目编号</td>
									<td>
										<%-- ${detail.projectCode} --%>
									</td>
								</tr>
								<tr>
									<td>招标产品</td>
									<td>
										<%-- ${detail.type} --%>
									</td>
								</tr>
								<tr>
									<td>所属行业</td>
									<td>${detail.industry}</td>
								</tr>
								<tr>
									<td>所属地区</td>
									<td>${detail.province}</td>
								</tr>
								<tr>
									<td>联系人</td>
									<td>
										<%-- ${deatil.issuerPhone}--%>
									</td>
								</tr>
								<tr>
									<td>联系方式</td>
									<td colspan="3" class="blue" v-if="grade === '0'"><a
										class='tabs' style="color: red">会员可见</a></td>
									<td colspan="3" class="blue" v-else-if="grade === ''"><a
										class='tabs' style="color: red">会员可见</a></td>
									<td colspan="3" class="blue" v-else><a href="#"></a></td>
								</tr>

								<%-- <tr class='details'>
                                    <td>发布时间</td>
                                    <td>${detail.time}</td>
                                    <td><img src="${skin}front/img/icon_defail_sc.png"></td>
                                    <td><a href="javascript:;" id="collection">收藏</a></td>
                                </tr> 
                                 <tr>
                                    <td style='text-align: center;'>联系方式</td>
                                    	<td colspan="3" class="blue" v-if="grade === '0'"><a class='tabs' style="color:red">会员可见</a></td>
										<td colspan="3" class="blue" v-else-if="grade === ''"><a class='tabs' style="color:red">会员可见</a></td>
										<td colspan="3" class="blue" v-else><a href="#"></a></td>
                                </tr>--%>
							</tbody>
						</table>
						<div class="arc_arc">
							<c:if test="${jw == '.swf'}">
							      <p>不支持falsh,请用电脑登录</p>
							</c:if>
							<c:if test="${jw != '.swf'}">
							       ${detail.contentHtml}
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="affirm">
				<!-- <div>
				     <p>
						<i class="fa fa-eye"></i> 添加专盯
					 </p>
					  <p>
						<i class="fa fa-eye"></i> 已专盯
					</p>
				</div> -->
				<div style="width: 100%;">
					<c:if test="${collectionFlag == false}">
					    <p style="background: #FFF">
							<i class="fa fa-star-o"></i><span> 添加收藏</span>
						</p>
						
					 </c:if>
					<c:if test="${collectionFlag == true}">
						<p>
							<i class="fa fa-star-o"></i><span>已收藏</span>
						</p>
					</c:if>
				</div>
			</div>
			<!-- 非会员弹出框提示 -->
			<div class="mui-backdrop">
				<div class="popover">
					<div id="popover">
						<i class="fa fa-close r"></i>
						<h3>抱歉！</h3>
						<div class="word">您还不是会员请先开通会员后，再申请专盯服务。</div>
						<div class="tip">
							<a href="#">去开通</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}mobile/res/mui/js/mui.min.js"></script>
	<script src="${skin}mobile/js/common.js"></script>
	<script type="text/javascript">
	mui.init({
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
	});
	
	
	
	    mui.init()
	     $("colgroup").remove();
	    /* 添加收藏 */
	    $('.affirm>div:last-child() p:first-child()').on('tap', function () {
	       if('${user.grade}' == '' || '${user.grade}' == null)
	       {
	    	 window.location.href="/m.login.do";   
	       }else
	       {
	    	   collection();
	    	   $('.affirm>div:last-child()').html("<p style='background:#ebebeb'><i class='fa fa-star-o'></i><span>已收藏</span></p>");
	       }
	    })

	    $('.popover i').on('tap', function () 
	    {
	        $('.mui-backdrop').css({
	            "z-index": '9999',
	            "display": 'none'
	        })
	    })
        
        
        //判断是否是会员以及登录状态
       	var userGrade = new Vue({
			el : "#notice_id",
			data : {
				grade : '${user.grade}'
			  }
        });
        
	    
	    
        
        //无会员提示
	   $(".tabs").on("tap",function()
	   {
		   layui.use('layer', function () 
			        { //独立版的layer无需执行这一句
			            var $ = layui.jquery, layer = layui.layer;
			            layer.open({
			              type:2,
			              offset: 'auto',
			              btn: ['知道了'],
			              btnAlign: 'c',
			              resize: false,//禁止拉伸
			              closeBtn: false,
			              content: "/m.reminder.do",
			              end: function () {
			              },
			            })
			          });
		   return false;
    	})
    	
    	//收藏
    	function collection(){
		   var param = {
 					biddingInfoId : '${detail.id}',
 					binddingInfoTitle : '${detail.name}'
         	};
         	$.ajax({
			        type: 'POST',
			        url: '/m.userCollectionAdd.do',
			        data: param,
			        success: function (data)
			        {
			        	if(data == "fail"){
			        		window.location.href="m.login.do";
			        	}
			        	else{
			        		layer.msg(data, {
	                 		    icon: 1,
	                 		   	time: 1000, //1s后自动关闭
	                 		    shade: [0.8, '#393D49'] // 透明度  颜色
	                 		});
			        	}
			        }

			    });
        } 
    </script>
</body>
</html>
