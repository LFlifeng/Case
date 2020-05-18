<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>汇投标</title>
	<link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
	<link href="${skin}mobile/res/mui/css/mui.min.css?v=${v}" rel="stylesheet" />
	<link href="${skin}mobile/res/mui/css/iconfont.css?v=${v}" rel="stylesheet" />
	<link rel="stylesheet" href="${skin}mobile/css-v5/base.css?v=${v}">
	<link rel="stylesheet" href="${skin}mobile/css-v5/index.css?v=${v}">
	<link rel="stylesheet" href="${skin}mobile/v4/css/mask.css?v=${v}">
	<style>
		.m_cont .c_title {
			margin-left: 4%;
		}

		/** =====首次引导弹出层css   start===== **/
		.mask10 {
			width: 100%;
			position: fixed;
			top: 0;
			z-index: 2000000;
			background-color: #333;
			opacity: 0.93;
		}

		.mask10 img {
			width: 100%;
			position: absolute;
		}

		.mask10 .img1 {
			height: 30%;
			left: 0;
		}

		.mask10 .img2 {
			width: 36%;
			height: 6.5%;
			bottom: 20%;
			left: 33%;
		}

		.noGrade {
			display: none;
		}

		/** =====首次引导弹出层css   end===== **/
	</style>
</head>

<body>
	<div class="mui-content">
		<div class="mui-row">
			<div class="mui-col-sm-12 mui-col-xs-12">
				<!-- 头部 -->
				<div class="header">
					<!-- 今日更新数据 -->
					<div class="update clearfix">
						<div class="l txt">今日已更新</div>
						<div class="l number" id="number0">0</div>
						<div class="l number" id="number1">0</div>
						<div class="l number" id="number2">0</div>
						<div class="l number" id="number3">0</div>
						<div class="l number" id="number4">0</div>
						<div class="l">条</div>
					</div>
					<!-- 搜索框 -->
					<div class="search" onclick="window.open('/v5/m.search.do','_self')">
						<img src="${skin}mobile/img-v5/index_search.png?v=${v}" alt="">
						<span>搜索关键词 行业 分类</span>
					</div>
				</div>
				<!-- 中间部分 -->
				<div class="mid">
					<!-- 服务分类 -->
					<div class="index_menu">
						<li>
							<span data='zbgg'>
								<img src="${skin}mobile/img-v5/icon1.png?v=${v}" />
								<p>搜招标</p>
							</span>
						</li>
						<li>
							<span data='szb'>
								<img src="${skin}mobile/img-v5/icon2.png?v=${v}" />
								<p>搜中标</p>
							</span>
						</li>
						<li>
							<span data='njgg'>
								<img src="${skin}mobile/img-v5/icon3.png?v=${v}" />
								<p>拟在建</p>
							</span>
						</li>

						<li>
							<span data='szb'>
								<img src="${skin}mobile/img-v5/icon4.png?v=${v}" />
								<p>今日开标</p>
							</span>
						</li>
					</div>
					<!-- 点击最多 -->
					<div class="more_click">
						<div class="c_title">
							<img src="${skin}mobile/img-v5/index_icon5.jpg?v=${v}" alt="">
							<span class="c_txt">点击最多</span>
						</div>
						<div class="m_cont">
							<div class="c_title l">
								<div class='hotSearch'>
									<img src="${skin}mobile/img-v5/index_icon1.jpg?v=${v}" alt="">
									<span class="c_txt" data='1'>搜招标</span>
								</div>
							</div>
							<div class="c_title l">
								<div class='hotSearch'>
									<img src="${skin}mobile/img-v5/index_icon2.jpg?v=${v}" alt="">
									<span class="c_txt" data='2'>搜中标</span>
								</div>
							</div>
							<div class="c_title l">
								<div class='hotSearch'>
									<img src="${skin}mobile/img-v5/index_icon3.jpg?v=${v}" alt="">
									<span class="c_txt" data='3'>搜采购</span>
								</div>
							</div>
							<div class="c_title l">
								<div class='hotSearch'>
									<img src="${skin}mobile/img-v5/index_icon4.jpg?v=${v}" alt="">
									<span class="c_txt" data='4'>拟建项目</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 搜索排行 -->
					<div class="more_click" style="height:290px;">
						<div class="c_title">
							<img src="${skin}mobile/img-v5/index_icon5.jpg?v=${v}" alt="">
							<span class="c_txt">搜索排行</span>
						</div>
						<div class="m_cont">
							<div class="s_title l">
								<div class='ranked' style='color:#111'>装修</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>银行招标</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>医疗器械</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>空调安装装修</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>水利水电</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>监控安防</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>医疗器械</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>空调安装装修</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>水利水电</div>
							</div>
							<div class="s_title l">
								<div class='ranked' style='color:#111'>监控安防</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部工具栏 -->
	<footer class="zh_tabs">
		<a href="/m.index.do" class="tab_home mui-icon iconfont icon-home now"><span class="now">搜索</span></a>
		<a href="/v5/m.subscribeInfo.do" class="tab_bookmark mui-icon iconfont icon-rss"><span>订阅</span></a>
		<a href="/v5/firm.mIndex.do" class="tab_bookmark"><img style="width: 20px;height: 20px;margin-top: -5px;"
				src="${skin}mobile/img-v5/qy_off.png?v=${v}" alt=""><span style="padding: 1px 0;">搜企业</span></a>
		<a href="/v5/m.profile.do" class="tab_user mui-icon iconfont icon-me"><span>我的</span></a>
	</footer>
	<!-- 五一活动 -->
	<div class="mask" style="display: none;">
		<div class="m_content6">
			<img src="${skin}/mobile/img-v5/wuyi/index_layer.png?v=${v}" alt=""
				onclick="window.open('/m.preMember.do','_self')">
			<i class="mui-icon mui-icon-closeempty"></i>
		</div>
	</div>

	<!-- =====首次引导弹出层  start===== -->
	<div class="mask10 noGrade">
		<img class="img1" src="${skin}/mobile/img-v5/index_layer1.png?v=${v}" alt="">
		<img class="img2" src="${skin}/mobile/img-v5/zhidao.png?v=${v}" alt="">
	</div>
	<!-- =====首次引导弹出层   end===== -->
	<script src="${skin}js/vue.js?v=${v}"></script>
	<script src="${skin}mobile/js/jquery-3.3.1.min.js?v=${v}"></script>
	<script src="${skin}mobile/res/mui/js/mui.min.js?v=${v}"></script>
	<script src="${skin}mobile/js-v5/common.js?v=${v}"></script>
	<script src="${skin}front/js/countUp.js?v=${v}"></script>
	<script type="text/javascript" charset="utf-8">
		var h3 = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		var mTop = $('.header .search')[0].offsetTop;

		$('.mask10').css({
			'height': h3 + 'px'
		});
		$('.mask10 .img1').css({
			'top': mTop + 'px'
		});
		$('.mask10 .img2').on('click', function () {


			if (h3 >= 780) {
				$('.header .search').css({
					"height": 40 + 'px',
					"line-height": 40 + 'px'
				})
			}

			$('.mask10').hide()
		})



		// 数字增长
		function Num_countUp(id) {
			var options = {
				useEasing: true,
				useGrouping: true,
				separator: ',',
				decimal: '.',
			};
			var numB = document.getElementById(id);
			var demo = new CountUp(id, 0, numB.innerText, 0, 2.5, options);
			if (!demo.error) {
				demo.start();
			} else {
				console.error(demo.error);
			}
		}
		Num_countUp('number0'); Num_countUp('number1'); Num_countUp('number2'); Num_countUp('number3'); Num_countUp('number4')
		var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		$('.mask').css({
			'height': h + 'px'
		});
		$('.mask>div>i').on('tap', function () {
			$('.mask').css({
				'display': 'none'
			});
		});
		//获得slider插件对象
		var gallery = mui('.mui-slider');
		gallery.slider({
			interval: 5000//自动轮播周期，若为0则不自动播放，默认为0；
		});

		function IsPC() {
			var userAgentInfo = navigator.userAgent;
			var Agents = ["Android", "iPhone",
				"SymbianOS", "Windows Phone",
				"iPad", "iPod"];
			var flag = true;
			for (var v = 0; v < Agents.length; v++) {
				if (userAgentInfo.indexOf(Agents[v]) > 0) {
					flag = false;
					break;
				}
			}
			return flag;
		}

		(function () {

			var ispc = IsPC();
			if (ispc) {
				location.href = "/main.index.do"
				return;
			}
			var number = "${todayTotal}";
			var array = number.split("");
			var length = array.length;
			var offset = 5 - length;
			for (var i = 0; i <= length && i < 5; i++) {
				var id = "number" + (i + offset);
				$("#" + id).html(array[i]);
			}
			Num_countUp('number0'); Num_countUp('number1'); Num_countUp('number2'); Num_countUp('number3'); Num_countUp('number4')

			//定义firstGuide防止后退拿到历史的引导详情
			var firstGuide = localStorage.getItem("firstGuide");
			if (firstGuide == null || firstGuide[0] == '0') {
				showFirstGuide();
			}

			//-------- 20200429  新增五一活动弹出层 start-----------------
			MayOnePopUp();
			//-------- 20200429  新增五一活动弹出层 end
		})();

		/* 拦截a标签事件	 :	 点击信息时候判断是否购买了这个地区 如果没有购买进行拦截并且弹出框提示	 */
		$("#hotRecommended").on("tap", "a", function (event) {
			/* 判断是否登陆 */
			var isLogin = '${subscribeInfo}' == null || '${subscribeInfo}' == '';
			if (isLogin) {
				window.location.href = "m.login.do";
				return;
			}

			/* 判断是否存在购买地区  如果不存在提示只能查看的地区*/
			var info = '${m_buy_province}';

			/* 订阅信息 */
			var province = $(this).attr("data-city");
			var toTime = parseInt(dateFtt("yyyyMMddhh", new Date())); //当前时间
			var etime = parseInt('${subscribeInfo.etime}')			  //订阅会员过期时间
			/* 判断用户有购买的地区,并且没有过期 */
			if (!canSee(info, province, parseInt('${maxCity}'), parseInt('${user.grade}'), etime)) {
				$("#showTitle").css({ 'visibility': 'visible' });
				$("#myAddress").empty();

				if (info != '[]') {
					var cityArray = canSeeProvince(info);
					if (cityArray.length > 0) {
						/* 显示可查看的地区 */
						$.each(canSeeProvince(info), function (e, i) {
							$("#myAddress").append("<span class='dspan'>" + i + "</span>")

						})
						$("#m_show1").show();
					}
					else {
						//$("#m_content8_id").show();
						return true;
					}
				}

				return false;
			}
		});



		//=======  搜索排行    ranked   ==========
		$(".ranked").on("tap", function () {
			/* 搜索排行字段存入到本地缓存 */
			var rankedkey = $(this).text();
			localStorage.setItem("historyRanked", rankedkey);
			addSearchHistory(rankedkey);
			window.location.href = "/v5/m.search.do";
		})



		$(".index_menu span").on("tap", function () {
			var hotSearchkey = $(this).attr("data");
			localStorage.setItem("hotSearch", hotSearchkey);//添加历史记录
			window.location.href = "/v5/m.search.do";
		})


		//=====  点击最多下招标类型       进行搜索  ===============
		$(".hotSearch span").on("tap", function () {
			/* 搜索排行字段存入到本地缓存 */
			var type = $(this).attr("data");
			window.location.href = "/v5/m.searchSimple.do?type=" + type;
		})

		//显示首次引导
		function showFirstGuide() {
			/* 用户被引导的详情  */
			var showGradeDetail = '${user.showGradeDetail}';
			if (showGradeDetail != null && showGradeDetail != '') {
				var showNumber = showGradeDetail[0]; // 0  代表没有看过  1代表看过
				if (showNumber == '0') {
					updUserTagId();				          //修改session 中的 user
					if (h3 >= 780) {
						$('.header .search').css({
							"height": 48 + 'px',
							"line-height": 48 + 'px'
						})
					}
					$(".noGrade").css({ "display": 'block' });
				}
			}
		}

		//首次查看首页之后修改引导状态
		function updUserTagId() {
			$.post('/m.updUserTagId.do', { index: 3 }, function (res) {
				localStorage.setItem('firstGuide', res);
			})
		}


		/*--------------- 5.10之前提示五一活动 	,提示弹框  start--------------- 	*/
		function MayOnePopUp() {
			var LastDate = 20200511; //五一活动最后日期
			var day = parseInt(dateFtt("yyyyMMdd", new Date()));
			if (true /*day > LastDate*/) {
				return;
			}
			if (showNewYearDialog()) {
				$(".mask").css({ 'display': 'block' });
			}
		}
	/*--------------- 5.10之前提示五一活动 	,提示弹框  end--------------- 	*/
	</script>
</body>

</html>