<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>中汇招标----帮助与反馈</title>
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
	<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
	<link rel="stylesheet"
	href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
	<link rel="stylesheet" href="${skin}mobile/css/base.css">
	<link rel="stylesheet" href="${skin}mobile/css/help.css">
</head>

<body>
	<div class="zh_layout">
		<header class="zh_topBar clearfix">
            <a href="javascript:history.back()" class="icon_back fa fa-chevron-left l"></a>
            <span>帮助与反馈</span>
		</header>
		<div class="zh_container">
            <div class="row mui-input-row">
                <textarea class="mui-input-clear question" id="question"  name="content" placeholder="意见反馈"></textarea>
            </div>
            <div class="mui-btn r"  onclick="submit()">提交</div>
		</div>
	</div>
	<script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}mobile/res/mui/js/mui.min.js"></script>
	<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"
		charset="utf-8"></script>
	<script type="text/javascript">
		mui.init()
		
		function submit(){
			var content = document.getElementById("question").value;
			if(content == "" || content == null){
        		layer.msg('内容不能为空', {
         		    icon: 2,
         		    time: 1000, //1s后自动关闭
         		    shade: [0.8, '#393D49'] // 透明度  颜色
         		});
				return;
			}
			var param = {
					content : content
			};
			$.ajax({
				type : 'POST',
				url : '/app.addOpinion.do',
				data : param,
				success : function(data) {
		        	if(data == "succ"){
		        		layer.msg('提交成功，谢谢您的反馈', {
                 		    icon: 1,
                 		   	time: 1000, //1s后自动关闭
                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                 		});
		        		 $("#question").val("");
		        	}else if(data == "fail"){
		        		layer.msg('提交失败', {
                 		    icon: 2,
                 		    time: 1000, //1s后自动关闭
                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                 		});

		        	}else{
		        		layer.msg(JSON.parse(data).msg, {
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