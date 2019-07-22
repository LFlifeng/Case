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
</style>
<body class='layui-layout-body'>
<form class="layui-form">
			  	<div class="layui-form-item">
			    	<label class="layui-form-label">企业资质名称</label>
			    <div class="layui-input-block">
			     	 <input type="text" name="aptitudeName" required  lay-verify="required" placeholder="请输入企业资质名称" autocomplete="off" class="layui-input">
			    </div>
			    </div>
			    <div class="layui-form-item">
			    	  <label class="layui-form-label">图片</label>
			    	  <button type="button" name='picture'class="layui-btn layui-btn-danger" id="test1">点击上传</button>
		              <div class="layui-inline layui-word-aux">上传大小不超过5MB</div>
		              <img class="picture" style="width: 66px;height: 66px;">
		              <input type="hidden" id="picture"lay-verify="required" name="picture">
			    </div>
			    <div class='cl'>
			        <button type="reset" class="layui-btn layui-btn-primary">取消</button>
				    <button lay-submit="" class='layui-btn' lay-filter="demo">提交</button>
	     		</div>
			    </form>
</body>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<script type="text/javascript">
	
	
	//表单提交
    layui.use([ 'form', 'jquery' ], function() 
              {
            	  var form = layui.form, $ = layui.$;
            	  form.on('submit(demo)',function(data)
            	  {
            		  $.ajax({
	        			  url:"/qualification.doAdd.do",
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
    							 localStorage.setItem("buildQyzzSucc",true);
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
			   			    $('.picture').attr('src', result); 	
	      			});
	     	   }
    	    ,done: function(res)
    	    {
   	       		 var id = res.data.src;
   	       		 $("#picture").val(id);
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
	    </script>
</html>