  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <!-- mypage right contents -->
 <div class="content">
   <div class="content_title">
   <input type="hidden" id="userId" value="${memId}">
     주문내역 · 배송조회
   </div>
 
   <div id="mypage_table_wrap" style="width:810px;">
   	<table class="mypage_table">
   	<tbody>
      <tr id="mypage_table_top">
        <th id="gubun">구분</th>
        <th id="orderDate">주문일시</th>
        <th id="orderCode">주문번호</th>
        <th id="paymentType">결제방법</th>
        <th id="order_totalPayment">주문금액</th>
      </tr>
		<c:forEach var="OrderlistDTO" items="${list }" varStatus="status">
		<tr id="mypage_table_content_0" class="mypage_table_content review_content">
			<td>일반</td>
			<td style="width:100px;">${OrderlistDTO.orderDate }</td>
			<td>
			<a id="mypage_orderCode" class="${OrderlistDTO.orderCode }" href="${pageContext.request.contextPath }/mypage/mypage_orderview?orderCode=${OrderlistDTO.orderCode }">${OrderlistDTO.orderCode }</a>
			<a href="${pageContext.request.contextPath }/mypage/mypage_orderview?orderCode=${OrderlistDTO.orderCode }">
			<div style="cursor:pointer; color:gray; margin: 3px auto 0 auto; width:80px; height:25px; line-height:25px; text-align:center; border:1px solid gray;">상세보기</div></a>
			</td>
			<td><c:if test="${OrderlistDTO.paymentType==1 }">신용카드</c:if><c:if test="${OrderlistDTO.paymentType==2 }">핸드폰</c:if></td>
			<td>${OrderlistDTO.totalProductPayment }</td>
		</tr>
		</c:forEach>
	</tbody>
    </table>

   
 	</div>
 </div><!-- content -->


<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

//숫자 3자리당 쉼표찍기
function AddComma(number) {
	return Number(number).toLocaleString('en');
}

</script>

