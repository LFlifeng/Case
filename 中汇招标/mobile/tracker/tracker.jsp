<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>中汇招标----跟踪器</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/mui/css/mui.picker.css">
    <link rel="stylesheet" href="${skin}mobile/res/mui/css/mui.poppicker.css">
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/tracker.css">
</head>

<body>
    <div class="zh_layout" id="tracker">
        <header class="zh_topBar mui-bar mui-bar-nav ">
            <a href="m.trackerList.do" class="l"><img src="${skin}mobile/img/back.png" alt=""></a>
            <span>跟踪器</span>
            <a href="#" class="r save"  @tap="submit">保存</a>
        </header>
        <div class="zh_container">
            <div class="mui-scroll-wrapper">
                <div class="mui-scroll">
                    <div class="zh_content">
                        <ul class="mui-table-view alone">
                            <p>跟踪器名称</p>
                            <li class="mui-table-view-cell keys clearfix">
                                <input class="word l" id="trackerName"  placeholder="请编辑名称" ></input>
   
                            </li>
                        </ul>
                        <ul class="mui-table-view">
                            <div class="clearfix">
                                <p class="l">关键词设置（最多5组）</p>
                            </div>
                            <li class="mui-table-view-cell keys clearfix">
                                <input class="word l"  id="keywords1"  placeholder="关键词一"></input>
                   
                            </li>
                            <li class="mui-table-view-cell keys clearfix">
                                <input class="word l" id="keywords2"  placeholder="关键词二"></input>
                         
                            </li>
                            <li class="mui-table-view-cell keys clearfix">
                                <input class="word l" id="keywords3"  placeholder="关键词三"></input>
                      
                            </li>
                            <li class="mui-table-view-cell keys clearfix">
                                <input class="word l"  id="keywords4" placeholder="关键词四"></input>
     
                            </li>
                            <li class="mui-table-view-cell keys clearfix">
                                <input class="word l"  id="keywords5" placeholder="关键词五"></input>
        
                            </li>

                        </ul>

                        <ul class="mui-table-view">
                            <div class="clearfix">
                                <p class="l">信息类型</p>
                            </div>
                            <div class="type">
                                <p >招标公告</p>
                                <p>预审公告</p>
                                <p>变更公告</p>
                            </div>
                            <div class="type">
                                <p>中标公告</p>
                                <p>政府招标</p>
                                <p>企业招标</p>
                            </div>
                             <div class="type">
                                <p>采购公告</p>
                                <p>中标采购</p>
                                <p>企业采购</p>
                            </div>
                            <div class="type">
                                <p>合同采购</p>
                                <p>政府采购</p>
                                <p>终止公告</p>
                            </div>
                           <div class="type">
                                <p>结果公告</p>
                                <p>合同公告</p>
                                <p>延期公告</p>
                            </div>
                            <div class="type">
                                <p>废标/流标公告</p>
                                <p>其他公告</p>
                            </div>
                        </ul>
                        <ul class="mui-table-view">
                            <div class="clearfix">
                                <p class="l">订阅方式</p>
                            </div>
                            <div class="subscribe"  >
                                <p>邮件订阅</p>
                                <p>短信订阅</p>
                                <p>公众号</p>
                            </div>
                        </ul>
                        <ul class="mui-table-view add">
                            <div class="clearfix" >
                                <p class="l">选择地区</p>
                                <p class="r addA"  @tap="addCity">+添加</p>
                                <input id="regions_input_id" type="hidden"  name="regions" value="">
                            </div>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        </div>
        <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
        <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
        <script src="${skin}mobile/res/mui/js/mui.picker.js"></script>
        <script src="${skin}mobile/res/mui/js/mui.poppicker.js"></script>
        <script src="${skin}mobile/js/common.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
        <script type="text/javascript">
        	//地区集合
        	var map = new Map();

        	var tracker = new Vue({
        		el:"#tracker",
        		data:{
        			city:[
       				 	 { value: '全国', text: '全国' },
        				 { value: '安徽省', text: '安徽省' },
        				 { value: '北京市', text: '北京市' },
        				 { value: '福建省', text: '福建省' },
        				 { value: '甘肃省', text: '甘肃省' },
        				 { value: '贵州省', text: '贵州省' },
        				 { value: '广西壮族自治区', text: '广西壮族自治区' },
        				 { value: '广东省', text: '广东省' },
        				 { value: '海南省', text: '海南省' },
        				 { value: '湖南省', text: '湖南省' },
        				 { value: '湖北省', text: '湖北省' },
        				 { value: '河南省', text: '河南省' },
        				 { value: '黑龙江省', text: '黑龙江省' },
        				 { value: '河北省', text: '河北省' },
        				 { value: '江西省', text: '江西省' },
        				 { value: '江苏省', text: '江苏省' },
        				 { value: '吉林省', text: '吉林省' },
        				 { value: '辽宁省', text: '辽宁省' },
        				 { value: '宁夏回族自治区', text: '宁夏回族自治区' },
        				 { value: '内蒙古自治区', text: '内蒙古自治区' },
        				 { value: '青海省', text: '青海省' },
        				 { value: '陕西省', text: '陕西省' },
        				 { value: '四川省', text: '四川省' },
        				 { value: '山东省', text: '山东省' },
        				 { value: '上海市', text: '上海市' },
        				 { value: '山西省', text: '山西省' },
        				 { value: '台湾省', text: '台湾省' },
        				 { value: '天津市', text: '天津市' },
        				 { value: '新疆维吾尔自治区', text: '新疆维吾尔自治区' },
        				 { value: '西藏自治区', text: '西藏自治区' },
        				 { value: '云南省', text: '云南省' },
        				 { value: '重庆市', text: '重庆市' },
        				 { value: '浙江省', text: '浙江省' }
                    ]
        		},
        		mounted:function(){

        			this.addCity;
        		},
        		created:function(){
        			this.addCity;
        		},
        		methods:{
        			addCity:function(){
        				 //添加地区
       	                var picker = new mui.PopPicker();
       	                picker.setData(tracker.city);
       	                picker.show(function (selectItems) {     
       	                	var value = selectItems[0].text;
       	                	if($("#"+value).length == 0 && $("#全国").length == 0) {
       	                		if(value == '全国' && $('.add li').length > 0){
           	                		mui.toast('已选择');
           	                		return false;
       	                		}
	       	                	 $('.add').append("<li class='mui-table-view-cell clearfix address'  id='"+value+"'>"
	            	                        +"<div class='ad l'>"+value+"</div>"
	            	                        +"<button class='del r'  style='border:none;border:none;position: relative;left: 13px;'  onclick='del("+value+")'  >"+"删除"+"</button>"
	            	                        +"</li>");
	            	       	        map.set(value,value);
	            	       	     	mui.toast('添加成功');
       	                	}else{
       	                		mui.toast('已选择');
       	                		return false;
       	                	}
       	                });
       	                
        	         this.addCity;
        			},
        			submit:function(){
        	            // 保存功能
        	                   						
       					mapToJson();
       				
        	       		var trackerName = $('#trackerName').val();
       					var keywords = [];
       					var city = $('#regions_input_id').val();
       		        	//招标类型数组
       		            var types = [];
       		        	//订阅类型数组
       		        	var subscribe =[];
       					var keywords1 = $('#keywords1').val();
       					if(keywords1 !='' && keywords1!='关键词一'){
       						keywords.push(keywords1);
       					}
       					var keywords2 = $('#keywords2').val();
       					if(keywords2 !='' && keywords2!='关键词二'){
       						keywords.push(keywords2);
       					}
       					var keywords3 = $('#keywords3').val();
       					if(keywords3 !='' && keywords3!='关键词三'){
       						keywords.push(keywords3);
       					}
       					var keywords4 = $('#keywords4').val();
       					if(keywords4 !='' && keywords4!='关键词四'){
       						keywords.push(keywords4);
       					}
       					var keywords5 = $('#keywords5').val();
       					if(keywords5 !='' && keywords5!='关键词五'){
       						keywords.push(keywords5);
       					}
       					keywords = keywords.toString();
       					
       				    //订阅类型赋值
					   $.each($(".subscribe p.active_type"),function(item)
						{
						   subscribe.push($(this).text())			   
						})

       					subscribe = subscribe.toString();
       					//招标类型赋值
					   $.each($(".type p.active"),function(item)
						{
						   types.push($(this).text())			   
						})

						types = types.toString();
       	                if (trackerName== '' || trackerName == '请编辑名称'){
   	                 		mui.toast('追踪器名称不能为空');
   	                 		return false;
       	                }
       	                if (keywords== ''){
	                 		mui.toast('关键字不能为空');
	                 		return false;
    	                }
	       	            if (city== ''){
	                 		mui.toast('地区不能为空');
	                 		return false;
	 	                }
       	                if (subscribe== ''){
	                 		mui.toast('订阅类型不能为空');
	                 		return false;
    	                }
       	                if (types== ''){
	                 		mui.toast('招标类型不能为空');
	                 		return false;
    	                }
       	               if(city.indexOf("全国") != -1){
       	            	   city ='[{"p":"北京市","c":""},{"p":"天津市","c":""},{"p":"河北省","c":""},{"p":"山西省","c":""},{"p":"内蒙古自治区","c":""},{"p":"辽宁省","c":""},{"p":"吉林省","c":""},{"p":"黑龙江省","c":""},{"p":"上海市","c":""},{"p":"江苏省","c":""},{"p":"浙江省","c":""},{"p":"安徽省","c":""},{"p":"福建省","c":""},{"p":"江西省","c":""},{"p":"山东省","c":""},{"p":"河南省","c":""},{"p":"湖北省","c":""},{"p":"湖南省","c":""},{"p":"广东省","c":""},{"p":"广西壮族自治区","c":""},{"p":"海南省","c":""},{"p":"重庆市","c":""},{"p":"四川省","c":""},{"p":"贵州省","c":""},{"p":"云南省","c":""},{"p":"西藏自治区","c":""},{"p":"陕西省","c":""},{"p":"甘肃省","c":""},{"p":"青海省","c":""},{"p":"宁夏回族自治区","c":""},{"p":"新疆维吾尔自治区","c":""},{"p":"台湾省","c":""}]';
       	               }
       	     			var param = {
       	     				trackerName :trackerName,
       	     				keywords :keywords,
       	     				regions : city,
       	     				subscribe : subscribe,
       	     				types : types
       	     			};
       	     			$.ajax({
       	     				type : 'POST',
       	     				url : '/trackerMobile.doAdd.do',
       	     				data : param,
       	     				success : function(data) {
       	     					if(data == 'succ'){
       	     						mui.toast('保存成功',{duration:'long'});
	       	     					 setTimeout
	       	     					 (
	       	     					 	function () 
	       	     					 	{
	       	                          		window.location.href="m.trackerList.do";
	       	                      		}, 2000
	       	                      	 );
       	     					}else if(data == 'fail'){
       	     						mui.toast('保存失败');
       	     					}else{
       	     						mui.toast(data);
       	     					}			
       	     				}
       	     			});
        			},
				}

        	});
        	
/*         	//编辑功能
        	$('.keys').on('tap', '.edit', function (evevt) {
                var word = $(this).prev();
                mui.prompt(' ', ' ', '编辑', ['取消', '确定'], function (e) {
                    if (e.index == 1 && e.value != '') {
      
                        word.text(e.value);
                        mui.toast('编辑成功');
                    } else if(e.value == ''){
                        mui.toast('内容不能为空');
                    } else {
                    	mui.toast('编辑失败');
                    }

                })
    	     }) */
    	     
    	    //订阅类型复选事件
			$(".subscribe p").on("tap",function()
			{
				if($(this).hasClass("active_type")){
					$(this).removeClass("active_type");
				}else{
					$(this).addClass("active_type");
				}
			})
			  
			
			//招标类型复选事件
			$(".type p").on("tap",function()
			{
				if($(this).hasClass("active")){
					$(this).removeClass("active");
				}else{
					$(this).addClass("active");
				}
			})

	 		//删除功能  事件委托方式
    	    function del(city){
        		var id = city.id;
                mui.confirm('忍心删除？', ' 温馨提示', ['否', '是'], function (e) {
                    if (e.index == 1) {
                        $("#"+id ).remove();
                        map.delete(id);
                        mui.toast('删除成功');
                    } else {
                        mui.toast('删除失败');
                    }
                });
        	}
			 mui.init();
       
			 //把地区的map转成json
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
		        			var j = "{\"p\":\""+key+"\",\"c\":\"\"},";
		        			json = json + j;		     
		        	});
		        	json = json.substring(0,json.length-1);
		        	json = json+"]";
		        	$("#regions_input_id").val(json);
		        }
     
        </script>
</body>

</html>