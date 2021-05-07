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

#cancelDetailDiv{
	margin : 15px 0 0 0;
}
#cancelDetail{
	margin : 15px 0 0 10px;
	font-size: 16px;
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

</style>
</head>
<body>
<form>
<div id="main_wrap" style="width:100%;">
	<h1 style="font-weight: normal; margin-left:10px; margin-bottom:15px;">취소처리완료</h1>
	<div style="font-size:22px; margin:0 0 10px 23px;">주문정보</div>
	<div id="cancelInfoDiv" style="margin: 0 0 17px 0;"> 		
		<span class="title">주문번호</span><span id="orderCode" class="value">${orderlistDTO.orderCode }</span>
		<span class="title" style="width:65px;">주문자</span><span class="value">${orderlistDTO.userName}(${orderlistDTO.userId})</span><br>
		<span class="title">주문일자</span><span class="value">${orderDate}</span>
		<span class="title" style="width:65px;">취소일자</span><span class="value" id="cancelDate" style="font-size : 20px;">${cancelDate}</span><br>
		<span class="title">주문금액</span><span class="value">${orderlistDTO.totalProductPayment} 원</span>
		<span class="title" style="width:65px;">취소금액</span><span class="value" id="crPayment" style="font-size : 20px;">${orderlistDTO.crPayment} 원</span><br>
		<span style="margin-left:35px; font-size:12px;">(배송료제외)</span>
	</div>
	<div style="border:3px solid powderblue; margin:10px 0 10px 0; width:800px;"></div>
	<div id="cancelReasonDiv" style="margin:20px 0 0 27px;">
		<div style="font-size:22px;">취소사유</div>
		<div id="cancelReason" style="margin:10px 0 0 10px;">${orderlistDTO.cancelReason}</div>
		<div id="cancelDetailDiv">
		<span style="font-size:22px;">취소상세사유</span><br>
		<textarea id="cancelDetail" rows="10" cols="70">${orderlistDTO.cancelDetail}</textarea>
		</div>	
	</div>
	<div id="closeBtnDiv" align="center" style="margin-top:10px;">
	<button id="closeBtn">닫기</button>
	</div>
</div>
</form>
</body>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//닫기버튼
$('#closeBtn').click(function(){
	window.close();
})

</script>


