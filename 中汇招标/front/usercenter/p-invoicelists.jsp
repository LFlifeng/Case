<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----发票列表</title>
    <link rel="shortcut icon" href="${skin}front/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-invoicelists.css">
</head>

<body>
	<!-- 顶部 -->
  <div class="top">
    <div class="header w clearfix">
      <!-- logo区域 -->
      <div class="logo l">
        <a href="/main.index.do" style="display: inline-block;">
          <img src="${skin}front/img/logo.png" alt="">
        </a>
      </div>
      <!-- 导航部分 -->
      <div class="nav l">
        <ul class="clearfix">
    			 <li class="l"><a href="/userQd.center.do">个人中心</a></li>
                 <li class="l"><a href="/userQd.tenderserver.do">在线客服</a></li>
                 <li class="l"><a href="/userQd.memberserver.do">会员服务</a></li>
                 <li class="l"><a href="/userQd.promotionserver.do">推广服务</a></li>
            <li class="l"><a href="/orderInfo.index.do">发票申请</a></li>
        </ul>
      </div>
      <!-- 个人中心部分 -->
      <div class="personal r">
        <div class="detail clearfix">
          <div class="l">
            <a href="/systemQd.systeminformation.do"><img src="${skin}front/img/icon-email.jpg" alt=""></a>
          </div>
          <div class="l">
            <a href="/systemQd.paymentInstruction.do"><img src="${skin}front/img/icon-rang.jpg" alt=""></a>
          </div>
          <div class="l">
            <img src="${user.portraitUrl}" alt="">
            <span>${user.showName}</span>
            <i class="fa fa-angle-down"></i>
          </div>
          <ul class="ul">
            <li>
              <a href="/userQd.center.do">账号信息</a>
            </li>
            <li>
               <a href="/userQd.changePwdIndex.do">安全设置</a>
            </li>
            <li>
              <a href="/userQd.logout.do">退出登录</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
    <!-- 主体部分 -->
    <div class="main">
        <div class="middle w clearfix">
            <!-- 左侧 -->
            <div class="left l">
                <!-- 手风琴效果 -->
                <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
		          <li class="layui-nav-item"><a href="/orderInfo.index.do">发票列表</a></li>
                </ul>
            </div>
            <!-- 右侧 -->
            <div class="right r">
                <div class="t_right">
                    <div class="t_top clearfix">
                        <h3 class="l">订单列表</h3>
                    </div>
                    <div class="table-responsive"   id="orderInfoList" v-cloak>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>订单编号</th>
                                    <th>订单描述</th>
                                    <th>订单金额</th>
                                    <th>交易类型</th>
                                    <th>订单状态</th>
                                    <th>生成订单时间</th>
                                    <th>申请发票</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(orderInfo,index) in orderInfoList" :key="orderInfo.id">
                                    <td>{{index+1}}</td>
                                    <td>{{orderInfo.orderNo}}</td>
                                    <td>{{orderInfo.orderDescribe}}</td>
                                    <td>{{orderInfo.totalFeeStr}}</td>
                                    <td>
                                    	<p v-if="orderInfo.tradeType === '1'">微信</p>
                                        <p v-else-if="orderInfo.tradeType  ===	 '2'">支付宝</p>
                                     </td>
                             
                                    <td>
                                        <p v-if="orderInfo.state === '1'">未成功</p>
                                        <p v-else-if="orderInfo.state  === '2'">支付成功</p>
                                    </td>
                                    <td>{{orderInfo.ctime}}</td>
                                    <td>
                                    	<p v-if="orderInfo.invoiceState === '2'   &&  orderInfo.state === '2'"><button id="shenqing" @click="shenqing(orderInfo.orderNo)">申请</button></p>
										<p v-else-if="orderInfo.invoiceState === '1' && orderInfo.state === '2'"><button id="shenqing" @click="xiangqing(orderInfo.orderNo)">详情</button></p>
                                   </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
              			<!-- 分页容器 -->
					<div id="paging"></div>
                </div>

            </div>
            <div class="shenqing" style="display: none"  id="billingInfodetail" v-cloak>
                <form class="layui-form clearfix" action="" style="margin-left:30px;" id="publishForm">
                   <div class="l">
                    <div class="layui-form-item">
                        <div class="title">填写开票信息</div>
                    </div>
                    	<div class="layui-form-item" style="display:none">
						   <label class="layui-form-label" id='id'></label> <input
								type="text" name="id" 
								autocomplete="off"   v-model='detail.id' "
								class="layui-input">
							<input id="orderNo"  name="orderNo" lay-verify="title"   type="hidden"  value=""   >
						</div>
						<div class="layui-form-item" style="display:none">
						   <label class="layui-form-label" id='userId'></label> <input
								type="text" name="userId" 
								autocomplete="off"    v-model='detail.userId' 
								class="layui-input">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" id='invoice'>发票抬头</label> <input
								type="text" name="invoice" lay-verify="invoice"
								autocomplete="off"   v-model='detail.invoice'
								class="layui-input">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >发票类型</label> 
							<input type="radio" name="invoiceType"   id="invoiceType"value="0" title="企业增值税普通发票">
							<input type="radio" name="invoiceType"  id="invoiceType" value="1" title="增值税专用发票">
						</div>
						<div class="layui-form-item">
							<div class="clearfix">
								<label class="layui-form-label l" id='revenueCertificate'>税务登记证号</label>
								<input type="text" name="revenueCertificate"
									lay-verify="revenueCertificate" autocomplete="off"
									v-model='detail.revenueCertificate'
									placeholder="请填写15位或20位纳税人识别号" class="layui-input l"> <span
									class="l"> 
								
								</span>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" id='accountName'>开户行名称</label> <input
								type="text" name="accountName" lay-verify="accountName"
								v-model='detail.accountName'  autocomplete="off"
								placeholder="请填写您许可证上的开户银行" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" id='accountNumber'>开户行账号</label>
							<input type="text" name="accountNumber"
								lay-verify="accountNumber"   
								v-model='detail.accountNumber' 
								autocomplete="off"
								placeholder="请填写您许可证上的开户行账号" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" id='registeredAddress'>注册场所地址</label>
							<input type="text" name="registeredAddress"
								lay-verify="registeredAddress"
								v-model='detail.registeredAddress'  autocomplete="off"
								placeholder="请填写您营业执照上的开户地址" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" id='registeredLandline'>注册座机号</label>
							<input type="text" name="registeredLandline"  
								lay-verify="reg"
								v-model='detail.registeredLandline'  autocomplete="off"
								placeholder="请填写您的座机号" class="layui-input">
						</div>
				

						</div>
                <div class="r" style="margin-right: 40px;">
                    <div class="layui-form-item">
                        <div class="title">填写收票信息</div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">取票人</label>
                        <input type="text" name="recipients" autocomplete="off"
                            placeholder="请填写取票人姓名" class="layui-input"  lay-verify="required"  v-model='detail.recipients' >
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">取票人电话</label>
                        <input type="text" name="consigneePhone" autocomplete="off"
                            placeholder="请填写取票人电话" class="layui-input" lay-verify="required|phone"	 v-model='detail.consigneePhone'  >
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">收取发票地址</label>
                        <input type="text" name="consigneeAddress"  autocomplete="off"
                            placeholder="请填写收取订单地址" class="layui-input" lay-verify="required"    v-model='detail.consigneeAddress' >
                    </div>
                    </div>
                  <div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn layui-btn-normal"  id='update'  
									lay-submit lay-filter="formDemo">完成修改</button>
							</div>
						</div>
                </form>
            </div>
        </div>
    </div>
	<!-- 底部 -->
	<%@ include file="../common/footer.jsp"%>


    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script>
	//定义全局变量
	var pageIndex = 1;
	var pageSize = 10;
	var totalCount = 0;
	var billingInfodetai = new Vue({
		el:"#billingInfodetail",
		data:{
			detail:""
		}
	})
  	var OrderInfoList = new Vue({
		el : "#orderInfoList",
		data : {
			orderInfoList : [],
	
		},
		methods:{
			shenqing:function(orderNo){	      		
				$("#orderNo").val(orderNo);
				billingInfodetai.detail = {};
                    layer.open({
                        type: 1,
                        title: [''],
                        area: '1000px',
                        shade: 0.2,
                        id: 'layui',
                        anim: 2,
                        resize: false,
                        content: $('.shenqing'),
                        end: function(){
	                    	 $("#publishForm")[0].reset();
	                         layui.form.render();
                            $('.shenqing').hide()
                        }
                    })
			}, 
			xiangqing:function(orderNo){
				
			     layer.open({
	                    type: 2,
	                    title: [''],
	                    area: ['1000px','600px'],
	                    shade: 0.2,
	                    id: 'layui',
	                    anim: 2,
	                    resize: false,
	                    content: ["/billinginfo.detailIndex.do?orderNo=" +orderNo],
	                    end: function(){
	                    	
	                    	
	                    }
	                })
				
				
				

		}
		}
  	});
    
 	function loadList() {
		//查询条件
		var param = {
			page : pageIndex,
			rows : pageSize,

		};
		$.ajax({
			type : 'POST',
			url : '/orderInfo.Userlist.do',
			dataType : 'json',
			data : param,
			
			success : function(data) {
				OrderInfoList.orderInfoList = data.rows;
				totalCount = data.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						limits: [10],
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

        //入口函数
        $(function () {
        	loadList();
            // 引入公共底部

            // 手风琴导航
            $('.parentWrap>.menuGroup:nth-child(1)>.groupTitle').css({
                "background-color": "#e8f5fc",
                "color": "#ba3f44",
                "border-left": "4px solid #ba3f44"
            });
            $('.parentWrap>.menuGroup>.groupTitle').click(function () {
                $(this).css({
                    "background-color": "#e8f5fc",
                    "color": "#ba3f44",
                    "border-left": "4px solid #ba3f44"
                });
                $(this).siblings().show();
                $(this).parent().siblings().children('div').hide();
                $(this).parent().siblings().children('span').css({
                    "background-color": "",
                    "color": "",
                    "border-left": ""
                });
            });    	
            
			layui.use([ 'form', 'jquery' ], function() {
				var form = layui.form, $ = layui.$;
				/*
				 *表单验证
				 */
				form.verify({
					invoice : function(value, item) 
					{
						if (value.length > 50 || value.length < 1) 
						{
							return '请输入1-50位的抬头号';
						}
					},
					revenueCertificate : function(value)
					{
						if (value.length > 20 || value.length < 6)
						{
							return '请输入6-20位的税务登记证号';
						}
					},
					accountName : function(value)
					{
						if (value.length > 50 || value.length < 1)
						{
							return '请输入1-50为的开户行名称';
						}
					},
					accountNumber : function(value)
					{
						if (value.length > 20 || value.length < 6) 
						{
							return '请输入6-20位的开户行账号';
						}
					},
					registeredAddress : function(value, item)
					{
						if (value.length > 50 || value.length < 1) 
						{
							return '请输入正确格式的注册场所地址';
						}
					},
					reg : [/0\d{3}-\d{7,8}/,'请输入0XXX-XXXXXXX格式的座机号']
				});
				/*
				 * 初始化该用户radio发票类型单选框
				 */
				$("input[name=invoiceType][value='0']").attr("checked",
						'${invoice.invoiceType}' == 0 ? true : false);
				$("input[name=invoiceType][value='1']").attr("checked",
						'${invoice.invoiceType}' == 1 ? true : false);
				/*
				 *实现完成修改功能
				 */
				
				form.on('submit(formDemo)', function(data) 
				{
							$.ajax({
								url:'/billinginfo.updateApplyinvoice.do',
								data:data.field,
								type:'POST',
								success:function(res)
								{
									 if(res=="succ")
				                	{
											layer.msg('申请成功', {
		                             		    icon: 1,
		                             		   	time: 1000, //1s后自动关闭
		                             		    shade: [0.8, '#393D49'] // 透明度  颜色
		                             		});
		        	                        $("#publishForm")[0].reset();
		        	                        layui.form.render();
		            						pageIndex=1;
		            						loadList();
				                    }else if(res=="fail")
				                    {
										layer.msg('申请失败', {
	                             		    icon: 1,
	                             		   	time: 1000, //1s后自动关闭
	                             		    shade: [0.8, '#393D49'] // 透明度  颜色
	                             		});
				                    } 
				                    else{
			                      		 layer.msg(res,{icon:5});
			                      		 return false;
			                      	   }
								}
						      }); 
						
					return false;
				   })
				   
				   form.render();
			})     
        });
    </script>
</body>

</html>