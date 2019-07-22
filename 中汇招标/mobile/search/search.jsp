<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
<title>中汇招标----搜索</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="shortcut icon" href="${skin}mobile/favicon.ico"
	type="image/x-icon">
<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${skin}mobile/css/base.css">
<link rel="stylesheet" href="${skin}mobile/css/search.css">
<style>
[v-cloak] {
	display: none;
}
</style>
</head>
<body>
	<div class="zh_layout">
		<header class="zh_topBar mui-bar mui-bar-nav">
			<a href="/m.index.do"><img src="${skin}mobile/img/back.png"
				alt=""></a> <input id="keyWord" type="text"
				placeholder="请输入名称或关键字"> <a class='KeySearch'>搜索</a>
		</header>
		<div class="zh_container">
			<!-- 条件筛选 -->
			<div class="tabs">
				<ul>
					<li class="active" id="1"><a href="#">时间</a> <i
						class="fa fa-caret-down"></i> <i class="fa fa-caret-up"></i></li>
					<li id="2"><a href="#">类型</a> <i class="fa fa-caret-down"></i>
						<i class="fa fa-caret-up"></i></li>
					<li id="3"><a href="#">地区</a> <i class="fa fa-caret-down"></i>
						<i class="fa fa-caret-up"></i></li>
				</ul>
				<div class="tab active">
					<div class="time">
						<p class="SearchRecentEvent  active">近一周</p>
						<p class="SearchRecentEvent" id='recentlyOneWeek'>近一月</p>
						<p class="SearchRecentEvent" id="recentlyOneMonth">近三月</p>
						<p class="SearchRecentEvent" id="recentlySixMonth">近半年</p>
					</div>
				</div>
				<div class="tab">
					<div class="type">
						<p class="active" value="">全部</p>
						<p value="招标公告">招标公告</p>
						<p value="预审公告">预审公告</p>
					</div>
					<div class="type">
						<p value>变更公告</p>
						<p value="中标公告">中标公告</p>
						<p value="政府招标">政府招标</p>
					</div>
					<div class="type">
						<p value="企业招标">企业招标</p>
						<p value="采购公告">采购公告</p>
						<p value="中标采购">中标采购</p>
					</div>
					<div class="type">
						<p value="企业采购">企业采购</p>
						<p value="合同采购">合同采购</p>
						<p value="政府采购">政府采购</p>
					</div>
					<div class="type">
						<p value="废标/流标公告">废标/流标公告</p>
						<p value="结果公告">结果公告</p>
						<p value="合同公告">合同公告</p>
					</div>
					<div class="type">
						<p value="延期公告">延期公告</p>
						<p value="终止公告">终止公告</p>
						<p value="其他公告">其他公告</p>
					</div>
				</div>
				<div class="tab">
					<div class="address_slide clearfix">
						<div id="wrapper">
							<ul class="province l" id="province" ontouchstart="loaded()"
								v-cloak>
								<li v-bind:id="province.id" v-for="province in provinceList"
									@touchstart="toCounty(province.id,province.regionName)">{{showP(province.regionName)}}</li>
							</ul>
						</div>
						<div id="wrapper1">
							<ul class="city l" id="country" onclick="loaded()">
								<li class="c_city active">
									<div class="mui-input-row mui-checkbox" :data-v1='provinceName'
										:data-v2='country.regionName' v-for="country in countryList"
										:id='country.id'>
										{{country.regionName}} <input name="checkbox1" value="Item 1"
											type="checkbox" @tap="selectAll(country.id)">
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="affirm">
						<div class="reset">
							<a href="#-2">重置</a>
						</div>
						<div class="KeySearch">确定</div>
					</div>
				</div>
			</div>

			<div class="info_title">
				找到相关信息<span></span>条
			</div>
			<div class="mui-scroll-wrapper" id="mui-scroll-wrapper">
				<div class="mui-scroll">
					<!-- 相关信息 -->
					<div class="info" id='hotRecommended' v-cloak>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell"
								v-for="hotRecommended in hotRecommendedList">
								<div class="mui-media-body">
									<a :href="'bidsMobile.details.do?id=' +hotRecommended.id">
										{{hotRecommended.name}}
										<div class="item_flex">
											<div class="flex">
												<i><img src="${skin}mobile/img/icon6.png"></i>{{hotRecommended.province}}
											</div>
											<div class="flex">
												<i><img src="${skin}mobile/img/icon7.png"></i>{{hotRecommended.type}}
											</div>
											<div class="flex">
												<i><img src="${skin}mobile/img/icon8.png"></i>{{hotRecommended.time}}
											</div>
										</div>
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
		<script src="${skin}js/layui/layui.js"></script>
		<script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
		<script src="${skin}mobile/res/mui/js/mui.min.js"></script>
		<script src="${skin}mobile/js/iscroll.js"></script>
		<script src="${skin}mobile/js/common.js"></script>
		<script type="text/javascript">
    var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    $(".affirm").css({
        'top': h-40 + 'px'
    })
    $('.address_slide .province,.address_slide .city').css({
        'height': h-118 + 'px !important' 
    })
    $('.address_slide .city li>div').css({
        'width': w-110 + 'px'
    })
    //局部区域滚动
        var myScroll,myScroll1;
        function loaded() {
            myScroll = new IScroll("#wrapper",{
                hScrollbar:false,//禁止横向滚动
                vScroll:true,//为true时允许y轴滚动
                bounce:false,//当滚动器到达容器边界时他将执行一个小反弹动画。在老的或者性能低的设备上禁用反弹对实现平滑的滚动有帮助
                click:false, //如果你想你的应用程序响应click事件，那么该设置次属性为true
                hideScrollbar: true //是否隐藏滚动条  
            });
           myScroll1 = new IScroll("#wrapper1",{
                hScrollbar:false,//禁止横向滚动
                vScroll:true,//为true时允许y轴滚动
                bounce:false,//当滚动器到达容器边界时他将执行一个小反弹动画。在老的或者性能低的设备上禁用反弹对实现平滑的滚动有帮助
                click:true, //如果你想你的应用程序响应click事件，那么该设置次属性为true
                hideScrollbar: true //是否隐藏滚动条  
            });
           myScroll.on('scrollEnd', function (e) {
               var y = this.y - 618;
               if (this.maxScrollY > y && (this.directionY === 1)) {
                   this.scrollTo(0, this.maxScrollY + (h - 125), 0, IScroll.utils.ease.elastic)
               }
           });
           myScroll1.on('scrollEnd', function (e) {
               var y = this.y - 618;
               if (this.maxScrollY > y && (this.directionY === 1)) {
                   this.scrollTo(0, this.maxScrollY + (h - 460), 0, IScroll.utils.ease.elastic)
               }
           });
        }
       /*  document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false); */
        window.addEventListener("load",loaded,false);
    $('.tabs .tab:nth-child(4) .affirm>div:nth-child(2)').on('tap', function () {
        $(this).parent().parent().removeClass('active');
        $(this).parent().parent().siblings('ul').children('li').removeClass('active');
        $('.info').show();
    })
    $('.tabs>ul #3').on('tap',function(){
        $('.info').hide();
    })
    $(".tabs>ul>li:not('#3')").on('tap',function(){
        $('.info').show();
    })
    // 条件筛选
    // 1. 获取一组li
    var lis = document.querySelectorAll('.zh_container .tabs>ul>li');
    // 2. 获取一组div显示项
    var divs = document.querySelectorAll('.tab');
    // 3. for循环遍历给每一个li注册一个点击事件，给每一个li添加一个index属性，表示li的下标
    for (var i = 0; i < lis.length; i++) {
        // 3.1 给每一个li添加一个index属性
        lis[i].index = i;
        // 3.2 注册事件
        lis[i].addEventListener('tap', function () {
            // 4. 在事件处理程序中，① 切换li  ② 切换div
            // 4.1 循环遍历去掉所有li 和 所有div的类名active
            for (var j = 0; j < lis.length; j++) {
                lis[j].className = '';
                divs[j].className = 'tab';
            }
            // 4.2 给当前点击的li添加类名active
            this.className = 'active';
            // 4.3 获取当前点击的li的下标
            var num = this.index;
            // 找到对应的div项，显示
            divs[num].className = 'tab active';
        });
    }
    
    
	  mui.init({
		    pullRefresh: {
		        container: "#mui-scroll-wrapper",//下拉刷新、上拉加载容器标识
		        // 下拉刷新
		        down: {
		            style: 'circle',
		            color: '#2bd009',
		            contentover: '释放立即刷新',
		            contentrefresh: '正在刷新...',
		            callback: function()
		            {

		            	pageIndex = 1;
		            	hotRecommended.hotRecommendedList=[];
		            	load();
		            	mui('#mui-scroll-wrapper').pullRefresh().endPulldownToRefresh();
		            	
		            }
		        },
		        // 上拉加载
		        up: {
		            contentrefresh: '正在加载...',
		            callback: function()
		            {
		            	if((pageIndex+1)>pageTotal)
		            	{
		            		mui('#mui-scroll-wrapper').pullRefresh().endPullupToRefresh();
		            		return;
		            	}
		            	pageIndex = pageIndex + 1;
		            	load();
		            	
		            }
		        }
		    }
		});
        mui.init()
        var id=1;
        var pageIndex = 1;
		var pageSize = 20;
		var date="";
		var province="";
		var type="";
		var pageTotal = 0;
		
		//自己封装的时间格式化方法
		function getDateFormat(nowdate) {
			var y = nowdate.getFullYear();
			var m = nowdate.getMonth() + 1;
			var d = nowdate.getDate();
			String(m).length < 2 ? (m = "0" + m) : m;
			String(d).length < 2 ? (d = "0" + d) : d;
			return y + '-' + m + '-' + d;
		}
  	  
  	   var ui = null;
        //加载数据
        function load()
		{
        	var keyword=$("#keyWord").val();
        	var param={
        			page:pageIndex,
        			rows:pageSize,
        			date:date,
        			regions:province,
        			infoType:type,
        			keyword:keyword
        	}
        	$.ajax({
				type : 'POST',
				url : '/bidsMobile.list.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) 
				{
					for(var i=0;i<data.rows.length;i++)
					{
						hotRecommended.hotRecommendedList.push(data.rows[i]);
					}
					 mui('#mui-scroll-wrapper').pullRefresh().endPullupToRefresh();
					pageTotal = (data.total -1)/pageSize + 1;
					$(".info_title span").html(data.total);
				}
			});
		    }
        
	       //初始化省的数据
	       var provinceList=new Vue({
	    	 el:'#province',
	    	 data:
	    	 {
	    		 provinceList:[]
	    	 },
	          created:function()
	          {  
	        	 provinceLoad();
	    	  },
	    	  methods:{
	    		  toCounty:function(obj,name){
	    			  id=obj;
	    			  countryList.provinceName=name;
	    			  countryLoad();
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
              }
	    	  }
	     }) 
	       
          //vue热门推荐赋值
		  var hotRecommended=new Vue
		  ({
			el:'#hotRecommended',
			data : 
			{
				hotRecommendedList :[]
			},
			created:function()
			{
				
				
				$(".SearchRecentEvent").each(function(i,e)
			    {
					var value = "";
					if(i==0)
					{
						var nowdate = new Date();
						nowdate = new Date(nowdate - 7 * 24 * 3600 * 1000);
						val =  getDateFormat(nowdate);
						data = val;
					}
					else if(i==1)
					{
						var nowdate = new Date();
						nowdate.setMonth(nowdate.getMonth() - 1);
						val = getDateFormat(nowdate);
					}
					else if(i==2)
					{
						var nowdate = new Date();
						nowdate.setMonth(nowdate.getMonth() - 3);
						val = getDateFormat(nowdate);
					}
					else if(i==3)
					{
						var nowdate = new Date();
						nowdate.setMonth(nowdate.getMonth() -6);
						val = getDateFormat(nowdate);
					}
					$(e).attr("value",val);
				});
				date=$(".time").find(".active").attr("value");
				load();
			},
			methods:
			{
			}
		  });
	       var  length;
	       //初始化shi的数据
	        var countryList=new Vue({
		    	 el:'#country',
		    	 data:
		    	 {
		    		 countryList:[{id:"-2",regionName:'全部'}],
		    		 provinceName:''
		    	 },
		    	 methods:{
		    		 selectAll:function(id)
		    		 {
		    			 var v1  ;
                       	 var v2 ;
                       	 var e;
		    			 var obj =$("#"+id).each(function(i,obj){
		    				 
		    				 e = obj;
		    				 v1   = obj.dataset.v1;
	                       	 v2   = obj.dataset.v2;
		    			 });
		    			 var input =  $(e).children("input");
		    			 var checked=$(input).prop("checked");
		    			 if(checked)
		    			 {//取消选中
		    				 if(v2=='全部')
			    			{
			    					$('div[data-v1='+v1+'] > input').prop("checked", '');	
			    			}
		    				else
		    				{
		    					//不是选中
		    					$('div[data-v2='+v2+'] > input').prop("checked", '');
		    					$("div[data-v2='全部'] > input").prop("checked", '');
		    					
		    				}	 
		    				 
		    			 }else
		    			 {// 选中
		    				if(v2=='全部')
		    				{
		    					$('div[data-v1='+v1+'] > input').prop("checked", 'checked');		
		    				}
		    				else
		    				{
		    					//不是选中
		    					$('div[data-v2='+v2+'] > input').prop("checked", 'checked');
		    	                var count = 0;
		    					$("div[data-v1="+v1+"] > input").each(function(i,e)
						    	 {
		    						var checked1=$(e).prop("checked");
		    						if(checked1)
		    						{
		    							count++;
		    						}
		    						
		                        });
		    					if((length-1)==count)
		    					{
		    						$("div[data-v2='全部'] > input").prop("checked", 'checked');	
			    					
		    					}
		    					
		    				}
		    				
		    			}
		    		 }
		    	 }
	         });
	        
	       var b=1;
	       //初始化省方法
	       function provinceLoad()
	       {
	    	   $.get("bidsMobile.city.do",{id:"0",type:"-1"},function(res)
	 	       {
        		  res=JSON.parse(res)
                  provinceList.provinceList=res;
	 	       }) 
	 	        $.ajaxSettings.async = true;
	 	    }
	       
	       //搜素
	         $(".KeySearch").on("tap",function()
	         {
	        	 $(".info_title span").html("...");
	        	 hotRecommended.hotRecommendedList=[];
	        	 pageIndex = 1;
	        	 load();
	         })
	         
	         
	       
	       
	     //初始化县的方法
	       function countryLoad()
	       {
	           var contrylists=localStorage.getItem(id+"_city");
	           if(contrylists == null || contrylists.length == 0){
	        	   $.get("bidsMobile.city.do",{id:id,type:"0"},function(res)
       	 	       {
	        		     localStorage.setItem(id+"_city",res);
               		     res=JSON.parse(res)
                         countryList.countryList=res;
               		     length=res.length;
       	 	       }) 
	           }else{
	        	   countryList.countryList=[];
	        	   var array = JSON.parse(contrylists)
	        	   $.each(array,function(index,item)
	        	  { 
	        		   countryList.countryList.push(item);
	        		   
	        	  })
	        	   length=countryList.countryList.length;
	           }
	 	    }
	       //改变省checked状态
	       $("#province").on("touchstart","li",function()
	       {
	    	   $(this).siblings().css({"color":"#787878","background":"#f1f1f1"})
	    	   $(this).css({"background-color":"#348eea","color":"#fff"})
               $("#country").find("input").prop("checked",false);
	    	   province=$(this).html().substring(0,2) == "全国" ? "":$(this).html().substring(0,2);
	    	   
	       })
	       
	        //根据时间筛选点击事件
        $(".SearchRecentEvent").on('tap',function()
        {
        	 $(".info_title span").html("...");
        	//清空hotRecommendedList数组
        	hotRecommended.hotRecommendedList=[];
        	$(this).siblings().css({"background-color":"#FFF","color": "#b4b4b4","border":"1px solid #b4b4b4"})
        	$(this).siblings().removeClass("active");
        	$(this).addClass("active");
        	$(this).css({"background-color":"#348eea","color": "#fff","border":"#348eea"})
        	date=$(".time").find(".active").attr("value");
        	pageIndex = 1;
        	load();
        })
        
         //点击类型下边的分类筛选事件
           $(".type p").on("tap",function()
   		   {
        	   $(".info_title span").html("...");
        	   hotRecommended.hotRecommendedList=[];
        	   type=$(this).html()=="全部"?null:$(this).html();
        	   $(this).parent().parent().find("p").css({"background-color":"#FFF","color": "#b4b4b4","border":"1px solid #b4b4b4"})
               $(this).css({"background-color":"#348eea","color": "#fff","border":"#348eea"})
	           pageIndex = 1;
               load();
   		   })
   		   
     /* 重置 */   		  
   	$(".reset").on("tap",function(){
   		$("#country li:first").find("input").prop("checked",true)
   		$("#province li:eq(0)").siblings().css({"color":"#787878","background":"#f1f1f1"})
 	    $("#province li:eq(0)").css({"background-color":"#348eea","color":"#fff"})
 	    province="";
   		var item = countryList.countryList[0]
        countryList.countryList=[];
   		length= 1;
    	countryList.countryList.push(item)
   	})	  
   		  
   	$(function()
   	{
	   	//默认状态选中全省
	   	 $("#province li").eq(0).addClass("active")
   	})
    </script>
</body>

</html>