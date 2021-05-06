<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세 페이지</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}
#orderView_info_table th{
	height: 30px;
	background-color: #f5f4f4;
}

.thumbImg{
	width: 30px;
	height: auto;
	vertical-align: middle;
	margin : 5px 10px 5px 35px;
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	position:relative;
}
.thumbImg:hover{
	border: 0.1px solid black;	
	transform: scaleX(4) scaleY(5);
	-webkit-transform: scaleX(4) scaleY(5);
	-moz-transform: scaleX(4) scaleY(5);
	-ms-transform: scaleX(4) scaleY(5);
	-o-transform: scaleX(4) scaleY(5);
	z-index: 1;
}
.order_optionContent{
	font-size: 12px;
	color: #ccc;
}

/*flex box*/
#wrapper{
	display :flex;
}
.column {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
  line-height : 30px;
}
.item {
  background: #f5f4f4;
  margin: 10px;
  padding: 10px;
  flex-grow: 1;
  display: flex;
/*   justify-content: center; */
/*   align-items: center; */
}

.content{
	text-align : left;

}
.userTitle{
	display : inline-block;
	width : 120px;
	text-align : right;
}
.userValue{
	display : inline-block;
	width : 300px;
	padding-left :20px; 
}
.receiveTitle{
	display : inline-block;
	width : 90px;
	text-align : right;
}
.receiveValue{
	display : inline-block;
	width : 350px;
	padding-left :20px; 
}
.pay{
	display : inline-block;
}
.title{
	width : 200px;
}
.price{
	width : 150px
}
.won{
	width : 30px;
}

#closeBtn{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
	color: #fff;
    border: 1px solid transparent;
    background-color: powderblue;
}

.erBtn{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}
</style>
</head>
<body>
<form action="">
<input type="hidden" id="orderCode" value="${orderCode}">
<div id="main_wrap" style="width: 1000px; margin: 0 auto;">
	<h1 style="font-weight: normal;">주문상세</h1>
	<div style="width: 100%; margin: 10px 0 0 0; font-size:18px;"> 		
		<span style="width: 200px; ">주문번호 : ${orderCode} </span>&emsp;&emsp;&emsp;
		<span id="user" style="width: 230px; "></span>&emsp;&emsp;&emsp;
		<span style="width: 190px; ">주문일 : ${orderDate} </span>
	</div>
	<div style="text-align:right; margin-bottom:10px; font-size:18px;">
		<div>
			<span>주문상태 선택 &nbsp;: </span>&nbsp;
			<select id="orderStateSelectBox" style="width:120px; height: 25px; padding: 1px; font-size:18px;">
				<option value="0">주문취소</option>
				<option value="1">주문접수</option>
				<option value="2">배송준비</option>
				<option value="3">배송중</option>
				<option value="4">배송완료</option>
				<option value="5">주문완료</option>
			</select>
			<input type="button" class="stateChangeBtn" id="orderStateChangeBtn" value="갱신" style="font-size:18px;">
		</div>
	</div>
	<div style="text-align:right; font-size:18px;">
		<div >
			<span>교환/환불상태 선택 &nbsp;: </span>&nbsp;
			<select id="erStateSelectBox" style="width:120px; height:25px; padding: 1px; font-size:18px;">
				<option value="교환접수">교환접수</option>
				<option value="교환완료">교환완료</option>
				<option value="환불접수">환불접수</option>
				<option value="환불완료">환불완료</option>
			</select>
			<input type="button" class="stateChangeBtn" id="erStateChangeBtn" value="갱신" style="font-size:18px;">
		</div>
	</div>
	
	<div id="order_info" style="overflow: auto;">
		<table id="orderView_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 10px;">
			<tr>
				<th style="width: 4%;">
					<input type="checkbox" id="check_all" style="cursor:pointer;">
				</th>	
				<th style="width: 6%;">상품코드</th>
				<th style="width: 30%;">상품정보</th>
				<th style="width: 9%;">판매가</th>
				<th style="width: 5%;">수량</th>
				<th style="width: 7%">결제방법</th>
				<th style="width: 9%;">결제금액</th>
				<th style="width: 8%;">주문상태</th>
				<th style="width: 8%;">교환/환불상태</th>
			</tr>
	

		<c:forEach items="${list }" var="orderDTO" varStatus="status">
			<input type="hidden" id="orderDate" value="${orderDTO.orderDate}">
			<tr>
				<td style="text-align:center">
					<input type="checkbox" class="check" id="${orderDTO.productCode }" style="cursor:pointer;">
				</td>
					
				<td style="text-align:center;">
					${orderDTO.productCode }
				</td>
			
				<td>
					<img src="../image/thumb/${orderDTO.thumbImg }" class="thumbImg">	
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
			
				<td class="orderState" id="orderState" style="text-align:center;">
					<c:if test="${orderDTO.orderState==0}">
					주문취소
					</c:if>
					<c:if test="${orderDTO.orderState==1}">
					주문접수
					</c:if>
					<c:if test="${orderDTO.orderState==2}">
					배송준비
					</c:if>
					<c:if test="${orderDTO.orderState==3}">
					배송중
					</c:if>
					<c:if test="${orderDTO.orderState==4}">
					배송완료
					</c:if>
					<c:if test="${orderDTO.orderState==5}">
					주문완료
					</c:if>
				</td>
				
				<td class="erState" id="erState${orderDTO.productCode}" style="text-align : center;">
					<c:if test="${orderDTO.exchange==1}">
						교환접수
					</c:if>
					<c:if test="${orderDTO.exchange==2}">
						교환완료
					</c:if>
					<c:if test="${orderDTO.refund==1}">
						환불접수
					</c:if>
					<c:if test="${orderDTO.refund==2}">
						환불완료
					</c:if>
				</td>
			</tr>			
		</c:forEach>
		</table>
		
		<div id="erWrapper" style="width:640px; padding:10px 5px 10px 10px; margin:10px 0 10px 0; line-height:20px; border: 2px solid powderblue;">
			<div style="font-size:25px;">교환/환불 사유</div>
			<div id="erReasonDiv" style="margin: 8px 0 8px 0;">
				<table id="erReasonTable">
					<tr>
						<td>
							<select name="erReason" id="erReason" style="font-size:18px;">
								<option value="" selected>사유</option>
								<option value="배송지연">배송지연</option>
								<option value="포장불량">포장불량</option>
								<option value="상품불만족">상품불만족</option>
								<option value="상품불량">상품불량</option>
								<option value="서비스불만족">서비스불만족</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div id="erDetailDiv" style="margin: 8px 0 8px 0;">
				<span style="font-size:20px;">상세사유</span><br>
				<textarea id="erDetail" rows="10" cols="60" placeholder="사유를 정확하고 자세하게 적으세요" style="font-size:16px; outline:none; margin-top:5px;"></textarea>
			</div>
			<div style="margin-top: 10px;">
				<input type="button" id="erRegBtn" class="erBtn" value="등 록">
				<input type="reset" id="erResetBtn" class="erBtn" value="취 소">
			</div>
		</div>
		
		<div id="wrapper">
  			<div class="column">
   			 <div class="item" style="order:1; margin-left:0px;">
   			 	<div class="content" id="userInfo">
					<div style="font-size:40px; margin-bottom:15px;">주문자 정보</div>
					<div style="font-size:20px;">
					<span class="userTitle">주문자 이름</span><span class="userValue" id="userName"></span><br>
					<span class="userTitle">주문자 핸드폰</span><span class="userValue" id="userPhone"></span><br>
					<span class="userTitle">이메일</span><span class="userValue" id="userEmail"></span><br>
					</div>
				</div>
			</div>
  			 <div class="item" style="order:4; margin-left:0px;">
  			 	<div class="content" id="receiverInfo">
					<div style="font-size:40px; margin-bottom:15px;">배송 정보</div>
					<div style="font-size:20px;">
					<span class="receiveTitle">받으실분</span><span class="receiveValue" id="receiverName"></span><br>
					<span class="receiveTitle">우편번호</span><span class="receiveValue" id="receiverZipcode"></span><br>
					<span class="receiveTitle">상세주소</span><span class="receiveValue" id="receiverAddr"></span><br>
					<span class="receiveTitle">연락처</span><span class="receiveValue" id="receiverPhone"></span><br>
					<span class="receiveTitle">남기실 말씀</span><span class="receiveValue" id="deliveryMsg"></span><br>
					</div>
				</div>
			 </div>
  		   </div>
 		   <div class="column">
    		  <div class="item" style="order:2; margin-right:0px; margin-bottom: 150px;">
    		  	<div id="payment">
    		  		<div style="font-size:40px; margin-bottom:15px; text-align:left;">결제 정보</div>
    		  		<div style="font-size:25px; text-align:right; width:450px; line-height:40px;">
					<span class="pay title">상품 합계 금액  </span><span class="pay price" id="totalPricePerOrder"></span><span class="pay won">원</span><br>
					<span class="pay title">(-)사용한 포인트  </span><span class="pay price" id="usePoint"></span><span class="pay won">원</span><br>
					<span class="pay title">(+)배송비  </span><span class="pay price" id="deliveryFee"></span><span class="pay won">원</span><br>
					<div style ="border-bottom :5px solid black; margin:10px 0 10px 0;"></div>
					<span class="pay title">(=)결제 금액  </span><span class="pay price" id="totalPayment"></span><span class="pay won">원</span><br>
					</div>
				</div>
			  </div>
           </div>
		</div>
	</div>
</div>
</form>
<div id="closeBtnDiv" align="center" style="margin-top:10px;">
<button id="closeBtn">닫기</button>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var userId = '';

//주문자정보 / 배송정보 / 결제금액 찍기
$(document).ready(function(){
	
	$.ajax({
		async : false,
		type : 'post',
		url : '/kokonutStationery/admin/getUserInfo.do',
		data : {'orderCode' : '${orderCode}'},
		dataType : 'json',
		success : function(data){
			var userDTO = data.userDTO;
			userId = userDTO.userId;
			var user = '주문자 : '+userDTO.userName+'('+userDTO.userId+')';  //최상단에 찍어주는 것
			var userName = userDTO.userName;
			var userPhone = userDTO.userPhone1+' - '+userDTO.userPhone2+' - '+userDTO.userPhone3;
			var userEmail = userDTO.userEmail;
			var receiverName = userDTO.receiverName;
			var receiverZipcode = userDTO.receiverZipcode;
			var receiverAddr = userDTO.receiverAddr1 +' '+ userDTO.receiverAddr2;
			var receiverPhone = userDTO.receiverPhone1 +' - '+userDTO.receiverPhone2+' - '+userDTO.receiverPhone3;
			if(userDTO.deliveryMsg == null) var deliveryMsg = ' ';
			else var deliveryMsg = userDTO.deliveryMsg;
						
			$('#user').text(user);
			$('#userName').text(userName);
			$('#userPhone').text(userPhone);
			$('#userEmail').text(userEmail);
			$('#receiverName').text(receiverName);
			$('#receiverZipcode').text(receiverZipcode);
			$('#receiverAddr').text(receiverAddr);
			$('#receiverPhone').text(receiverPhone);
			$('#deliveryMsg').text(deliveryMsg);
	
		}//success
	});//ajax
	
	//상품합계금액
	var totalPricePerOrder = 0;
	var totalPriceList = $('.totalPrice');
	for(var i=0; i<totalPriceList.length; i++){
		var price = stringNumberToInt(totalPriceList[i].innerHTML);
		totalPricePerOrder += price;
	}  
	$('#totalPricePerOrder').text(addComma(totalPricePerOrder));
		
	//배송비
	var deliveryFee = 0;
	if(totalPricePerOrder < 30000){
		$('#deliveryFee').text(addComma(2500));
		deliveryFee = 2500;
	}
	else {
		$('#deliveryFee').text("0");
		deliveryFee = 0;
	}
		
	//사용한포인트
	var orderCode = '${orderCode}';
	var usePoint = 0;
	$.ajax({
		async : false,
		type : 'post',
		url : '/kokonutStationery/admin/getUsePoint.do',
		data : {'orderCode' : '${orderCode}'},
		dataType : 'json',
		success : function(data){
			if(data.pointDTO == null){
				$('#usePoint').text(0);
			}	
			else{
				usePoint = data.pointDTO.usePoint;
				$('#usePoint').text(addComma(data.pointDTO.usePoint));
			}
		}
	});
	
	//결제금액
	var totalPayment = totalPricePerOrder + deliveryFee - usePoint;
	$('#totalPayment').text(addComma(totalPayment));
	
	//교환환불사유div
	$('#erWrapper').hide();

});

//체크한 productcode가져오기
function checkedProductCode(){
	var checkedList = $('.check:checked');		 			 //체크된 체크박스 태그 배열
	var productCodeList = new Array();						 //productCode 배열
	checkedList.each(function(index){
		productCodeList.push(checkedList[index].getAttribute('id'));
	});

 	/*
 	//다른방법
 	for(var i=0; i<checkedList.length; i++){
		alert(checkedList[i].checked);
		if(checkList[i].checked){
			productCodeList.push(checkListed[i].getAttribute('id'));
		}
	} 
 	*/
	return productCodeList;
}

//주문상태갱신
$('#orderStateChangeBtn').click(function(){
	//상품의 주문상태 파싱하기
	var orderDTOListString = '${list}';
	var orderDTOList = orderDTOListString.split('),');
	var orderStateList = new Array();					//상품의 주문상태	
	
	for(var i=0;i<orderDTOList.length;i++){
		var orderDTOString = orderDTOList[i].split('=');
		for(var j=0; j<orderDTOString.length; j++){
			if(orderDTOString[j].indexOf('cancel') != -1) {
				//alert(orderDTOString[j]);
				orderStateList.push(orderDTOString[j][0]);
				break;
			}
		}
	}

 	var checkedCnt = $('.check:checked').length; 			 //체크된 체크박스 개수
 	var orderCode = $('#orderCode').val()					 //orderCode
	var orderStateSel = $('#orderStateSelectBox option:selected').val() //갱신할 주문상태
		
	//alert(checkedList);
	//alert(orderStateSel);

	//체크한 productcode가져오기
 	var orderProductCodeList = checkedProductCode();
 	//alert(productCodeList);
 	
 	if(checkedCnt == 0){
		alert('주문상태를 갱신할 상품을 선택하세요');
	}
 	else {
  		//선택한 상품의 주문상태 == 갱신할 주문상태
 		for(var i=0; i<orderStateList.length; i++){
 			if(orderStateList[i] == orderStateSel){
 				alert('선택한 상품의 주문상태가 갱신할 주문상태와 같다면 갱신할 수 없습니다');
 				return;
 			}
 		}
  		
  		//주문상태 갱신가능 [cf)다시 만들기!!]
  		if(orderStateSel == 0) { //주문취소 상태로 갱신 : 주문관리메인페이지에서 진행가능(전체취소만)
  			alert('주문취소는 여기서 진행할 수 없습니다');
  		}
  			
  		else{ //그외 상태로 갱신 
  			
  			/*
   			var productCodeStr = '';
  			for(var i=0; i<productCodeList.length; i++){
  				productCodeStr += (productCodeList[i] + ',');
  			} 
  			*/
  			for(var i = 0; i < orderProductCodeList.length; i++){
	  			$.ajax({
	  				type : 'POST',
	  				url : '/kokonutStationery/admin/changeOrderState.do',
	  				data : {'orderCode' : orderCode,
	  						'orderState': orderStateSel,
	  						 'productCode' : orderProductCodeList[i]*1 },
	  				success : function(data){
	  					if(data == 'success'){
	  						$('.orderState').each(function(index){
	  							if(orderStateSel == 0){
	  								$('.orderState')[index].innerText = "주문취소";
	  							}
	  							else if(orderStateSel == 1){
	  								$('.orderState')[index].innerText = "주문접수";
	  							}
	  							else if(orderStateSel == 2){
	  								$('.orderState')[index].innerText = "배송준비";
	  							}
	  							else if(orderStateSel == 3){
	  								$('.orderState')[index].innerText = "배송중";
	  							}
	  							else if(orderStateSel == 4){
	  								$('.orderState')[index].innerText = "배송완료";
	  							}
	  							else {
	  								$('.orderState')[index].innerText = "주문완료";
	  							}
	  						});
	  					}
	  					else
	  						alert("주문상태 갱신에 실패하였습니다.");
	  				}
	  			});//ajax
  			}
  			opener.location.reload();
  			alert("주문상태가 갱신되었습니다.");
   		}
 	}  
});


//교환환불상태갱신
$('#erStateChangeBtn').click(function(){
	//alert(userId);
 	var checkedCnt = $('.check:checked').length; 			 //체크된 체크박스 개수
 	var checkedList = $('.check:checked');		 			 //체크된 체크박스 태그 배열
	var orderCode = '${orderCode}';
	var erStateVal = $('#erStateSelectBox option:selected').val(); //갱신할 교환환불상태
	var orderState = '${orderState}';

	if(checkedCnt <= 0){
		alert('교환/환불상태를 갱신할 상품을 선택하세요');
		return;
	}
	else{
		//체크한 상품코드 가져오기
	 	var erProductCodeList = checkedProductCode();
	 	
	
		if(orderState < 4){
			alert('배송완료 전에는 교환/환불상태를 변경할 수 없습니다')
		}
		else if(orderState == 5) {
			alert('주문완료 상태에서는 교환/환불을 진행할 수 없습니다.]')
			
		}
		else{//주문상태 : 배송완료상태
			var exchange = new Array(); //교환상태
			var refund = new Array();   //환불상태
			
			//체크한 상품에 대한 교환/환불상태를 가져옴
			for(var i = 0; i<erProductCodeList.length; i++){
				$.ajax({
					async : false,
					type : 'POST',
					url : '/kokonutStationery/admin/getOrderErState.do', //orderDTO가져오기
					data : {'orderCode' : orderCode,
							'productCode' : erProductCodeList[i]*1 },
					dataType : 'json',
					success : function(data){
						exchange.push(data.orderDTO.exchange);
						refund.push(data.orderDTO.refund);
					}//success
				});//ajax
			}//for
			
			//현재 교환환불상태와 갱신할 상태 비교
			if(erStateVal == '교환접수'){
				for(var i=0; i<exchange.length; i++){
					if(exchange[i] != 0 || refund[i] == 1) {
						alert('선택하신 상태로 갱신할 수 없는 상품이 존재합니다');
						return;
					}
				}
				$('#erWrapper').show();
			}			
			else if(erStateVal == '교환완료'){
				for(var i = 0; i<exchange.length;i++){
					if(exchange[i] != 1 || refund[i] != 0){
						alert('교환 접수상태에서만 갱신이 가능합니다');
						return;
					}
				}
			}
			else if(erStateVal == '환불접수'){
				for(var i =0; i<refund.length;i++){
					if(refund[i] != 0 || exchange[i] == 1){
						alert('선택하신 상태로 갱신할 수 없는 상품이 존재합니다');
						return;
					}
				}
				$('#erWrapper').show();
			}
			
			else if(erStateVal == '환불완료') {
				for(var i =0; i<refund.length; i++){
					if(refund[i] != 1 | exchange[i] != 0){
						alert('환불접수인 상태에서만 갱신이 가능합니다');
						return;
					}
				}
			}

			//order의 교환환불 정보 수정	
			for(var i = 0; i <erProductCodeList.length; i++){
				$.ajax({
					type : 'POST',
					url  : '/kokonutStationery/admin/changeErState.do',
					data : { 'erState' : erStateVal,
						     'orderCode' : orderCode,
						     'productCode': erProductCodeList[i]*1 }
				});//ajax
				$('#erState'+erProductCodeList[i]).text(erStateVal);
			}//for
		
		
			//orderlist의 교환환불 정보 수정 
			$.ajax({
				type : 'POST',
				url  : '/kokonutStationery/admin/changeOrderlistErState.do',
				data : {'erState' : erStateVal,
					    'orderCode' : orderCode },
				dataType : 'text',
				success : function(){
					opener.location.reload();
					alert('교환환불상태가 갱신되었습니다');
				}//success
			});//ajax
			
		
			if(erStateVal == '환불완료'){//총구매액 수정
				$.ajax({
					type : 'POST',
					url  : '/kokonutStationery/admin/changeTotalPayment.do',
					data : {'userId' : userId,
						    'orderCode' : orderCode },
					dataType : 'text',
					success : function(){
						alert("총구매액수정완료");	
					}//success
				});//ajax
			}//if_환불완료
		}//else_주문상태 배송완료
	}//else_checked	
});//click function

//교환환불사유 등록버튼 클릭 
$('#erRegBtn').click(function(){
	//er사유 등록
	var orderCode = $('#orderCode').val();
	var erReason = $('#erReason option:selected').val()
	var erDetail = $('#erDetail').val(); 

	$.ajax({
		async :false,
		type : 'POST',
		url : '/kokonutStationery/admin/setErReason.do',
		data : {'erReason' : erReason,
				'erDetail' : erDetail,
				'orderCode' : orderCode	},
		dataType : 'text',
		success :function(data){
			$('#erWrapper').hide();	
			alert("사유등록완료");			
		}
	});
});
	
//er사유 등록취소 버튼 클릭
$('#erResetBtn').click(function(){
	$('#erWrapper').hide();
});

//체크박스 전체 선택
$('#check_all').click(function(){
	if($('#check_all').is(':checked'))
		$('.check').prop('checked', true);
	else
		$('.check').prop('checked', false);
});

//숫자 3자리당 쉼표찍기
function addComma(number) {
	return Number(number).toLocaleString('en');
}

//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}

//닫기버튼 클릭시
$('#closeBtn').click(function(){
	window.close();
})
</script>
</html>