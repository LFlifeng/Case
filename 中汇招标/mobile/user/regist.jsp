<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>中汇招标----注册</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/regist.css">
	<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
	<style>
	.yzm{
   	  color:#CDCDCD!important;
	}
	.msg{
	    height: 1px;
	    margin-top: 11px;
	    display: inherit;
	    text-align: center;
	    color: red;
	}
	</style>
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="/m.login.do" class="icon_back fa fa-times l"></a>
            <span>注册</span>
        </header>
        <div class="zh_container">
            <div class="login">
                <h3>立即注册</h3>
                <div class="pwd">
                    <input id="phone" type="tel" placeholder="请输入手机号">
                    <a href="script:;" id='yzm'>获取验证码</a>
                </div>
                <div class="pwd">
                    <input id='password' type="password" placeholder="请输入密码">
                </div>
                 <div class="pwd">
                    <input id="code" type="number" placeholder="请输入验证码">
                </div>
                <span id="msg" class="msg"></span>
                <a href="javascript:;" class="login_login submit">注册</a>
                <p>
                    <input id="clause" type="checkbox">阅读并同意<a id='read' href="javascript:;">《中汇招标网用户协议》</a>
                </p>
                <p style="display:none">
                    <span></span>
                    <i>第三方登录</i>
                    <span></span>
                </p>
            </div>
        </div>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script type="text/javascript">
    mui.init();
    $(document).keyup(function(event){
		  if(event.keyCode ==13){
		    $(".submit").trigger("tap");
		  }
		});
    /* 点击阅读协议 */
    $("#read").on("tap",function()
   	{
	    		 layer.open({
	    			  type:2,
	    			  offset: 'auto',
	    			  CloseDiv:true,
	    			  area: ['350px', '500px'],
	    			  content: '/m.agreement.do',
	    			  shadeClose: true,//开启遮罩关闭
	                  end: function () 
	                  {
	                	      var flag=localStorage.getItem("agreeDeal");
	   	                	  localStorage.removeItem("agreeDeal");
	   	                	   if(flag)
	   	                	   {
	   	                		  $("#clause").prop("checked",true);
	   	                	   }
	                  }
	    			});
	    		 return false;
     })
        
    	
    	
    	
        /* 获取验证码 */
        var count = 0;          //验证码剩余秒数
        var isWait = false;
        var t1;                 //定时事件
        $("#yzm").on("tap",function(){
        {
        	 if(isWait)
        	 {
        	 	return;
        	 }
        	 isWait = true;
        	 var phone=$("#phone").val().trim();
        	 
        	 if(phone != '' && phone.length == 11)
        	 {
	        	   $.post("userQd.getCode.do",{phone:phone},function(res)
	                {
	                      $("#yzm").html(res);
	                })  
	                //倒计时60秒
	                count = 60;
	            	t1=window.setInterval(function(){
	            		 //显示验证码失效时间
	            		count = count - 1;
	                	if(count==0)
	                	{
	                		 $("#yzm").removeClass("yzm");
	                		isWait = false;
	        				clearInterval(t1);
	                		$("#yzm").html("获取验证码");
	                	}
	                	else
	                	{
	                		var text = count+"秒后重试";
	                		$("#yzm").html(text);
	                	}
            	    }, 1000);
                    $("#yzm").addClass("yzm");
        	 }
        	 else
        	 {
        		 isWait = false;
        		 $("#msg").html("请输入正确的手机号")
        	 }
        }})
        
        
        /* 注册功能 */
        $(".login_login").on("tap",function(){
	        	//判断是否勾选了协议
	        var phone=$("#phone").val();
        	var code=$("#code").val();
        	var password=$("#password").val();
	        if (phone.trim().length < 11 ||  phone.trim().length > 13) 
            {
         	   if (null == phone || "" == phone) 
                {
    			    $("#msg").html("请您输入手机号")
    			    return;
               }else{
             	  $("#msg").html("请输入正确手机号")
             	  return;
               } 
            }
            if (password.trim().length < 6) 
            {
         	   if (null == password || "" == password) 
                {
    			    $("#msg").html("请您输入密码")
    			    return;
               }else{
             	  $("#msg").html("请输入超过6位的密码")
             	  return;
               } 
            }
            if (code.trim().length != 5) 
            {
         	   if (null == code.trim() || "" == code.trim()) 
                {
    			    $("#msg").html("请您输入验证码")
    			    return;
               }else{
             	$("#msg").html("请输入正确的验证码")
   			    return; 
               } 
            }
	        	 if($("#clause").prop("checked")){
	        		 $.ajax({
	        			 url:'m.doregister.do',
	        			 data:{
	        				 phone:phone,
	        				 code:code,
	        				 password:password
	        			 },
	                     type:"POST",
	                     success:function(res){
	                    	 if(res == "succ"){
	                    		window.location.href="/m.succRegister.do"; 
	                    	 }else{
	                    		 $("#msg").html(res);
	                    		 return;
	                    	 }
	                    	 
	                     }
	        		 })
	        	 }else{
	        		 $("#msg").html("请阅读并同意协议")
	        	 }
        })
        
        
    </script>
</body>

</html>