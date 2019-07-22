<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     *{
        margin: 0px;
        padding:0px;
     }
</style>
</head>
<body>
   <br>
	<div style="text-align:center;width:300px;margin:auto auto" >
	    <div class="pay_top">
	         <p>扫一扫付款&nbsp;(元)</p>
	         <p style="color:#fc651b;font-size:20px;font-weight:bolder;">${order.totalFeeStr}</p>
	    </div>
		<div class="pay_middle" style="text-align: center;width:300px">
	    <br>
	         <div id="output" style="width:300px;height:300px;text-align: center;" ></div>

	    <div >
                 <img style="width:35px" src="${skin}front/img/saoyisao.png"/>
                 <div style="display: inline-block;text-align: center">
			         <p>打开手机
				         <c:if test=" ${order.tradeType == '1'}">  微信 </c:if>
				         <c:if test=" ${order.tradeType == '2'}">支付宝</c:if>
			         </p>
			         <p>扫一扫继续付款</p>
                 </div>    	         
	         </div>
	    </div>
	
	</div>
</body>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${skin}front/js/jquery.qrcode.min.js"></script>
<script type="text/javascript">
jQuery(function(){
	jQuery('#output').qrcode('${url}');

})
       var tmp = setInterval(function () {
	
	            $.post("/orderQd.selectpaystatus.do?orderNo=${order.orderNo}",function(res)
           		{
           	         if(res == "succ")
           	         {
           	        	localStorage.setItem("paySuccessKey", true);
           	         	var index = parent.layer.getFrameIndex(window.name); 
           	            parent.layer.close(index)
           	         }
           	      if(res == "fail")
        	         {
        	        	localStorage.setItem("paySuccessKey", true);
        	         	var index = parent.layer.getFrameIndex(window.name); 
        	            parent.layer.close(index)
        	         }
           		})
  			 }, 5000);
</script>
</html>