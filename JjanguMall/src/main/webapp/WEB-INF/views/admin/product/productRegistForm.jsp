<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form id="productRegistForm" method="post" enctype="multipart/form-data" 
	action="${pageContext.request.contextPath }/admin/productRegist">
<div id="main_wrap" align="left" style="width: 1000px; margin: 0 auto;">

	<div>
		<h1 style="font-weight:normal;">상품등록</h1>
	</div>
	<div id="product_info">
		<table id="product_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>상 품 명</th>
				<td>
					<input type="text" id="productName" class="inputText" name="name" >
				</td>
			</tr>
			<tr>
				<th>상 품 가 격</th>
				<td>
					<input type="number" id="originPrice" name="price" min="0" > KRW
				</td>
			</tr>
			<tr>
				<th>원 산 지</th>
				<td>
					<input type="text" id="origin" class="inputText" name="origin" >
				</td>
			</tr>
			<tr>
				<th>제 조 사</th>
				<td>
					<input type="text" id="manufacturer" class="inputText" name="manufacturer" >
				</td>
			</tr>
			<tr>
				<th>카 테 고 리 선 택</th>
				<td>
				<fieldset style="border:none;">
                   <label>문구</label> <input type="radio" name="category" value="store" checked="checked">
                   <label>컴퓨터</label> <input type="radio" name="category" value="com">
                </fieldset>
                </td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>
				<textarea rows="10" cols="50" id="context" name="context" ></textarea>
                </td>
			</tr>
			<tr>
				<th>소 켓</th>
				<td>
				<input type="text" id="socket" name="socket" class="inputText">
                </td>
			</tr>
			<tr>
				<th>입 고 수 량</th>
				<td>
					<input type="number" id="totalQty" class="inputText" name="totalQty" min="0" value="0"> 개
					&nbsp;&nbsp;
							
				</td>
			</tr>
			
			
			<tr>
				<th>썸 네 일  이 미 지</th>
				<td>
					<input type="file" id="thumbImg" name="thumbFile"> 
				</td>
			</tr>
			
			
		</table>
		<div align="center" style="margin-top: 50px;">
			<input type="button" class="regist_reset" id="registBtn" value="상품 등록">
			<input type="button" class="regist_reset" id="registResetBtn" value="취소">
		</div>
	</div>
</div>
</form>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//취소버튼
$('#registResetBtn').click(function(){
   history.back();
});

//유효성 검사
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
	else if($('#context').val()=='')
		alert('내용을 입력해주세요');
	else if($('#socket').val()=='')
		alert('소켓을 입력해주세요');
	else if($('#thumbImg').val()=='')
		alert('썸네일 이미지를 삽입해주세요');
	
	else{
		$('#productRegistForm').submit();
	}
});
</script>
</html>