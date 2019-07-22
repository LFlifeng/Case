<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申请入驻</title>
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-application.css">
</head>
<style>
  form{
		text-align: left;
	    left: 71px;
	    top: 56px;
	    position: relative
      }
      .cl{
            left: 136px;
    		top: 25px;
  		    position: relative;
        }
    .layui-anim{
	    width: 190px!important;
	    top: 38px!important;
	    left: 1px!important;
	    height: 185px!important
	    }
</style>
<body class='layui-layout-body'>
<form class="layui-form">
			  	<div class="layui-form-item">
			    	<label class="layui-form-label">经营年限</label>
			    <div class="layui-input-block">
			     	 <input id='operations'type="text" name="operations" required  lay-verify="required|operations" placeholder="请输入经营年限" autocomplete="off" class="layui-input">
			    </div>
			    </div>
			    <div class="layui-form-item">
			    	<label class="layui-form-label">主营产品</label>
			    <div class="layui-input-block">
			        <input type="text" name="product" required  lay-verify="required" placeholder="请输入主营产品且多个用，分开" autocomplete="off" class="layui-input">
			    </div>
			    </div>
			    <div class="layui-form-item">
			    <label class="layui-form-label">所属行业</label>
                <div class="layui-input-inline">
                <select name="industry" id="industryOne" lay-verify="required" lay-filter="industryOneFilter">
                  <option></option>
                </select>
			    </div>
			    </div>
			    <div class="layui-form-item">
			    	<label class="layui-form-label">销售额</label>
			    <div class="layui-input-block">
			      <input type="text" name="sale" required  lay-verify="required|sale" placeholder="请输入销售额" autocomplete="off" class="layui-input">
			    </div>
			    </div>
			    <div class='cl'>
			        <button type="reset" class="layui-btn layui-btn-primary">取消</button>
				    <button lay-submit="" class='layui-btn' lay-filter="demo">确认</button>
	     		</div>
			    </form>
</body>
	<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
	<script type="text/javascript">
	       
	
	        
	       $(function(){
	    	   hangyeMessage();
	       })
	       
	        /*获取行业信息*/
	       function hangyeMessage(){
		        	var data=localStorage.getItem('hangye');
		        	if(data == null)
		        	{
		        		$.post('industry.getChildren.do',{id:0},function(data)
			    		{
       			           localStorage.setItem('hangye',data);
       			           addHangYe(JSON.parse(data));
			    		 })
		        	}else
		        	{
		        		addHangYe(JSON.parse(data));
		        	}
		        }
	        
	        
	          /*动态添加行业*/
		       function addHangYe(data)
		        {
		    	   $.each(data,function(index,item)
		    	   {
 						$('#industryOne').append(new Option(item.title,item.id));
 						 layui.form.render("select");
   				   })
		        }
	          
	          
	        layui.use([ 'form', 'jquery' ], function() 
			{
		        /*表单验证*/
				var form = layui.form, $ = layui.$;
						
					form.verify(
					{
					    sale :[/^(\+)?\d+(\.\d+)?$/,'请输入正确格式销售额']
				     });
			});
	        
	        
		     /*日期设置*/
		    layui.use('laydate', function () 
		    {
		        var laydate = layui.laydate;
		        laydate.render(
		 	    {
		            elem: '#operations',
		            type: 'year'
		        })
		 	});
		     
		     
		  //表单提交
		    layui.use([ 'form', 'jquery' ], function() 
		              {
		            	  var form = layui.form, $ = layui.$;
		            	  form.on('submit(demo)',function(data)
		            	  {
		            		  $.ajax({
	    	        			  url:"/manageCondition.doAdd.do",
	    	        			  data:data.field,
	    	        			  type:"POST",
	    	        			  success:function(res)
	    	        			  {
		    						 if(res=="succ")
		    			             {
		    							 layer.msg('保存成功', {
	                              		    icon: 1,
	                              		    shade: [0.8, '#393D49'] // 透明度  颜色
	                              			});
		    							 //添加状态
		    							 localStorage.setItem("buildJyzzSucc",true);
		    							 var index = parent.layer.getFrameIndex(window.name);  
		    							 parent.layer.close(index);//关闭当前页 
		    		                        
		    		                    }else if(res=="fail")
		    		                    {
		    		                    	layer.msg('保存失败，请重新保存', {
	                             		    	icon: 2,
	                             		    	shade: [0.8, '#393D49'] // 透明度  颜色
	                             				});
		    		                    } 
		    		                    else
		    						    {
		    						    	layer.msg(res, {
	                             		    	icon: 2,
	                             		    	shade: [0.8, '#393D49'] // 透明度  颜色
	                             				});
		    						    }
	            			  	}
	            		 	 })
		                			   
				            return false;
		            	  })
		              })
	</script>
</html>