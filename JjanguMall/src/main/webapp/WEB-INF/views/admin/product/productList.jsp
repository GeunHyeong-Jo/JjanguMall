<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인컨텐츠 시작 -->

<div id="mainContent_wrap">
	<div id="product_search_wrap" style="width:1200px; margin: 0 auto;">
		<div id="product_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">상품관리</h1>			
		</div>		
	    <div>
           	<input type="button" id="productRegistBtn" value="상 품 등 록">
       	</div>
       	<div style="float: left;">
         	<input type="button" id="productDeleteBtn" value="선 택 삭 제">
       	</div>
	    <form id="checkDeleteForm" method="post" 
	    action="${pageContext.request.contextPath }/admin/productDelete">   			
		<div id="productSeach_list" align="left" style="margin-top: 50px;">
			<table id="productSearch_Table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox" id="check_all">
					</th>
					<th style="width: 100px;">상품코드</th>
					<th style="width: 336px;">상품명</th>
					<th style="width: 134px;">상품원가</th>
					<th style="width: 134px;">총 수량</th>
					<th style="width: 134px;">잔여 수량</th>
					<th style="width: 134px;">총 판매량</th>
					<th style="width: 100px;">등록일</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td align="center" style="height: 31px;">
							<input type="checkbox" value="${list.productCode }" name="check" class="check">
						</td>
						<td align="center">${list.productCode }</td>
						<td style="padding-left: 5px;">
							<a href="javascript:void(0)" id="productA" class="${list.productCode }">${list.productName }</a>
						</td>
						<td align="center">${list.originPrice }</td>
						<td align="center">${list.totalQty }</td>
						<td align="center">${list.stockQty }</td>
						<td align="center">${list.saleQty }개</td>
						<td align="center">${list.regDate }</td>
					</tr> 
				</c:forEach>
				
				
			</table>
			<br>
			
		</div>
		</form>      
		
		 

	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->


<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 숫자탭 컴마 추가 */
 function addComma(num) {
  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  return num.toString().replace(regexp, ',');
}

/* 상품 선택 삭제 */
$('#productDeleteBtn').click(function(){
	var count = $('.check:checked').length;
	if(count!=0){
		if(confirm("정말 삭제하시겠습니까?")){
			$('#checkDeleteForm').submit();
		}
	}

});

/* 체크박스 전체 선택/해제 */
	$('#check_all').click(function(){
		if($('#check_all').is(":checked"))
			$('.check').prop('checked', true);
		else
			$('.check').prop('checked', false);
	});




/* 상품등록 버튼 */
$('#productRegistBtn').click(function(){
   location.href="/miniproject/admin/productRegistForm";
});


/* 상품 링크 클릭 시 수정 폼 */
$('#productSearch_Table').on('click', '#productA',function(){
	location.href="/miniproject/admin/productModifyForm?productCode="+$(this).attr('class');
});

</script>

</html>