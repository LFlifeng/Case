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
<link rel="stylesheet" href="${skin}front/css/detail.css">
<link rel="stylesheet" href="${skin}mobile/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<style>
.zh_content{
  margin-bottom: 50px;
}
.arc_content{
    width:100%;
    margin:0;
    
}
.arc {
	width: 100%;
}

.arc_title {
	font-size: 18px;
}

.arc_time .t {
	font-size: 11px;
}

.arc_time .time {
	width: 90%;
}

.arc_time .time span {
	font-size: 12px;
}

.arc_time .time div {
	font-size: 15px;
	margin : 0 2px;
}

.arc_arc {
	padding: 0px 0px;
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

.arc_arc table {
	margin: 0px;
	table-layout: fixed;
	width: 100% !important;
	white-space: pre-wrap;
}
.arc_arc table tr,.arc_arc table td{
    width: auto !important;
}
.arc_arc table table {
    table-layout: fixed;
    word-break: break-all;
    text-align: left;
    width: 100% !important;
}
.arc_arc table tr td{
    overflow: auto;
    text-overflow: initial;
    white-space: normal;
}
colgroup col:first-child(){
   width:25% important;
}
colgroup col:last-child(){
   width:75% important;
}

</style>
</head>

<body>
	<div class="zh_layout" id='notice_id'>
		<header class="zh_topBar mui-bar mui-bar-nav ">
			<a href="/m.biddProjectInformation.do" class="l"><img
				src="${skin}mobile/img/back.png" alt=""></a> 
		</header>
		<div class="zh_container">
			<div class="mui-scroll-wrapper">
				<div class="arc_content">

					<div class="arc fl" id="bidsdetails">
						<div class="arc_title">${detail.projectName}</div>
						<div class="arc_time">
							<div class="t">
								中汇招标网受业主方委托推荐供应商，符合要求的供应商，我们将其资料提交给业主方供以选择，详情请咨询<i>${systemInfo.servicePhone }</i>
							</div>
							<div class="time clearfix">
								<span>距截止时间还剩</span>
								<div>164</div>
								<span>天</span>
								<div>03</div>
								<span>时</span>
								<div>32</div>
								<span>分</span>
								<div>30</div>
								<span>秒</span>
							</div>
						</div>
						<div class="arc_info"
							v-if="grade!== '' && grade!== '0' && grade!== '1'">
							<a></a> <a href="${detail.attaUrl}">附件下载</a> <a
								href="javascript:;" id="designeds">项目专盯</a> <a
								href="javascript:;" id="collection">收藏</a>
						</div>
						<div class="t_table">
							<table>
								<tr>
									<td>项目编号</td>
									<td>${detail.projectCode}</td>
								</tr>
								<tr>
									<td>招标产品</td>
									<td>
										<%-- ${detail.type} --%>
									</td>
								</tr>
								<tr>
									<td>所属行业</td>
									<td>${detail.industryOne}</td>
								</tr>
								<tr>
									<td>所属地区</td>
									<td>${detail.province}</td>
								</tr>
								<tr>
									<td>联系人</td>
									<td class="blue" v-if="grade === '0'"><a class='tabs'
										style="color: red">会员可见</a></td>
									<td class="blue" v-else-if="grade === ''"><a class='tabs'
										style="color: red">会员可见</a></td>
									<td class="blue" v-else><a href="#"></a></td>
								</tr>
							</table>
							<div class="arc_arc">
								<c:if test="${jw == '.swf'}">
								      <p>不支持falsh,请用电脑登录</p>
								</c:if>
								<c:if test="${jw != '.swf'}">
								       ${detail.content}
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="affirm">
					<div>
					<c:if test="${projectDesigneds == false}">
					    <p style="background: #FFF">
							<i class="fa fa-eye"></i> <span>添加专盯</span>
						 </p>
				    </c:if>
				    <c:if test="${projectDesigneds == true}">
					 	 <p>
							<i class="fa fa-eye"></i> <span>已专盯</span>
						</p>
					</c:if>
					</div>
					<div>
						<c:if test="${collectionFlag == false}">
						    <p  style="background: #FFF">
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
			<div class="mui-backdrop">
				<div class="popover">
					<div id="popover">
						<i class="fa fa-close r"></i>
						<h3>抱歉！</h3>
						<div class="word">您还不是会员请先开通会员后，再申请专盯服务。</div>
						<div class="tip">
							<a href="/m.member.do">去开通</a>
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
        $(function(){
        	 $('.popover i').on('tap', function () 
        			    {
        			        $('.mui-backdrop').css({
        			            "z-index": '9999',
        			            "display": 'none'
        			        })
        			    })
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
     	    
     	    /* 添加专盯 */
	      $('.affirm>div:first-child() p:first-child()').on('tap', function () {
	       if('${user.grade}' == '' || '${user.grade}' == null)
	       {
	    	 window.location.href="/m.login.do";   
	       }else if('${user.grade}' == 0)
	       {
	    	   $('.mui-backdrop').css({
		            "z-index": '10000',
		            "display": 'block'
		        })
	       }else
	       {
	    	   designeds();
	    	   $('.affirm>div:first-child()').html("<p style='background:#ebebeb'><i class='fa fa-eye'></i><span>已专盯</span></p>");
	       }
	     })
        }) 
        var data = '${detail.deadline}'+' 0:0:0';
        var param = {
					biddingInfoId : '${detail.id}',
					binddingInfoTitle : '${detail.projectName}'
      	};
		data = data.replace("-","/");
		data = data.replace("-","/");
        //判断是否是会员以及登录状态
       	var userGrade = new Vue({
			el : "#notice_id",
			data : {
				grade : '${user.grade}'
			  }
        });
    	
    	 function getTime(S, endTime) {
	        // 获取开始时间
	        var start = S;
	        // 获取结束时间
	        var end = E;
	        // 计算时间差（毫秒差）
	        var num = end - start;
	        if(num <= 0)
	        {
	        	return { day:"00", hour: "00", minute: "00", seconds: "00" };
	        }
	        
	        // 换算时间
	        // 天
	        var d = parseInt(num / 1000 / 60 / 60 / 24);
	        d = d < 10 ? '0' + d : d;
	        // 小时
	        var h = parseInt(num / 1000 / 60 / 60 ) - d * 24;
	        h = h < 10 ? '0' + h : h;
	        // 分钟
	        var m = parseInt(num / 1000 / 60 % 60);
	        m = m < 10 ? '0' + m : m;
	        // 秒
	        var s = parseInt(num / 1000 % 60);
	        s = s < 10 ? '0' + s : s;
	        return { day:d, hour: h, minute: m, seconds: s };
	    };
	    var S = new Date();
	    var E = new Date( data);
	    var o = getTime(S, E);
	    var divs = document.querySelectorAll('.arc_time .time div');
	    // 2.把计算好的时间差的时分秒分别赋值给每一个div的内容
	    divs[0].innerText = o.day;
	    divs[1].innerText = o.hour;
	    divs[2].innerText = o.minute;
	    divs[3].innerText = o.seconds;
	    // 3.产生一个定时器
	    var tmp = setInterval(function () {
	        // 3.1重新计算
	        var S = new Date();
	        var E = new Date(data);
	        var o = getTime(S, E);

	        // 3.2重新赋值
	        divs[0].innerText = o.day;
	        divs[1].innerText = o.hour;
	        divs[2].innerText = o.minute;
	        divs[3].innerText = o.seconds;
	        // 3.3到达时间后，停止定时器
	        if (o.day == '00'&&o.hour == '00' && o.minute == '00' && o.seconds == '00')
	        {
	            clearInterval(tmp);
	            
	        }
	    }, 1000);
	    
	  //收藏
		function collection(){
          	$.ajax({
			        type: 'POST',
			        url: '/m.userCollectionAdd.do',
			        data: param,
			        success: function (data)
			        {
		        		layer.msg(data, {
                 		    icon: 1,
                 		   	time: 1000, //1s后自动关闭
                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                 		});
			        }

			    });
		  }
		
		
		
		//项目专盯
		function designeds(){
			$.ajax({
			        type: 'POST',
			        url: '/m.projectDesignedsAdd.do',
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
		
		//附件下载
		function downLoad(fileName,fileUrl){
			var param = {
					fileName : fileName,
					fileUrl : fileUrl
          	};
          	$.ajax({
			        type: 'POST',
			        url: '/attach.download.do',
			        data: param,
			        success: function (data)
			        {
	        		layer.msg(data, {
             		    icon: 1,
             		   	time: 1000, //1s后自动关闭
             		    shade: [0.8, '#393D49'] // 透明度  颜色
             		});
			        }
			    });
		}
    </script>
</body>
</html>
