<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>招标公告_提供2019年最新招标信息_中汇招标网</title>
    <meta name="keywords" content="招标,招标公告,招标预告,免费发布,最新招标,2019最新招标信息">
    <meta name="description" content="中汇招标网招标信息栏目,提供全国精准海量招标公告,招标预告全面覆盖建筑工程、水利工程、道路施工、医药等各个行业领域,信息准确及时,有效提高企业中标几率。">
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/search.css">
    
<style>
	.category_city_select {
		background: #ba3f44;
		border-radius: 3px;
	}
	
	.category_city_select a {
		color: #fff;
	}
	
	.category_leixing_select {
		background: #ba3f44;
		border-radius: 3px;
	}
	
	.category_leixing_select a {
		color: #fff;
	}
	
	.category_date_select {
		background: #ba3f44;
		border-radius: 3px;
	}
	
	.category_date_select a {
		color: #fff;
	}
	[v-cloak] {
    	display: none;
	}
</style>
</head>

<body>
    <div class="search_top">
    <img alt="" src="${skin}front/img/smbg.jpg">
        <div class="w">
            <div class="search">
                <div class="search_box clearfix">
                    <input type="text"   id="title" placeholder="请输入项目名称" class="l">
                    <a class="r"  onclick="queryByTitle()"><img src="${skin}front/img/searchbtn.png" alt=""></a>
                </div>
                <div class="hot">
                    <label>热门项目：</label>
                    <label class="r10"><a onclick="classification('电梯')">电梯</a></label>
                    <label class="r10"><a onclick="classification('雕塑')">雕塑</a></label>
                    <label class="r10"><a onclick="classification('泵')">泵</a></label>
                    <label class="r10"><a onclick="classification('景观')">景观</a></label>
                    <label class="r10"><a onclick="classification('阀门')">阀门</a></label>
                    <label class="r10"><a onclick="classification('污水')">污水</a></label>
                    <label class="r10"><a onclick="classification('喷泉')">喷泉</a></label>
                    <label class="r10"><a onclick="classification('机场')">机场</a></label>
                    <label class="r10"><a onclick="classification('绿化')">绿化</a></label>
                </div>
            </div>
        </div>
    </div>
    <div class="list_content">
        <div class="list_search clearfix">
            <div class="pr">地区选择：</div>
            <ul class="category">
				<li id="li_0" class="category_city_select"><a
					 onclick="queryByRegion('','0')">全部</a></li>
				<li id="li_1"><a
					onclick="queryByRegion('北京','1')">北京</a></li>
				<li id="li_2"><a
					onclick="queryByRegion('天津','2')">天津</a></li>
				<li id="li_3"><a  
					onclick="queryByRegion('河北','3')">河北</a></li>
				<li id="li_4"><a  
					onclick="queryByRegion('山西','4')">山西</a></li>
				<li id="li_5"><a  
					onclick="queryByRegion('内蒙古','5')">内蒙古</a></li>
				<li id="li_6"><a  
					onclick="queryByRegion('上海','6')">上海</a></li>
				<li id="li_7"><a  
					onclick="queryByRegion('江苏','7')">江苏</a></li>
				<li id="li_8"><a  
					onclick="queryByRegion('浙江','8')">浙江</a></li>
				<li id="li_9"><a  
					onclick="queryByRegion('安徽','9')">安徽</a></li>
				<li id="li_10"><a  
					onclick="queryByRegion('江西','10')">江西</a></li>
				<li id="li_11"><a  
					onclick="queryByRegion('山东','11')">山东</a></li>
				<li id="li_12"><a  
					onclick="queryByRegion('福建','12')">福建</a></li>
				<li id="li_13"><a  
					onclick="queryByRegion('广东','13')">广东</a></li>
				<li id="li_14"><a  
					onclick="queryByRegion('广西','14')">广西</a></li>
				<li id="li_15"><a  
					onclick="queryByRegion('海南','15')">海南</a></li>
				<li id="li_16"><a  
					onclick="queryByRegion('湖南','16')">湖南</a></li>
				<li id="li_17"><a  
					onclick="queryByRegion('湖北','17')">湖北</a></li>
				<li id="li_18"><a  
					onclick="queryByRegion('河南','18')">河南</a></li>
				<li id="li_19"><a  
					onclick="queryByRegion('辽宁','19')">辽宁</a></li>
				<li id="li_20"><a  
					onclick="queryByRegion('吉林','20')">吉林</a></li>
				<li id="li_21"><a  
					onclick="queryByRegion('黑龙江','21')">黑龙江</a></li>
				<li id="li_22"><a  
					onclick="queryByRegion('陕西','22')">陕西</a></li>
				<li id="li_23"><a  
					onclick="queryByRegion('甘肃','23')">甘肃</a></li>
				<li id="li_24"><a  
					onclick="queryByRegion('青海','24')">青海</a></li>
				<li id="li_25"><a  
					onclick="queryByRegion('宁夏','25')">宁夏</a></li>
				<li id="li_26"><a  
					onclick="queryByRegion('新疆','26')">新疆</a></li>
				<li id="li_27"><a  
					onclick="queryByRegion('重庆','27')">重庆</a></li>
				<li id="li_28"><a  
					onclick="queryByRegion('四川','28')">四川</a></li>
				<li id="li_29"><a  
					onclick="queryByRegion('贵州','29')">贵州</a></li>
				<li id="li_30"><a  
					onclick="queryByRegion('云南','30')">云南</a></li>
				<li id="li_31"><a  
					onclick="queryByRegion('西藏','31')">西藏</a></li>
            </ul>
            <div class="pr">项目类型：</div>
            <ul class="category">
<li id="li_32" class="category_leixing_select"><a
					  onclick="queryByLeixing('','32')">全部</a></li>
				<li id="li_33"><a  
					onclick="queryByLeixing('招标公告','33')">招标公告</a></li>
				<li id="li_34"><a  
					onclick="queryByLeixing('预审公告','34')">预审公告</a></li>
				<li id="li_35"><a  
					onclick="queryByLeixing('变更公告','35')">变更公告</a></li>
				<li id="li_36"><a  
					onclick="queryByLeixing('中标公告','36')">中标公告</a></li>
				<li id="li_44"><a  
					onclick="queryByLeixing('政府招标','44')">政府招标</a></li>
				<li id="li_45"><a  
					onclick="queryByLeixing('企业招标','45')">企业招标</a></li>
				<li id="li_37"><a  
					onclick="queryByLeixing('采购公告','37')">采购公告</a></li>
				<li id="li_46"><a  
					onclick="queryByLeixing('中标采购','46')">中标采购</a></li>
				<li id="li_47"><a  
					onclick="queryByLeixing('企业采购','47')">企业采购</a></li>
				<li id="li_48"><a  
					onclick="queryByLeixing('合同采购','48')">合同采购</a></li>
				<li id="li_49"><a  
					onclick="queryByLeixing('政府采购','49')">政府采购</a></li>
				<li id="li_38"><a  
					onclick="queryByLeixing('废标/流标公告','38')">废标/流标公告</a></li>
				<li id="li_39"><a  
					onclick="queryByLeixing('结果公告','39')">结果公告</a></li>
				<li id="li_40"><a  
					onclick="queryByLeixing('合同公告','40')">合同公告</a></li>
					<li id="li_41"><a  
					onclick="queryByLeixing('延期公告','41')">延期公告</a></li>
						<li id="li_42"><a  
					onclick="queryByLeixing('终止公告','42')">终止公告</a></li>
				<li id="li_43"><a  
					onclick="queryByLeixing('其他公告','43')">其他公告</a></li>

            </ul>
            <div class="pr">时间范围：</div>
            <ul class="category">
				<li id="li_63"  class="category_date_select"><a
					 onclick="queryByDate(1,'63')">一周</a></li>
				<li id="li_60"><a href="javascript:void(0)"
					onclick="queryByDate(2,'60')">一个月</a></li>
				<li id="li_61"><a href="javascript:void(0)"
					onclick="queryByDate(3,'61')">三个月</a></li>
				<li id="li_62"><a href="javascript:void(0)"
					onclick="queryByDate(4,'62')">半年</a></li>
            </ul>
        </div>
        <div class="list_list_content">
            <div class="list_l"  id="bidslist"  v-cloak>
                <table>
                    <thead>
                        <tr class="t_top">
                            <th style="width:10%;">项目类别</th>
                            <th style="width:60%;">项目名称</th>
                            <th style="width:10%;">所在地区</th>
                            <th style="width:10%;">发布时期</th>
                        </tr>
                    </thead>
                    <tbody>
						<tr class="t_t" v-for="bids in bidslist" :key="bids.id">
							<td>{{bids.type}}</td>
							<td align="left" id="tdd"><a
								 target="blank"  @click='findDetail(bids.id)'>{{bids.name}}</a>
							</td>
							<td>{{bids.province}}</td>
							<td>{{bids.time}}</td>
						</tr>
                        
                    </tbody>
                </table>
            </div>
            <!-- 分页容器 -->
			<div id="paging"></div>
        </div>
    </div>
    <!-- 公共底部 -->
	<%@ include file="footer.jsp"%>

    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script>
        $(function () {

                //弹出层
                
        });
        
      //定义全局变量
		var pageIndex = 1;
		var pageSize = 20;
		var totalCount = 0;
		var type = '';
		var date = '';
		var province = '';
		var title = '';
		var industry = '';

		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var vue = new Vue({
			el : "#bidslist",
			data : {
				bidslist : null
			},
			methods : {
				findDetail : function(id) {
					var unionid= '${user.unionId}';
					if(!unionid){
		                    layer.open({
		                        type: 1,
		                        title: [''],
		                        area: '300px',
		                        shade: 0.6,
		                        id: 'layui', 
		                        anim: 2,
		                        resize: false,
		                        content: "<div style='text-align:center;'><img src='${skin}front/img/erweima.jpg'></div>",
		                    })
		              }else{
		            	  location.href = 'bids.details.do?id=' + id;
		              }

				}
			}

		});
		//加载完成
		$(function() {	
			loadList();
		});
		//根据类型查询
		function queryByLeixing(data, index) {
			var id = "#li_" + index;
			$(".category_leixing_select")
					.removeClass("category_leixing_select");
			$(id).addClass("category_leixing_select");
			type = data;
			pageIndex = 1;
			loadList();
		}
		//根据时间段查询
		function queryByDate(data, index) {
			var nowdate = new Date()
			 if (data == 1) {
				//获得一周前时间
				nowdate = new Date(nowdate - 7 * 24 * 3600 * 1000);
				getDateFormat(nowdate);
			} else if (data == 2) {
				//获得一个月前时间
				nowdate.setMonth(nowdate.getMonth() - 1);
				getDateFormat(nowdate);
			} else if (data == 3) {
				//获得三个月前时间
				nowdate.setMonth(nowdate.getMonth() - 3);
				getDateFormat(nowdate);
			} else if (data == 4) {
				//获得半年前时间
				nowdate.setMonth(nowdate.getMonth() - 6)
				getDateFormat(nowdate);
			}

			var id = "#li_" + index;
			$(".category_date_select").removeClass("category_date_select");
			$(id).addClass("category_date_select");

			pageIndex = 1;
			loadList();
		}
		//根据地区查询
		function queryByRegion(data, index) {

			var id = "#li_" + index;
			$(".category_city_select").removeClass("category_city_select");
			$(id).addClass("category_city_select");

			province = data;
			pageIndex = 1;
			loadList();
		}
		//根据标题查询
		function queryByTitle() {
		
			title = document.getElementById("title").value;
		
			pageIndex = 1;
			loadList();
		}
		function loadList() {
			title = $('#title').val();
			
			//查询条件
			var param = {
				page : pageIndex,
				rows : pageSize,
				type : type,
				title : title,
				date : date,
				province : province,
				industry : industry
			};
			$.ajax({
				type : 'POST',
				url : '/bids.list.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					vue.bidslist = data.rows;
					totalCount = data.total;
					layui.use('laypage', function() {
						laypage = layui.laypage;
						laypage.render({
							elem : 'paging',
							count : totalCount,
							curr : pageIndex,
							theme : '#c8302e',
							limit : pageSize,
							layout : [ 'count', 'prev', 'page', 'next',
									'limit', 'refresh', 'skip' ],
							jump : function(obj, first) {
								//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
								if (!first) {
									pageIndex = obj.curr;
									pageSize = obj.limit;
									loadList();
								}
							}
						});
					});
				}

			});
		};
		//自己封装的时间格式化方法
		function getDateFormat(nowdate) {
			var y = nowdate.getFullYear();
			var m = nowdate.getMonth() + 1;
			var d = nowdate.getDate();
			String(m).length < 2 ? (m = "0" + m) : m;
			String(d).length < 2 ? (d = "0" + d) : d;
			date = y + '-' + m + '-' + d;
		}
		
		//热门项目查询
		function classification(data)
		{
			industry = data;
			pageIndex = 1;
			loadList();
			
		}
    </script>
</body>

</html>