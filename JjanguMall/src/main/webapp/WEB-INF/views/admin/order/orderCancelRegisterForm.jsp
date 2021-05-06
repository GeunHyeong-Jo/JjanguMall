<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문취소 등록 페이지</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}

/*cancel; button */
.cancelBtn{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}
#cancelRegBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: powderblue;
}

#cancelResetBtn{
    color: powderblue;
    border: 1px solid powderblue;
    background-color: #fff;
}

#cancelRegBtn:hover{
	background-color:#1B87D4;
}
#cancelResetBtn:hover{
	background-color:#1B87D4;
}

.title{
	display : inline-block;
	width : 95px;
	font-size : 18px;
	text-align : right;
	line-height : 30px;
}

.value{
	display : inline-block;
	width : 280px;
	font-size : 20px;
	text-align : left;
	margin-left : 20px;
	line-height : 30px;
}
#cancelReasonTable{
	margin : 5px 0 0 10px;
}

#cancelReasonTable tr{
	height : 30px;
	text-align : left;
}

#cancelDetailDiv{
	margin : 15px 0 0 0;
}
#cancelDetail{
	margin : 15px 0 0 10px;
	font-size: 16px;
}

</style>
</head>
<body>
<form>
<div id="main_wrap" style="width:100%;">
	<h1 style="font-weight: normal; margin-left:10px; margin-bottom:15px;">취소처리</h1>
	<div style="font-size:22px; margin:0 0 10px 23px;">주문정보</div>
	<div id="cancelInfoDiv" style="margin: 0 0 17px 0;"> 		
		<span class="title">주문번호</span><span id="orderCode" class="value">${orderlistDTO.orderCode }</span>
		<span class="title" style="width:65px;">주문자</span><span class="value">${orderlistDTO.userName}(${orderlistDTO.userId})</span><br>
		<span class="title">주문일자</span><span class="value">${orderDate}</span>
		<span class="title" style="width:65px;">취소일자</span><span class="value"><input type="text" id="cancelDate" placeholder="YYYYMMDD형식으로 입력" style="font-size : 20px;"></span><br>
		<span class="title">주문금액</span><span class="value">${orderlistDTO.totalProductPayment} 원</span>
		<span class="title" style="width:65px;">취소금액</span><span class="value"><input type="text" id="crPayment" style="font-size : 20px;"> 원</span><br>
		<span style="margin-left:35px; font-size:12px;">(배송료제외)</span>
	</div>
	<div style="border:3px solid powderblue; margin:10px 0 10px 0; width:800px;"></div>
	<div id="cancelReasonDiv" style="margin:20px 0 0 27px;">
		<div style="font-size:22px;">취소사유</div>
		<table id="cancelReasonTable" style="width:800px;">
		<tr>
			<td class="tdTitle" style="font-weight:bold; font-size:18px">구매자 책임사유</td>
			<td class="tdTitle" style="font-weight:bold; font-size:18px">판매자 책임 사유</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="cancelReason" value="주문에 이상은 없으나 구매의사 없음(변심)"> 주문에 이상은 없으나 구매의사 없음(변심)
			</td>
			<td>
				<input type="radio" name="cancelReason" value="상품이 오랫동안 도착하지 않음"> 상품이 오랫동안 도착하지 않음
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="cancelReason" value="사이즈 또는 색상등을 잘못 선택함"> 사이즈 또는 색상등을 잘못 선택함
			</td>
			<td>
				<input type="radio" name="cancelReason" value="상품 등록 정보에 오류가 있음"> 상품 등록 정보에 오류가 있음
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="cancelReason" value="다른 상품 구매/타쇼핑몰에서 더 저렴하게 판매중임을 확인"> 다른 상품 구매/타쇼핑몰에서 더 저렴하게 판매중임을 확인
			</td>
			<td>
			</td>
		</tr>
		</table>	
		<div id="cancelDetailDiv">
		<span style="font-size:22px;">취소상세사유</span><br>
		<textarea id="cancelDetail" rows="10" cols="70" placeholder="사유를 정확하고 자세하게 적으세요"></textarea>
		</div>	
	</div>
	<div style="margin-top: 15px;" align="center">
		<input type="button" id="cancelRegBtn" class="cancelBtn" value="등 록">
		<input type="reset" id="cancelResetBtn" class="cancelBtn" value="취 소">
	</div>
</div>
</form>
</body>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$('#cancelRegBtn').click(function(){
	var orderCode = $('#orderCode').text();
	var cancelDate = $('#cancelDate').val();
	var crPayment = $('#crPayment').val();
	var cancelReason = $('input[name="cancelReason"]:checked').val();
	var cancelDetail = $('#cancelDetail').val();
	
	$.ajax({
		async : false,
		type : 'post',
		url : '/kokonutStationery/admin/orderCancelRegister.do',
		data : {'orderCode'  : orderCode,
				'cancelDate' : cancelDate,
				'crPayment'  : crPayment,
				'cancelReason' : cancelReason,
				'cancelDetail' : cancelDetail },
		dataType : 'text',		
		success  : function(data){
			if(data == 'success') alert("주문취소 처리되었습니다");
			else alert("주문취소에 실패하였습니다.");
		}
	});
	opener.parent.location.reload();
	window.close();
});

	



</script>