<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-trackInformation.css">
    
	<style>
		[v-cloak] {
		    display: none;
		}
	</style>
</head>

<body>
    <form class="layui-form" action="">
     	<div class="layui-form-item">
        </div>
        <!-- 跟踪器名称 -->
        <div class="layui-form-item">
            <label class="layui-form-label">跟踪器名称</label>
            <div class="layui-input-block">
                <input type="text" name="trackerName" value="${info.trackerName}" required lay-verify="required" placeholder="输入跟踪器名称" autocomplete="off"
                    class="layui-input">
            </div>
            <input type="hidden" name="id" value="${info.id}">
        </div>
        <!-- 设置关键词 -->
        <div class="layui-form-item">
            <label class="layui-form-label">设置关键字</label>
            <div class="layui-form-mid layui-word-aux">输入您关注的行业关键字，至少填写一个</div>
        </div>
        <!-- 关键词 -->
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-block clearfix">
                <input type="text" name="keywords" value="${fn:length(info.keys)>0?info.keys[0]:''}" required placeholder="关键词一" autocomplete="off"
                    class="layui-input l">
                <input type="text" name="keywords" value="${fn:length(info.keys)>1?info.keys[1]:''}"   placeholder="关键词二" autocomplete="off"
                    class="layui-input l">
                <input type="text" name="keywords" value="${fn:length(info.keys)>2?info.keys[2]:''}"   placeholder="关键词三" autocomplete="off"
                    class="layui-input l">
                <input type="text" name="keywords" value="${fn:length(info.keys)>3?info.keys[3]:''}"   placeholder="关键词四" autocomplete="off"
                    class="layui-input l">
                <input type="text" name="keywords" value="${fn:length(info.keys)>4?info.keys[4]:''}"   placeholder="关键词五" autocomplete="off"
                    class="layui-input l">
            </div>
        </div>
        <!-- 地区选择 -->
        <div class="layui-form-item">
            <label class="layui-form-label">地区选择</label>
            <div id="regions_div_id" class="layui-input-block">
             <%--    <span><a href="#">北京</a><img src="${skin}front/img/close.png" alt=""></span> --%>
               <input id="regions_input_id" type="hidden"  name="regions" >
            </div>
        </div>
        <!-- 地区分类 -->
        <div class="layui-form-item">
            <label for="" class="layui-form-label"></label>
            <div class="layui-input-block clearfix" id="citys" v-cloak>
                <dl class="l"  v-for="area in citys">
                    <dt>
                        <a href="#">{{area.name}}</a>
                        <input type="checkbox" :data-v1="area.name"   lay-skin="primary">
                    </dt>
                    <dd v-for="p in area.list">
                        <a href="#">{{showP(p.name)}}</a>
                        <input type="checkbox" lay-skin="primary"  :data-v1="area.name"  :data-v2="p.name">
                         <div class="city" style="display: none;">
                         	 <div v-for="c in p.list">
                                <a href="#">{{showCity(c.name)}}</a>
                                <input type="checkbox" lay-skin="primary"  :data-v1="area.name"  :data-v2="p.name"  :data-v3="c.name">
                            </div>
                         </div>
                    </dd>
                </dl>
            </div>
        </div>
        <!-- 信息类型 -->
        <div class="layui-form-item">
            <label class="layui-form-label">信息类型</label>
            <div class="layui-input-block">
                <div class="clearfix">
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="招标公告">
                        <a href="#">招标公告</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="招标预告">
                        <a href="#">招标预告</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="变更公告">
                        <a href="#">变更公告</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="中标公告">
                        <a href="#">中标公告</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="采购公告">
                        <a href="#">采购公告</a>
                    </div>
                </div>
                <div class="cleafix">
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="预审公告">
                        <a href="#">预审公告</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="政府采购">
                        <a href="#">政府采购</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="企业采购">
                        <a href="#">企业采购</a>
                    </div>
                    <div class="l">
                        <input type="checkbox" lay-skin="primary" name="infoType" value="中标采购">
                        <a href="#">中标采购</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 搜索模式 -->
        <div class="layui-form-item">
            <label class="layui-form-label">搜索模式</label>
            <div class="layui-input-block">
            	
                <input type="radio" name="searchType" title="模糊搜索" lay-skin="primary" value="1"  <c:if test="${info.searchType==1}">checked="checked"</c:if>>
                <input type="radio" name="searchType" title="精准搜索" lay-skin="primary" value="2" <c:if test="${info.searchType==2}">checked="checked"</c:if>>
            </div>
        </div>
        <!-- 订阅方式 -->
        <div class="layui-form-item">
            <label class="layui-form-label">订阅方式</label>
            <div class="layui-input-block clearfix">
                <div class="l">
                    <input type="checkbox" lay-skin="primary" name="subscribe" value="邮件订阅">
                    <a href="#">邮件订阅</a>
                </div>
                <div class="l">
                    <input type="checkbox" lay-skin="primary" name="subscribe" value="短信订阅">
                    <a href="#">短信订阅</a>
                </div>
                <div class="l">
                    <input type="checkbox" lay-skin="primary" name="subscribe" value="公众号">
                    <a href="#">公众号</a>
                </div>
            </div>
        </div>
        <!-- 保存 -->
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">保存完成</button>
            </div>
       </div>
    </form>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
	    <script>
        var map = new Map();
        var layForm = null;
        function deleteItem(v)
        {
        	var span =  $(v).parent();
        	var id = $(span).attr("id");
        	$(span).remove();
        	$("input[data-v2='"+id+"']").each(function(i,e)
        	{
        		$(e).prop("checked", '');
        	});
        	map.delete(id);
        	layForm.render('checkbox');
        	mapToJson();
        }
        function mapToJson()
        { 
        	var len = map.size;
        	if(len==0)
        	{
        		$("#regions_input_id").val("");
        		return;
        	}	
        	var json ="[";
        	map.forEach(function (value, key, map) 
        	{
        		if(value.size==0)
        		{
        			var j = "{\"p\":\""+key+"\",\"c\":\"\"},";
        			json = json + j;
        		}
        		else
        		{
        			var j ="{\"p\":\""+key+"\",\"c\":\"";
             	    value.forEach(function (element, sameElement, set) 
             	    {
             	        j = j +element+",";
             	    });
             	    j = j.substring(0,j.length-1);
             	    j = j +"\"},"
             	    json = json + j;
        		}
        	});
        	json = json.substring(0,json.length-1);
        	json = json+"]";
        	$("#regions_input_id").val(json);
        }
        var citys = new Vue({
            el: "#citys",
            data:
            {
                citys: []
            },
            methods:
            {
            	 showCity : function (name) 
            	 {
            		if(name.length > 4)
            		{ 
            			name = name.substring(0,4);
            		}
            		return name;
                },
                showP:function (name)
                {
                	if(name.indexOf("内蒙古") != -1)
                	{
                		return "内蒙古";
                	}
                	else if(name.indexOf("黑龙江") != -1)
                	{
                		return "黑龙江";
                	}
                	else 
                	{
                		return name.substring(0,2);
                	}
                },
                loadSuccess : function()
                {
                	  Vue.nextTick(function () 
                      {
                          window.layui.use(['jquery', 'form'], function () 
                          {
                              var $ = layui.$, form = layui.form;
                              layForm = form;
                              
                              form.on('submit(formDemo)', function(data)
                              {
                            	  if(data.field.trackerName.length > 20  )
                            	  {
                            		 layer.msg('跟踪器名称必须小于20位！', {icon: 2,shade: [0.8, '#393D49']});
                           	    	return false;
                            	  }
                            	  var arr = new Array();
                              	  $("input:text[name='keywords']").each(function(i)
                              	   {
                                  	    var key = $(this).val();
                                  	    if(key.length > 20)
                                  	    {
                                  	    	 layer.msg('关键词必须小于20位！', {
                                     		    icon: 2,
                                     		    shade: [0.8, '#393D49'] // 透明度  颜色
                                     		});
                                   	    	return false;
                                  	    }
                                  	    else if(key.length > 0)
                                  	    {
                                  	    	arr[i] = key;	
                                  	    }
                                   });
                                   if(arr.length ==0)
                             	   {
                                	   layer.msg('请输入要订阅的关键词!', {
                                		    icon: 2,
                                		    shade: [0.8, '#393D49'] // 透明度  颜色
                                		});
                             	    	return false;
                             	   }
                                   data.field.keywords = arr.join(",");  
                                   if(data.field.regions.length == 0)
                               	   {
                            			 layer.msg('请选择要检索的地区！', {
                                 		    icon: 2,
                                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                                 		});
                           	    		return false;
                               	   }
                                    arr = new Array();
                              	    $("input:checkbox[name='infoType']:checked").each(function(i){
                                  	    var key = $(this).val();
	                                  	if(key.length > 0)
	                              	    {
	                              	    	arr[i] = key;	
	                              	    }
                                  	});
                               		if(arr.length ==0)
                           	        {
                           	    	 layer.msg('请选择要订阅的信息类型！', {
                             		    icon: 2,
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             		});
                           	    	   return false;
                           	        }
                                  	data.field.infoType = arr.join(",");  
                                	if(data.field.searchType.length == 0)
                                   	{
                                		 layer.msg('请选择搜索类型！', {
                                 		    icon: 2,
                                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                                 		});
                               	    	return false;
                                   	}
                                  	arr = new Array();
                               	    $("input:checkbox[name='subscribe']:checked").each(function(i){
                                   	    var key = $(this).val();
	                                  	if(key.length > 0)
	                              	    {
	                              	    	arr[i] = key;	
	                              	    }
                                   	}); 
                                   	data.field.subscribe = arr.join(",");
                                   	if(arr.length ==0)
                               	    {
                               	     	layer.msg('请选择订阅类型的方式！', {
                             		    icon: 2,
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             			});
                               	    	return false;
                               	    }
                                   	$.ajax({
                                   		type:"post",
                                   		url:'/trackerFront.doEdit.do',
                                   		data:data.field,
                                   		success:function(data)
                                   		{
	                                   		 if('succ' == data)
	                                   		 {
	                                   		   		localStorage.setItem("addOrEditTrackerSuccessKey", true);
		                                   			var index = parent.layer.getFrameIndex(window.name);  
		                                   			setTimeout(function(){parent.layer.close(index)}, 1000);
		                                   			layer.msg('保存成功', {
		                                     		    icon: 1,
		                                     		    shade: [0.8, '#393D49'] // 透明度  颜色
		                                     			}); 
	                                   		  }else
	                                   		  {
	                                   				layer.msg('保存失败，请重新保存', {
                                     		    	icon: 2,
                                     		    	shade: [0.8, '#393D49'] // 透明度  颜色
                                     				});  
	                                   		  }
	                                   		}
                                   		});
                                   		
                            	  	
                            	    return false;
                               });
                              form.on("checkbox", function (obj) 
                              {
                              	var flag = obj.elem.checked;
                              	var v1   = obj.elem.dataset.v1;
                              	var v2   = obj.elem.dataset.v2;
                              	var v3   = obj.elem.dataset.v3;
                              	if(flag)
                              	{
                              		if(v3)
                              		{
                              			var v = v2;
                              			if(v.indexOf("内蒙古") != -1)
                	                	{
                							v =  "内蒙古";
                	                	}
                	                	else if(v.indexOf("黑龙江") != -1)
                	                	{
                	                		v =  "黑龙江";
                	                	}
                	                	else 
                	                	{
                	                		v =  v.substring(0,2);
                	                	}
                              			if(!map.get(v2))
                              			{
                              				$("#regions_div_id").append("<span id='"+v2+"' onclick='deleteItem(this)'><a href='#'>"+v+"<img src='${skin}front/img/close.png' alt='"+v2+"'></a></span>");
                              				var a = new Set();
                              				a.add(v3);
                              				map.set(v2,a);
                              				$('dd > input[data-v2='+v2+']').prop("checked", 'checked');
                              			}
                              		}
                              		else if(v2)
                              		{
                              			var v = v2;
                              			if(v.indexOf("内蒙古") != -1)
                	                	{
                							v =  "内蒙古";
                	                	}
                	                	else if(v.indexOf("黑龙江") != -1)
                	                	{
                	                		v =  "黑龙江";
                	                	}
                	                	else 
                	                	{
                	                		v =  v.substring(0,2);
                	                	}
                              			if(!map.get(v2))
                              			{
                              				$("#regions_div_id").append("<span id='"+v2+"'><a href='#'  onclick='deleteItem(this)'>"+v+"<img src='${skin}front/img/close.png' alt='"+v2+"'></a></span>");
                              				var a = new Set();
                              				map.set(v2,a);
                              			}
                              			var s = map.get(v2);
                              			$('input[data-v2='+v2+']').each(function(i,e)
                              			{
                              				$(e).prop("checked", 'checked')
                              				var cV= $(e).data("v3");
                              				if(cV)
                              				{
                              					s.add(cV);
                              				}
                              			});
                              		}
                              		else if(v1)
                              		{
                              			$('input[data-v1='+v1+']').each(function(i,e)
                              			{
                              				var pV= $(e).data("v2");
                              				if(pV)
                              				{
                              					$(e).prop("checked", 'checked')
                              					var v = pV;
                              					if(v.indexOf("内蒙古") != -1)
                        	                	{
                        							v =  "内蒙古";
                        	                	}
                        	                	else if(v.indexOf("黑龙江") != -1)
                        	                	{
                        	                		v =  "黑龙江";
                        	                	}
                        	                	else 
                        	                	{
                        	                		v =  v.substring(0,2);
                        	                	}
                                      			if(!map.get(pV))
                                      			{
                                      				$("#regions_div_id").append("<span id='"+pV+"'><a href='#'  onclick='deleteItem(this)'>"+v+"<img src='${skin}front/img/close.png' alt='"+pV+"'></a></span>");
                                      				var a = new Set();
                                      				map.set(pV,a);
                                      			}
                                      			else
                                      			{
                                      				var s = map.get(pV);
                                      				var cV= $(e).data("v3");
                                      				if(cV)
                                      				{
                                      					s.add(cV);
                                      				}
                                      			}
                              				}
                              			});
                              		}
                              	}
                              	else
                              	{
                              		if(v3)
                              		{
                              			var array = map.get(v2);
                              			array.delete(v3);
                              			$('input[data-v3='+v3+']').prop("checked", '');
                              		}
                              		else if(v2)
                              		{
                              			map.delete(v2);
                              			$("input[data-v2='"+v2+"']").each(function(i,e)
                              		    {
                              		        $(e).prop("checked", '');
                              		        $("#"+v2).remove();
                              		    });
                              			$('input[data-v2='+v2+']').prop("checked", '');
                              		}
                              		else if(v1)
                              		{
                              			$("input[data-v1='"+v1+"']").each(function(i,e)
                              			{
                              		        $(e).prop("checked", '');
                              		        var pV= $(e).data("v2");
                              		        if(pV)
                              		        {
                              		        	 map.delete(pV);
                              		        	 $("#"+pV).remove();
                              		        }
                              		    });	    
                              		}
                              	}
                              	if(v1 || v2 || v3)
                              	{
                              		form.render("checkbox");
                                  	mapToJson();
                              	}
                              });
                              form.render('checkbox');
                              // 城市显示
                              // 鼠标进入时
                              $('.layui-input-block dl dd>a').mouseenter(function () {
                                  $(this).siblings('.city').show();
                                  $(this).css({
                                      "border": "1px solid #ccc",
                                      "border-right": "none"
                                  });
                                  $(this).siblings('.city').children('div:eq(2)').css({
                                      "border-left": "none"
                                  })
                              });
                              $('.layui-input-block dl dd>.city').mouseenter(function () {
                                  $(this).show();
                                  $(this).siblings('a').css({
                                      "border": "1px solid #ccc",
                                      "border-right": "none"
                                  });
                                  $(this).children('div:eq(2)').css({
                                      "border-left": "none"
                                  })
                              });
                              $('.layui-input-block dl dd>a').mouseleave(function () {
                                  $(this).siblings('.city').hide();
                                  $(this).css({
                                      "border": "none"
                                  });
                              });
                              $('.layui-input-block dl dd>.city').mouseleave(function () {
                                  $(this).hide();
                                  $(this).siblings('a').css({
                                      "border": "none"
                                  });
                              });
                              $('.layui-input-block dl:first-child dd:nth-child(2)>a,.layui-input-block dl:first-child dd:nth-child(3)>a').mouseenter(function () {
                                  $(this).css({
                                      "border": "none"
                                  });
                              });
                              $('.layui-input-block dl:nth-child(3) dd:nth-child(2)>a,.layui-input-block dl:last-child dd:nth-child(2)>a').mouseenter(function () {
                                  $(this).css({
                                      "border": "none"
                                  });
                              });
                          });
                      });
                },
				 initView :function()
				 {
				 	var infoTypeStr = '${info.infoType}';
	                $('input:checkbox[name="infoType"]').each(function(i,e)
	                {
	                	var type = $(e).val();
	                	if(infoTypeStr.indexOf(type)!=-1)
	                	{
	                		$(e).prop("checked", 'checked');
	                	}
	                });
	                var subscribeStr = '${info.subscribe}';
					$('input:checkbox[name="subscribe"]').each(function(i,e){
	                	
						var type = $(e).val();
	                	if(subscribeStr.indexOf(type) != -1)
	                	{
	                		$(e).prop("checked", 'checked');
	                	}
	                });
					var regions = '${info.regions}';
					regions = JSON.parse(regions);

					for(var i=0;i<regions.length;i++)
					{
						var item = regions[i];
						var array = item.c.split(",");
						var name =item.p;
						if(name.indexOf("内蒙古") != -1)
	                	{
							name =  "内蒙古";
	                	}
	                	else if(name.indexOf("黑龙江") != -1)
	                	{
	                		name =  "黑龙江";
	                	}
	                	else 
	                	{
	                		name =  name.substring(0,2);
	                	}
						$("#regions_div_id").append("<span id='"+item.p+"' onclick='deleteItem(this)'><a href='#'>"+name+"<img src='${skin}front/img/close.png' alt='"+item.p+"'></a></span>");
						var a = new Set();
          				map.set(item.p,a);
						
						if(array.length==1 && array[0]=='')
						{
							$('dd > input[data-v2='+item.p+']').each(function(p,e)
						    {
								$(e).prop("checked", 'checked')
							});
						}	
						else
						{
							$('dd > input[data-v2='+item.p+']').each(function(p,e)
						    {
								$(e).prop("checked", 'checked')
							});
							for(var j=0;j<array.length;j++)
							{
								a.add(array[j]);
								$('input[data-v3='+array[j]+']').each(function(p,e)
							    {
									$(e).prop("checked", 'checked')
								});
							}
						}
					}
					mapToJson();
					layForm.render('checkbox');
					
			 	}
             },
            created: function () 
            {
                var self = this;
                var res = localStorage.getItem("areaCityKey");
                if (res)
                {
                    self.citys = JSON.parse(res);
                    self.$options.methods.loadSuccess();
                    setTimeout(function(){
                    	self.$options.methods.initView();
                    }, 500);
                }
                else {
                    $.ajax({
                        url: '/sysCity.areaCity.do',
                        type: 'post'
                    }).then(function (res) 
                    {
                        self.citys = JSON.parse(res);
                        localStorage.setItem("areaCityKey", res)
                        self.$options.methods.loadSuccess();
                        setTimeout(function(){
                        	self.$options.methods.initView();
                        }, 500);
                        
                    }).fail(function () { });
                }
            }
        });
    </script>
</body>

</html>
