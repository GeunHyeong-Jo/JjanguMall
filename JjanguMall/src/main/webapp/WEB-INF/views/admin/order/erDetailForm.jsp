<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교환/환불상세</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}

/*cancel; button */
.erBtn{
	min-width: 80px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
    
}
.erRegBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: powderblue;
}

.erResetBtn{
    color: powderblue;
    border: 1px solid powderblue;
    background-color: #fff;
}

.title{
	display : inline-block;
	width : 100px;
	text-align : center;
	line-height : 30px;
}

.value{
	display : inline-block;
	width : 140px;
	text-align : left;
	margin-left : 20px;
	line-height : 30px;
}
#productInfoTable{
 width:700px; 
 border: 1px solid #d9dadc; 
 border-spacing: 0; 
 margin: 10px 0 10px 0; 
 font-size:15px; 
 line-height:22px;"
}

</style>
</head>
<body>

<div id="main_wrap" style="width:800px;">
	<c:if test="${erState =='교환접수' || erState == '교환완료'}">
	<h1 style="font-weight: normal; margin-left:10px; margin-bottom:15px;">교환처리</h1>
	<div id="orderInfoDiv">
		<div style="font-size:24px; margin:0 0 10px 23px;">주문정보</div>
		<div id="exchangeDiv" style="margin: 0 0 17px 30px; font-size : 20px; line-height:5px;"> 		
			<span class="title">주문번호</span><span id="orderCode" class="value">${orderCode }</span>
			<span class="title" style="text-align:right;">주문자</span><span class="value" id="userName"></span><br>
			<span class="title">주문일자</span><span class="value" id="orderDate"></span>
			<span class="title" style="text-align:right;">주문금액</span><span class="value" id="totalProductPayment"></span><br>
			<div align="right" style="margin-right:410px">
			<span style="font-size:12px;">(배송료제외)</span>
			</div>
		</div>
	</div>
	<div style="border:3px solid powderblue; margin:10px 0 10px 0; width:700px;"></div>	
	<div id="productDiv" style="margin: 0 0 17px 30px; font-size : 20px;"> 	
		<div style="font-size:24px; margin:0 0 10px 23px;">상품정보</div>
		<div id="tableOutterDiv">
			<table id="productInfoTable" border="1">
				<tr>
					<th style="width: 10%;">상품코드</th>
					<th style="width: 40%;">상품정보</th>
					<th style="width: 10%;">판매가</th>
					<th style="width: 10%;">구매수량</th>
					<th style="width: 10%;">교환수량</th>
					<th style="width: 10%">결제방법</th>
					<th style="width: 10%;">결제금액</th>
				</tr>
				
				<c:forEach items="${list }" var="orderDTO" varStatus="status">
				<tr>
					<td style="text-align:center;">
						${orderDTO.productCode }
					</td>
					<td>
						<div style="display:inline-block;">
						<div>${orderDTO.productName}</div>
						<c:if test="${orderDTO.productOption==1}">
						<div>선택옵션&nbsp; : [&nbsp;${orderDTO.optionContent}&nbsp;]</div>
						</c:if>
						</div>
					</td>
					<td style="text-align:center;">
						<fmt:formatNumber pattern="###,###,###" value="${orderDTO.discountPrice}"/><span>원</span>
					</td>
					<td style="text-align:center;"> 
						<div>${orderDTO.purchaseQty }<span>개</span></div>
					</td>
					<td style="text-align:center;"> 
						<div>${orderDTO.exchangeQty }<span>개</span></div>
					</td>
					<td style="text-align:center;">
						<c:if test="${orderDTO.paymentType==0}">
						신용카드	
						</c:if>
						<c:if test="${orderDTO.paymentType==1}">
						핸드폰
						</c:if> 
					</td>
					<td style="text-align:center;">
						<span class="totalPrice"><fmt:formatNumber pattern="###,###,###" value="${orderDTO.totalPrice}" /></span><span>원</span>
					</td>
				</tr>			
				</c:forEach>
			</table>
		</div>
	</div>
	<div style="border:3px solid powderblue; margin:10px 0 10px 0; width:700px;"></div>
	<div id="exchangeDiv" style="margin: 0 0 17px 0; font-size : 20px;">
		<div style="font-size:24px; margin:0 0 10px 23px;">교환정보</div>
		<div id="exchangeDiv" style="margin: 0 0 17px 50px;"> 		
			<span class="title">교환접수일자</span><span id="exchangeRegDate" class="value"></span>
			<span class="title">교환완료일자</span><span id="exchangeFinDate" class="value"></span>
		</div>
	</div>
	<div id="erReasonDiv" style="width:640px; padding:10px 5px 10px 10px; margin:10px 0 10px 0; line-height:10px;">
		<span class="title" style="font-size:20px;">교환사유</span>
		<span id="erReason" class="value" style="font-size:20px;"></span>	
	</div>
	<div id="erDetailDiv" style="margin: 10px 0 8px 27px;">
		<span style="font-size:20px;">상세사유</span><br>
		<textarea id="erDetail" rows="10" cols="50" placeholder="사유를 정확하고 자세하게 적으세요" style="font-size:18px; outline:none; margin:10px 0 0 14px;" readonly></textarea>
	</div>
		
	<div id="reasonDiv" style="margin:20px 0 0 27px; width:600px;">
		<div style="font-size:20px;">관리자 메모</div>
		<form>
			<div id="exchangeDetailDiv">
				<div align="center" style="margin-top:12px;">
					<textarea id="erAdminMemo" rows="10" cols="50" placeholder="사유를 정확하고 자세하게 적으세요" style="font-size:18px; outline:none;"></textarea>
				</div>	
				<div style="margin-top: 15px;" align="center">
					<input type="button" id="memoRegBtn" class="erRegBtn erBtn" value="입 력">
					<input type="reset" id="memoResetBtn" class="erResetBtn erBtn" value="취 소">
				</div>
			</div>
		</form>
	</div>
</c:if>
	
<c:if test="${erState =='환불접수' || erState == '환불완료'}">
	<h1 style="font-weight: normal; margin-left:10px; margin-bottom:15px;">환불처리</h1>
	<div id="orderInfoDiv">
		<div style="font-size:24px; margin:0 0 10px 23px;">주문정보</div>
		<div id="refundDiv" style="margin: 0 0 17px 30px; font-size : 20px; line-height:5px;"> 		
			<span class="title">주문번호</span><span id="orderCode" class="value">${orderCode }</span>
			<span class="title" style="text-align:right;">주문자</span><span class="value" id="userName"></span><br>
			<span class="title">주문일자</span><span class="value" id="orderDate"></span>
			<span class="title" style="text-align:right;">주문금액</span><span class="value" id="totalProductPayment"></span><br>
			<div align="right" style="margin-right:410px">
			<span style="font-size:12px;">(배송료제외)</span>
			</div>
		</div>
	</div>
	<div style="border:3px solid powderblue; margin:10px 0 10px 0; width:700px;"></div>
	<div id="productInfoDiv">
		<div style="font-size:24px; margin:0 0 10px 23px;">상품정보</div>
		<div id="productDiv" style="margin: 0 0 17px 30px; font-size : 20px;"> 		
			<div id="tableOutterDiv">
				<table id="productInfoTable" border="1">
					<tr>
						<th style="width: 10%;">상품코드</th>
						<th style="width: 40%;">상품정보</th>
						<th style="width: 10%;">판매가</th>
						<th style="width: 10%;">구매수량</th>
						<th style="width: 10%;">환불수량</th>
						<th style="width: 10%">결제방법</th>
						<th style="width: 10%;">결제금액</th>
					</tr>
			
		
				<c:forEach items="${list }" var="orderDTO" varStatus="status">
					<tr>
						<td style="text-align:center;">
							${orderDTO.productCode }
						</td>
						<td>
							<div style="display:inline-block;">
							<div>${orderDTO.productName}</div>
							<c:if test="${orderDTO.productOption==1}">
							<div>선택옵션&nbsp; : [&nbsp;${orderDTO.optionContent}&nbsp;]</div>
							</c:if>
							</div>
						</td>
						<td style="text-align:center;">
							<fmt:formatNumber pattern="###,###,###" value="${orderDTO.discountPrice}"/><span>원</span>
						</td>
						<td style="text-align:center;"> 
							<div>${orderDTO.purchaseQty }<span>개</span></div>
						</td>
						<td style="text-align:center;"> 
							<div>${orderDTO.refundQty }<span>개</span></div>
						</td>
						<td style="text-align:center;">
							<c:if test="${orderDTO.paymentType==0}">
							신용카드	
							</c:if>
							<c:if test="${orderDTO.paymentType==1}">
							핸드폰
							</c:if> 
						</td>
						<td style="text-align:center;">
							<span class="totalPrice"><fmt:formatNumber pattern="###,###,###" value="${orderDTO.totalPrice}" /></span><span>원</span>
						</td>
					</tr>			
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div style="border:3px solid powderblue; margin:10px 0 10px 0; width:700px;"></div>
	<div id="refundDiv" style="margin: 0 0 17px 0; font-size : 20px;">
		<div style="font-size:24px; margin:0 0 10px 23px;">환불정보</div>
		<div id="refundDiv" style="margin: 0 0 17px 50px;"> 		
			<span class="title">환불접수일자</span><span id="refundRegDate" class="value"></span>
			<span class="title">환불완료일자</span><span id="refundFinDate" class="value"></span>
		</div>
		
		<div id="erReasonDiv" style="width:640px; padding:10px 5px 10px 10px; margin:10px 0 10px 0; line-height:10px;">
		<span class="title" style="font-size:20px;">환불사유</span>
		<span id="erReason" class="value" style="font-size:20px;"></span>	
		</div>
		<div id="erDetailDiv" style="margin: 10px 0 8px 27px;">
			<span style="font-size:20px;">상세사유</span><br>
			<textarea id="erDetail" rows="10" cols="50" placeholder="사유를 정확하고 자세하게 적으세요" style="font-size:18px; outline:none; margin:10px 0 0 14px;" readonly></textarea>
		</div>
		
		<div id="reasonDiv" style="margin:20px 0 0 27px; width:600px;">
			<div style="font-size:22px;">관리자 메모</div>
			<form>
				<div id="refundDetailDiv">
					<div align="center" style="margin-top:12px;">
						<textarea id="erAdminMemo" rows="10" cols="50" placeholder="사유를 정확하고 자세하게 적으세요" style="font-size:18px; outline:none;"></textarea>
					</div>	
					<div style="margin-top: 15px;" align="center">
						<input type="button" id="memoRegBtn" class="erRegBtn erBtn" value="입 력">
						<input type="reset" id="memoResetBtn" class="erResetBtn erBtn" value="취 소">
					</div>
				</div>
			</form>
		</div>
	</div>
	
</c:if>
</div>
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
 	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/getOrderlistInErDetail.do',
		data : {'orderCode'  : '${orderCode}'},
		dataType : 'json',		
		success  : function(data){
			var orderlist = data.orderlistDTO;
			$('#userName').text(orderlist.userName+'('+orderlist.userId+')');
			$('#totalProductPayment').text(orderlist.totalProductPayment + ' 원');
			$('#orderDate').text(orderlist.orderDate.substr(0,10));
			//교환/환불접수날짜
			if(orderlist.erState == '교환접수' || orderlist.erState == '교환완료'){
				$('#exchangeRegDate').text(orderlist.exchangeRegDate.substr(0,10));
			}
			else {
				$('#refundRegDate').text(orderlist.refundRegDate.substr(0,10));
			}
			//교환완료날짜
			if(orderlist.exchangeFinDate == null){
				$('#exchangeFinDate').text('');
			}
			else {
				$('#exchangeFinDate').text(orderlist.exchangeFinDate.substr(0,10));
			}
			//환불완료날짜
			if(orderlist.refundFinDate == null){
				$('#refundFinDate').text('');
			}
			else {
				$('#refundFinDate').text(orderlist.refundFinDate.substr(0,10));
			}
			
			//erDetail
			if(orderlist.erReason == null){
				$('#erReason').text('');
			}
			else{
				$('#erReason').text(orderlist.erReason);
			}
			
			if(orderlist.erDetail == null){
				$('#erDetail').val('상세사유없음')
			}
			else{
				$('#erDetail').val(orderlist.erDetail);
			}
		
			
			//관리자메모
			if(orderlist.erAdminMemo != null){
				$('textarea#erAdminMemo').val(orderlist.erAdminMemo);
				$('#memoRegBtn').val("수 정");
			} 
					
			
		}
	}); 
});

$('#memoRegBtn').click(function(){
	var erAdminMemo = $('textarea#erAdminMemo').val();
	
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/setErAdminMemo.do',
		data : {'erAdminMemo'  : erAdminMemo,
				'orderCode' : '${orderCode }' },
		dataType : 'text',		
		success  : function(data){
			if(data == "success"){
				alert("관리자 메모가 등록되었습니다");
				window.close(); 
			}
			else {
				alert("메모 등록 실패!");
			}
			
		}
	}); 
	//window.close(); 
});

</script>