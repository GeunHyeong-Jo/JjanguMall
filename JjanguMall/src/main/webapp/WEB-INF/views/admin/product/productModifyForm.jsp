<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form id="productModifyForm" method="post" enctype="multipart/form-data" 
	action="${pageContext.request.contextPath }/admin/productModify">
<input type="hidden" name="productCode" value="${goodsDTO.productCode}">
<div id="main_wrap" align="left" style="width: 1000px; margin: 0 auto;">

	<div>
		<h1 style="font-weight:normal;">상품수정</h1>
	</div>
	<div id="product_info">
		<table id="product_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>상 품 명</th>
				<td>
					<input type="text" id="productName" class="inputText" name="productName" value="${goodsDTO.productName }">
				</td>
			</tr>
			<tr>
				<th>상 품 가 격</th>
				<td>
					<input type="number" id="originPrice" name="originPrice" min="0" value="${goodsDTO.originPrice }"> KRW
				</td>
			</tr>
			<tr>
				<th>원 산 지</th>
				<td>
					<input type="text" id="origin" class="inputText" name="origin" value="${goodsDTO.origin }">
				</td>
			</tr>
			<tr>
				<th>제 조 사</th>
				<td>
					<input type="text" id="manufacturer" class="inputText" name="manufacturer" value="${goodsDTO.manufacturer }">
				</td>
			</tr>
			<tr>
				<th>총 재 고 량</th>
				<td id="qty_tr">
					<input type="number" id="totalQty" class="inputText qty" name="totalQty" value="${goodsDTO.totalQty }" readonly> 개
					&nbsp;
					<span class="span">
						잔 여 수 량 
					</span>
					&nbsp;	
					<input type="number" id="stockQty" class="inputText qty" name="stockQty" value="${goodsDTO.stockQty }" readonly> 개
					&nbsp;
					<span class="span">
						재 고 추 가 
					</span>
					&nbsp;
					<input type="number" id="addQty" class="inputText qty" name="addQty" value="0"> 개
					
				</td>
			</tr>
			
			<tr>
				<th>판 매 상 태</th>
				<td>
					<input type="radio" name="saleStatus" id="soldOut" value="0"> 품절 
					<input type="radio" name="saleStatus" id="sale" value="1"> 판매중 
					<input type="radio" name="saleStatus" id="stopSale" value="2"> 판매중지 
					<input type="hidden" id="saleStatus" value="${goodsDTO.saleStatus}">
				</td>
			</tr>
			<tr>
				<th>썸 네 일  이 미 지</th>
				<td>
					<input type="file" id="thumbImg" name="thumbFile" style="width:200px;">
					<span style="color: #aaaaaa; font-size: 12px;">
							- 파일 미업로드시 기존 이미지가 유지됩니다.
					</span>
					&nbsp;
					<span class="span">
						기존 이미지 : <input type="text" class="inputImg" name="thumbImg" value="${goodsDTO.thumbImg}" readonly>
					</span>
		
				</td>
			</tr>
				
				
		</table>
		<div align="center" style="margin-top: 50px;">
			<input type="button" class="regist_reset" id="registBtn" value="상품 수정">
			<input type="button" class="regist_reset" id="registResetBtn" value="취소">
		</div>
	</div>
</div>
</form>

<script>
//판매상태 기능
if($('#saleStatus').val()==0){
	$('#soldOut').prop('checked', true);
}else if($('#saleStatus').val()==1){
	$('#sale').prop('checked', true);
}else if($('#saleStatus').val()==2){
	$('#stopSale').prop('checked', true);
}

//유효성검사
$('#registBtn').click(function(){
	if($('#productName').val()=='')
		alert('상품명을 입력해주세요');
	else if($('#originPrice').val()=='')
		alert('상품가격을 입력해주세요');
	else if($('#origin').val()=='')
		alert('원산지를 입력해주세요');
	else if($('#manufaturer').val()=='')
		alert('제조사를 입력해주세요');
	else if($('#totalQty').val()=='')
		alert('입고수량을 입력해주세요');
	else if($('#subTotalQty').val()=='')
		alert("옵션 수량을 입력해주세요");
	else{
		$('#productModifyForm').submit();
	}
});

$('#registResetBtn').click(function(){
	location.href="/miniproject/admin/productList";
});
</script>

</html>