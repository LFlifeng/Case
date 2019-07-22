<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>供应商登陆</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/supplier_login.css">
    <style>
    .forgetPassword{
        padding: 20px 0 25px 0;
     }
    </style>
</head>

<body>
    <div class="mask clearfix">
        <div class="left l">
            <img src="${skin}front/img/loginbg.jpg" alt="">
        </div>
        <div class="right l">
            <div class="title">
                <ul class="clearfix">
                    <li class="l">
                        <a href="#" style="color:#d03e44;">登录</a>
                        <hr>
                    </li>
                    <li class="l">
                        <a href="#">注册</a>
                        <hr style="display:none;">
                    </li>
                </ul>
                <!-- 登录部分 -->
                <form class="layui-form dologinForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <input name="remember" value="false" type="hidden">
                        <input type="text" name="phone" lay-verify="phone" autocomplete="off" placeholder="请输入用户账号"
                            class="layui-input">
                        <p>用户名不正确</p>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <input type="password" name="password" lay-verify="required" autocomplete="off"
                            placeholder="请输入密码" class="layui-input">
                        <p>密码不正确</p>
                    </div>
                    <p class="forgetPassword"><a href="/userQd.foundpwd.do" target="view_window">忘记密码？</a></p>
                    <!-- 保存上传 -->
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="Demo">登录</button>
                        </div>
                    </div>
                </form>
                <!-- 注册部分 -->
                <form class="layui-form" id="formRegister">
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系人</label>
                         <input type="hidden"name="personalOffice" value="3"/>
                        <input type="text" name="contacts" lay-verify="required" autocomplete="off" placeholder="请输入联系人"
                            class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">公司名称</label>
                        <input type="text" name="company" lay-verify="required" autocomplete="off" placeholder="请输入公司名称"
                            class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <input type="password" name="password" lay-verify="required" autocomplete="off"
                            placeholder="请输入密码" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号</label>
                        <input type="tel" id="registerPhone" name="phone" lay-verify="phone" autocomplete="off" placeholder="请输入手机号"
                            class="layui-input">
                        <span onclick="getCode();" id="getCode"  style="width:80px!important;right: 53px;">获取验证</span>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证码</label>
                        <input type="text" name="code" lay-verify="required|code" autocomplete="off" placeholder="请输入验证码"
                            class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                             <input type="radio" name="checkbox" class="layui-btn" id="clause" title="我已阅读并遵守"><a onclick='agreement();'href="javascript:;">《用户协议》</a>
                        </div>
                    </div>
                    <!-- 保存上传 -->
                    <div class="layui-form-item">
                     
                        <!-- 提示验证码接收消息 -->
                        <div id="msg" class="msg"></div>
                        <div class="layui-input-block">
                            <button  class="layui-btn buttonRegister" lay-submit lay-filter="formDemo">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
    <script>
       var checked = false;
        // 点击登录注册事件
        $(".title ul li:first-child").click(function () {
            $(this).children('a').css({
                'color': '#d03e44'
            }).end().siblings().children('a').css({
                'color': ''
            });
            $(this).children('hr').show()
                .end().siblings().children('hr').hide();
            $(".title form:nth-child(2)").show()
                .siblings(".title form:nth-child(3)").hide();
        });
        $(".title ul li:last-child").click(function () {
            $(this).children('a').css({
                'color': '#d03e44'
            }).end().siblings().children('a').css({
                'color': ''
            });
            $(this).children('hr').show()
                .end().siblings().children('hr').hide();
            $(".title form:nth-child(3)").show()
                .siblings(".title form:nth-child(2)").hide();
        });
        
        
        //注册功能
        layui.use([ 'form', 'jquery' ], function(){
        	var form = layui.form, $ = layui.$;
        	form.verify(
					{
						code : function(value, item) 
						{
							if (value.length != 5 ) 
							{
								return '请输入正确验证码';
							}
						}
				     });
        	
        	
        	
        	layui.use('layer', function(){
        	var $ = layui.jquery;
        	  $("body").on('click','i',function(){
        		
        		checked = !checked;
        		$("#clause").prop("checked", checked);

       		    form.render();
        	});
        	})
        	
        	
        	//注册提交
        	  form.on('submit(formDemo)',function(data)
         	  {
        		  if(!checked){
        			  layer.alert("请同意用户协议");
        			  return false;
        		  }
        		$("#msg").html("");
    		    $.ajax({
    		    	url:'userQd.doregister.do',
    		        data:data.field,
    		        type:"POST",
    		        success:function(res){
    		        	if(res == "succ"){
    		        		$("#formRegister :input").val("");
    		        		$(".title li a").eq(0).click();
    		        	}else{
    		        		layer.alert(res);
    		        		
    		        	}
    		        }
    		    	
    		    })
    		    return false;
              })
              
              
              //登录提交
              form.on('submit(Demo)',function(data)
         	  {
            	  $("#loginMsg").html("");
    		     $.ajax({
    		    	url:'userQd.doLogin.do',
    		        data:data.field,
    		        type:"POST",
    		        success:function(res){
    		        	if(res == "succ"){
    		        		 localStorage.setItem("loginType",true);
    		        		 var index = parent.layer.getFrameIndex(window.name);  
    		        		 parent.layer.close(index);//关闭当前页 
    		        	}else{
    		        		layer.alert(res);
    		        	}
    		        }
    		    	
    		    })
    		    return false;
              })
        }) 
        
     var count = 0;
     var isWait = false;
     var t1;
     //获取验证码
     function getCode()
     {
     	 if(isWait)
     	 {
     	 	return;
     	 }
     	 isWait = true;
     	 var phone=$("#registerPhone").val();
     	 if(phone != '' && phone.length == 11)
     	 {
     	 	  $.post("userQd.getCode.do",{phone:phone},function(res)
             {
     	 		layer.alert(res);
                   
             })  
             //倒计时60秒
             count = 60;
         	t1=window.setInterval(showCode, 1000);
            $("#getCode").addClass("yzm"); 
     	 }
     	 else
     	{
     		 isWait = false;
     	}
     }
     //显示验证码失效时间
     function showCode()
     {
     	count = count - 1;
     	if(count==0)
     	{
     		 $("#getCode").removeClass("yzm");
     		  isWait = false;
			  clearInterval(t1);
     		$("#getCode").html("获取验证码");
     	}
     	else
     	{
     		var text = count+"秒后重试";
     		$("#getCode").html(text);
     	}
     } 
     function agreement()
     {
     	 layui.use(['layer','form'], function () 
      	    	  {
      	             var layer = layui.layer;
      	             var form=layui.form;
      	             parent.layer.open({
      	                 title: ['《中汇招标网用户服务条款》'],
      	                 type: 2,
      	                 content: "/userQd.agreement.do",
      	                 offset: 'auto',
      	                 area: ['680px', '600px'],
      	                 shadeClose: true, //开启遮罩关闭
      	                 end: function () 
      	                 {
      	                	      var flag=localStorage.getItem("agreeDeal");
	         	                	  localStorage.removeItem("agreeDeal");
	         	                	   if(flag)
	         	                	   {
	         	                		  $("#clause").prop("checked",true);
	         	                		  form.render();
	         	                	   }
      	                 },
      	               });
      	           });
     }
    </script>
</body>

</html>