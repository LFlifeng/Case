<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>中汇招标----关于我们</title>
	<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
	<link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
	<link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
	<link rel="stylesheet" type="text/css" href="${skin}front/css/index.css">
	<link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${skin}front/css/about.css">
	<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}front/js/common.js"></script>
	<script src="${skin}front/js/search.js"></script>
	<style>
	     ul{
	        margin-bottom:0px;
	     }
	</style>
</head>
<script type="text/javascript">
		$(function () {
		    
			/* // 引入公共头部和底部
			$('.header').load('../slide/header.html');
			$('.footer').load('../slide/footer.html'); */
			//切换栏
			// 1. 获取一组li
			var lis = document.querySelectorAll('.sidebar_nav_l li');
			// 2. 获取一组div显示项
			var divs = document.querySelectorAll('.about_content_arc');
			// 3. for循环遍历给每一个li注册一个点击事件，给每一个li添加一个index属性，表示li的下标
			for (var i = 0; i < lis.length; i++) {
				// 3.1 给每一个li添加一个index属性
				lis[i].index = i;
				// 3.2 注册事件
				lis[i].onclick = function () {
					// 4. 在事件处理程序中，① 切换li  ② 切换div
					// 4.1 循环遍历去掉所有li 和 所有div的类名active
					for (var j = 0; j < lis.length; j++) {
						lis[j].className = '';
						divs[j].className = 'about_content_arc';
					}
					// 4.2 给当前点击的li添加类名active
					this.className = 'active';
					// 4.3 获取当前点击的li的下标
					var num = this.index;
					// 找到对应的div项，显示
					divs[num].className = 'about_content_arc active';
				};
			}
			
			//根据点击的标题切换列表项
		   var type = GetUrlParam("type");
		   　if(type=='a_1')
			 {
			   $($(".sidebar_nav_l").find("#a_1").click());
			 }
		   if(type=='a_2')
			 {
			   $($(".sidebar_nav_l").find("#a_2").click());
			 }
		   if(type=='a_3')
			 {
			   $($(".sidebar_nav_l").find("#a_3").click());
			 }
		   if(type=='a_4')
			 {
			   $($(".sidebar_nav_l").find("#a_4").click());
			 }
		   if(type=='a_5')
			 {
			   $($(".sidebar_nav_l").find("#a_5").click());
			 }
		   if(type=='a_7')
			 {
			   $($(".sidebar_nav_l").find("#a_7").click());
			 }
		    
		});
		 function GetUrlParam(paraName)
		{
		    var url = document.location.toString();
		    var arrObj = url.split("?");
		　　  if (arrObj.length > 1) 
		    {
		　　　　　var arrPara = arrObj[1].split("&");
		　　　　　var arr;

		　　　　　for (var i = 0; i < arrPara.length; i++)
		         {
		　　　　　　　　arr = arrPara[i].split("=");
		　　　　　　　　if (arr != null && arr[0] == paraName)
					   {
		　　　　　　　　　　return arr[1];
		　　　　　　　　}
		　　　　　　}
		　　　　　　return "";
		　　　　}
		　　　　else 
			   {
		　　　　　　return "";
		　　　　}
		　 }
	</script>
<body>
<!-- 公共头部 -->
<%@ include file="../common/header.jsp"%>
	<!-- 头部导航 begin-->
	<div class="head_nav">
		<div class="nav">
			<ul>
				<li><a href="/main.index.do">首页</a></li>
				<li><a href="/bids.listIndex.do">招标信息</a></li>
				<li><a href="/bids.listIndex.do" onclick="toPurchaseIndex()">采购信息</a></li>
				<li><a href="/biddinginfo.listIndex.do">项目中心</a></li>
				<li><a href="/application.listIndex.do">供应商</a></li>
				<li><a href="/news.listIndex.do">行业资讯</a></li>
				<li><a href="/serviceHall.listIndex.do">服务大厅</a></li>
			</ul>
		</div>
	</div>
	<div class="position_nav">
		当前位置：<a href="/main.index.do">首页</a>><a href="#">关于我们</a>
	</div>
	<div class="about_content">
		<div class="sidebar_nav fl">
			<ul class="sidebar_nav_l">
				<li id="a_1"class="active"><a href="userQd.bottomMessage.do?type=a_1">关于我们</a></li>
				<li id="a_4"><a  href="userQd.bottomMessage.do?type=a_4">隐私声明</a></li>
				<li id="a_3"><a href="userQd.bottomMessage.do?type=a_3">服务条款</a></li>
				<li id="a_2"><a href="userQd.bottomMessage.do?type=a_2">联系我们</a></li>
			<!-- 	<li id="a_5"><a href="userQd.bottomMessage.do?type=a_5">友情链接</a></li> -->
				<li id="a_7"><a href="userQd.bottomMessage.do?type=a_7">广告服务</a></li>
				<li id="a_5"><a href="userQd.bottomMessage.do?type=a_5">荣誉资质</a></li>
			</ul>
		</div>
		<div class="about_r fl">
			<div class="about_content_arc active">
				<h4>关于我们</h4>
				<p>中汇招标网www.zhonghuizb.com为承办运营,是为了配合公共招投标市场、优化采购商和供应商进行全球性贸易的权威电子媒体机构；响应《中华人民共和国招标投标法》而应运而生的专业平台。致力于为企业提供招标、采购、拟在建项目信息及网上招标采购等一系列专业招标商务服务。</p>
				<p>中汇招标网是招标采购领域的资讯和查询网站，为各级政府、招标代理机构、企事业单位、供应商提供强大的专业招标采购信息查询和相关服务。中汇招标网已经与国内外上百家招投标代理机构、业主、设计单位建立了合作关系。保证项目信息及时、准确性和全面性。</p>
				<p>中汇招标网每年发布工程、货物、服务等招标项目总量超过超千万条，对5万个项目进行追踪报道，覆盖了大部分国家财政性投资项目和社会投资项目。</p>
				<span>及时、准确和权威性</span>
				<p>全国31个省、市、自治区及各类金融组织贷款项目招标信息，包括世行、亚行日行、欧行项目的招标和采购信息24小时时时更新。一直是各大行业网站、新闻网等媒体引用招标行业新闻数据源头。</p>
				<span>海量的信息资源</span>
				<p>每天发布招标公告数量多达数万条，采购信息数千条，拟在建项目和项目预告多达上千条，中标结果及招标变更上万条。且项目信息仍在不断增加。</p>
				<span>项目资讯快捷、广泛</span>
				<p>全面覆盖上千个行业及所有地区；无论项目在主管单位报建、审批、立项、环评的拟在建项目，还是正在公示招标公告、招标变更和中标结果等项目信息，每个阶段在中汇招标网上都有及时跟踪报道；为企业提高把握项目的能力和提前调配资源做准备。</p>
				<span>功能及售后服务</span>
				<p>可随时查询到上万个正在招标项目信息；标书下载与招标文件的审核服务成为采招网服务新亮点；智能定制与人工一对一服务更是节省客户的时间成本。客服专员提供8小时工作时间电话热线服务。</p>
			</div>
			<div class="about_content_arc">
				<h4>隐私声明</h4>
				<p>若要访问和使用中汇招标网（zhonghuizb.com），您必须不加修改地完全接受本协议中所包含的条款、条件和中汇招标网即时刊登的通告，并且遵守有关互联网、万维网及/或本网站的相关法律、规定与规则。一旦您访问、使用了中汇招标网，即表示您同意并接受了所有该等条款、条件及通告。
				</p>
				<p>在建设过程中引用了因特网上的一些信息资源并对有明确来源的信息注明了出处，版权归原作者及原网站所有，如果您对本站信息资源版权的归属问题存有异议，请您联系我们，我们会立即做出答复并及时解决。如果您认为本站有侵犯您权益的行为，请通知我们，我们一定根据实际情况及时处理。
					本站中所提供的信息资源均按照原样提供，不附加任何形式的保证，包括适销性、适合于特定目的或不侵犯知识产权的保证。此外，不保证本站所提供信息材料的绝对准确性和完整性。可能在不通知注册用户的情况下随时变更本站的内容或在这些内容中介绍的产品和价格。
				</p>
				<p>本站可能（但在法律上不负任何责任）会监控或审查用户在本站上发送或邮寄的信息或相互之间单独交流的任何领域，包括但不限于交谈室、公告牌或其他用户论坛以及任何交流内容。中汇招标网（zhonghuizb.com）对有关任何这类交流的内容不承担任何责任，无论它们是否会因版权法引起诽谤、隐私、淫秽或其它方面的问题。保留删除包含被视为侮辱、诽谤、淫秽或其它不良内容的消息的权利。
				</p>
				<p>用户明确同意网站服务的使用由用户个人承担风险。中汇招标网（zhonghuizb.com）不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务一定不会受中断，对服务的安全性，出错发生都不作担保。
				</p>
				<span>版权声明</span>
				<p>
					未经中汇招标网（zhonghuizb.com）的明确书面许可，任何人不得复制或在非中汇招标网（zhonghuizb.com）所属的服务器上做镜像。本站所有页面的版式、图片版权均为本站所有，未经授权，不得用于除中汇招标网（zhonghuizb.com）之外的任何站点。
				</p>
				<span>网站的使用</span>
				<p>
					中汇招标网（zhonghuizb.com)授权您观看和下载本网站上的内容，但仅供您个人而非商业使用，而且，对于原始内容中所含的版权和其他所有权声明，您必须在其副本中予以保留。您不得以任何方式修改、复制、公开展示、公布或分发这些材料或者以其他方式把它们用于任何公开或商业目的。禁止以任何目的把这些材料用于其他任何网站或网络计算机环境。本站上的内容受版权保护，任何未经授权的使用都可能构成对版权、商标和其他法律的破坏。如果您违反任何条款，您使用本站的授权将自动终止，同时您必须立即销毁任何已下载或打印好的材料。
				</p>
				<span>软件的使用</span>
				<p>
					如果您从本站下载软件，一切版权属于原作者，在使用软件时要遵守该软件携带的软件许可协议中的所有许可条款。在您阅读并接受软件许可协议的各项条款之前不得下载或安装这一软件。</p>
			</div>
			
			
			
			 <div class="about_content_arc">
				<h4>服务条款</h4>
				<div class="agreement">
					<h1 style="text-align:center;">合同订立原则</h1>
					<h3>平等原则：</h3>
					<p>
						根据《中华人民共和国合同法》第三条：“合同当事人的法律地位平等，一方不得将自己的
						意志强加给另一方”的规定，平等原则是指地位平等的合同当事人，在充分协商达成一致意
						思表示的前提下订立合同的原则。
						<p>这一原则包括三方面内容：</p>
						<span>①合同当事人的法律地位一律平等。不论所有制性质，也不问单位大小和经济实力的强弱，其地位都是平等的。</span>
						<span>②合同中的权利义务对等。当事人所取得财产、劳务或工作成果与其履行的义务大体相当；要求一方不得无偿占有另一方的财产，侵犯他人权益；要求禁止平调和无偿调拨。</span>
						<span>③合同当事人必须就合同条款充分协商，取得一致，合同才能成立。任何一方都不得凌驾于另一方之上，不得把自己的意志强加给另一方，更不得以强迫命令、胁迫等手段签订合同。</span>
					</p>
					<h3>自愿原则：</h3>
					<p>
						根据《中华人民共和国合同法》第四条：“当事人依法享有自愿订立合同的权利，任何单位
						和个人不得非法干预”的规定，民事活动除法律强制性的规定外，由当事人自愿约定。
						<p>包括：</p>
						<span>第一，订不订立合同自愿；</span>
						<span>第二，与谁订合同自愿；</span>
						<span>第三，合同内容由当事人在不违法的情况下自愿约定；</span>
						<span>第四，当事人可以协议补充、变更有关内容；</span>
						<span>第五，双方也可以协议解除合同；</span>
						<span>第六，可以自由约定违约责任，在发生争议时，当事人可以自愿选择解决争议的方式。</span>
					</p>
					<h3>公平原则：</h3>
					<p>
						根据《中华人民共和国合同法》第五条：“当事人应当遵循公平原则确定各方的权利和义务”的规定，
						公平原则要求合同双方当事人之间的权利义务要公平合理。
						<p>具体包括：</p>
						<span>第一，在订立合同时，要根据公平原则确定双方的权利和义务；</span>
						<span>第二，根据公平原则确定风险的合理分配；第三，根据公平原则确定违约责任。</span>
					</p>
					<h3>诚实信用原则：</h3>
					<p>
						根据《中华人民共和国合同法》第六条：“当事人行使权利、履行义务应当遵循诚实信用原则”的规定，
						诚实信用原则要求当事人在订立合同的全过程中，都要诚实，讲信用，不得有欺诈或其他违背诚实信用的行为。
					</p>
					<h1 style="text-align:center;">网站会员注册协议（一）</h1>
					<span>在注册前，敬请您阅读以下内容，在进行注册程序过程中点击“同意”按钮即表示用户完全接受本协议项下的全部条款。</span>
					<h3>第一条 会员资格</h3>
					<p>
						在您承诺完全同意本服务条款并在中汇招标网网站完成注册程序后，即可成为本网站会员，享受中汇招标网网站为您提供的服务。
						如用户拒绝支付该项费用，则不能使用相关的网络服务。
					</p>
					<h3>第二条 会员权限 </h3>
					<span>1．会员须交纳会员费才能享有本网站提供的服务，可参阅会员收费标准及服务内容表；</span> 
					<span>2．任何会员均有义务遵守本规定及其它网络服务的协议、规定、程序及惯例。</span>
					<h3>第三条 会员资料 </h3>
					<span>1．为了使我们能够更好地为会员提供服务，请您提供详尽准确的个人资料，如更改请及时更新，提供虚假资料所造成的后果由会员承担；</span> 
					<span>2．会员有责任保管好自己的注册密码并定期修改避免造成损失，由于会员疏忽所造成的损失由会员承担。用户应当对以其用户帐号进行的所有活动和事件负法律责任。</span>
					<h3>第四条 会员资格的取消 </h3>
					<p>如发现任何会员有以下故意行为之一，本网保留取消其使用服务的权利，并无需做出任何补偿；</p> 
					<span>1．可能造成本网站全部或局部的服务受影响，或危害本网站运行；</span> 
					<span>2．以任何欺诈行为获得会员资格；</span> 
					<span>3．在本网站内从事非法商业行为，发布涉及敏感政治、宗教、色情或其它违反有关国家法律和政府法规的文字、图片等信息；</span> 
					<h3>第五条 服务商的权利</h3>
					<span>1．有权审核、接受或拒绝会员的入会申请，有权撤销或停止会员的全部或部分服务内容；</span> 
					<span>2．有权修订会员的权利和义务，有权修改或调整本网站的服务内容；</span>
					<span>3．有权将修订的会员的权利和义务以E-mail形式通知会员，会员收到通知后仍继续使用本网站服务者即表示会员同意并遵守新修订内容。 </span>
					<span>4．本网提供的服务仅供会员独立使用，未经本网授权，会员不得将会员号授予或转移给第三方。会员如果有违此例，本网有权向客户追索商业损失并保留追究法律责任的权利。</span>
					<h3>第六条 服务商的义务</h3>
					<span>1．认真做好本网站所涉及的网络及通信系统的技术维护工作，保证本网站的畅通和高效； </span>
					<span>2．除不可抗拒的因素导致本网站临时停止或短时间停止服务以外，乙方如需停止本网站的全部或部分服务时，须提前在本网站上发布通知通告会员。</span> 
					<span>3．如本网站因系统维护或升级等原因需暂停服务，将事先通过主页、电子邮件等方式公告会员； </span>
					<span>4．因不可抗力而使本网站服务暂停，所导致会员任何实际或潜在的损失，本网不做任何补偿；</span> 
					<span>5．本网不承担会员因遗失密码而受到的一切损失。 </span> 
					<span>6．本网仅提供相关的网络服务，除此之外与相关网络服务有关的设备（如电脑、调制解调器及其他与接入互联网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费）均应由用户自行负担。</span> 
					<h3>第七条 附则</h3>
					<span>1．以上规定的范围仅限于中汇招标网网站； </span> 
					<span>2．本网会员因违反以上规定而触犯有关法律法规，一切后果自负，中汇招标网网站不承担任何责任； </span> 
					<span>3．本规则未涉及之问题参见有关法律法规，当本规定与有关法律法规冲突时，以相应的法律法规为准。在本条款规定范围内，中汇招标网网站拥有最终解释权。</span> 
				</div>
			</div>
			<div class="about_content_arc">
				<h4>联系我们</h4>
				<p>邮政编码&nbsp;:&nbsp;${systemInfo.postcode }</p>
				<p>传　　真&nbsp;:&nbsp;${systemInfo.fax }</p>
				<p>客服电话&nbsp;:&nbsp;${systemInfo.servicePhone }</p>
				<p>公司电话&nbsp;:&nbsp;${systemInfo.companyPhone }</p>
				<p>公司名称&nbsp;:&nbsp;${systemInfo.companyName }</p>
				<p>公司地址&nbsp;:&nbsp;${systemInfo.companySite }</p>
			</div>
				<!-- <div class="about_content_arc">
			<h4>友情链接</h4>
				<p>中汇招标网站以“全球采购、先知先行”为愿景；自成立之初，即致力于以信息技术和互联网技术服务招标投标，并视此asdfasdfasdfasdfasdfasdf为必联的使命。</p>
				<p>中汇人深感荣幸的是，接受国家商务部的委托和授权，开发建设了“中汇招标网”( www.zhonghuizb.com )，并一直在精心运营。</p>
				<p>“中国国际招标网”是一个集机电产品国际招标行政监督和公共服务为一体的在线平台，严格依照国家相关法律法规构建并提供服务的公益性平台。</p>
				<p>“中国国际招标网”的主要用户为机电产品国际招标业务相关监管部门、招标代理机构、招标人（采购单位）、投标人、以及关心招投标的社会公众。</p>
				<p>“中国国际招标网”不仅是依法招标的机电设备招标采购项目公示公告，还被授权公布世界银行、亚洲开发银行在华项目的招标投标信息。</p> 
			</div> -->
			<div class="about_content_arc">
				<h4>广告服务</h4>
				<span>一、首页广告位</span>
				<div class="clearfix">
					<div class="l"><img src="${skin}front/img/pcad.jpg" alt=""></div>
					<div class="r">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>广告形式</th>
										<th>尺寸规格</th>
										<th>价格</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>A1</td>
										<td>图片广告</td>
										<td>666*210px</td>
										<td>3000元/月</td>
									</tr>
									<tr>
										<td>A2</td>
										<td>图片广告</td>
										<td>100*1200px</td>
										<td>2500元/月</td>
									</tr>
									<tr>
										<td>A3</td>
										<td>图片广告</td>
										<td>100*1200px</td>
										<td>2500元/月</td>
									</tr>
									<tr>
										<td>A4</td>
										<td>图片广告</td>
										<td>100*1200px</td>
										<td>2000元/月</td>
									</tr>
									<tr>
										<td>A5</td>
										<td>图片广告</td>
										<td>100*1200px</td>
										<td>2000元/月</td>
									</tr>
									<tr>
										<td>A6</td>
										<td>图片广告</td>
										<td>330*300px</td>
										<td>1000元/月</td>
									</tr>
									<tr>
										<td>A7</td>
										<td>图片广告</td>
										<td>330*160px</td>
										<td>1000元/月</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<span>二、频道页广告位</span>
				<div class="clearfix">
					<div class="l"><img src="${skin}front/img/pcad2.jpg" alt=""></div>
					<div class="r">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>广告形式</th>
										<th>尺寸规格</th>
										<th>价格</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>B1</td>
										<td>图片广告</td>
										<td>300*240px</td>
										<td>1500元/月</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<span>三、频道页广告位</span>
				<div class="clearfix">
					<div class="l"><img src="${skin}front/img/pcad3.jpg" alt=""></div>
					<div class="r">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>广告形式</th>
										<th>尺寸规格</th>
										<th>价格</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>C1</td>
										<td>图片广告</td>
										<td>300*180px</td>
										<td>1000元/月</td>
									</tr>
									<tr>
										<td>C2</td>
										<td>图片广告</td>
										<td>300*180px</td>
										<td>1000元/月</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="about_content_arc">
				<h4>荣誉资质</h4>
				<div><img src="${skin}front/img/yyzz.png" alt=""></div>
			</div>
		</div>
	</div>
	<div class="cl">
	</div>
	<!-- 公共底部 -->
	</body>
	<%@ include file="../common/footer.jsp"%>
</html>