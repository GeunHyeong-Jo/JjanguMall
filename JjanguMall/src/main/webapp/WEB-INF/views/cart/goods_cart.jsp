<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <link href="${pageContext.request.contextPath }/assets/css/goods_cart.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/index.css" rel="stylesheet">
<!-- sub_Wa start -->
<div class="sub_Wa">
	<!-- indiv start -->
	<div class="indiv" style="margin: 135px 10px 0 20px;">
		<div class="cart_title">장바구니</div>
		<form id="cartForm" name="CartForm" method="post" action="${pageContext.request.contextPath }/cart/goods_cart_modify" >
			<input type="hidden" name="mode" value="modItem">
			
			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="cartTable" style="margin-top: 15px;">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="">
					<col width="12%">
					<col width="10%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				
				<tr>
					<th class="cart_select" style="cursor: pointer; border-top: 1px solid #999;" >선택</th>
					<th class="goodsInfo" colspan="2" style="text-align: left;">상품정보</th>
					<th class="sellPrice">판매가</th>
					<th class="sellQty">수량</th>
					<th class="sellDelivery">배송비</th>
					<th class="Total">합계</th>
				</tr>
	
				<c:set var="total" value="0" />
				<c:if test="${list.size()!=0}"> 
					<c:forEach var="cartDTO" items="${list }" varStatus="status">
					<c:set var="total" value="${total + cartDTO.discountPrice * cartDTO.productQty }" />
							<c:set var="cnt" value="${cnt+1}" />
							<input type="hidden" id="cartCode${cnt}" name="cartCode"
								value="${cartDTO.cartCode}">
							<input type="hidden" id="productCode${cnt}" name="productCode"
								value="${cartDTO.productCode}">
							<input type="hidden" id="productName${cnt}" name="productName"
								value="${cartDTO.productName}">
							
							<input type="hidden" id="thumbImg${cnt}"
								value="${cartDTO.thumbImg}">
							<input type="hidden" id="discountPrice${cnt}"
								value="${cartDTO.discountPrice}">	
							
							
							<tr>
							<td id="cart_checkbox" style="vertical-align: top; padding: 30px 17px;">
								<input type="checkbox" name="cartCheckbox" value="${cartDTO.cartCode }" class="checkbox${cnt}" checked>
							</td>

							<td style="vertical-align: top; padding: 30px 17px;">
								<a href="${pageContext.request.contextPath }/goods/goods_view?productCode=${cartDTO.productCode}" style="margin-bottom: 0;">
								<img src="${pageContext.request.contextPath }/assets/image/thumb/${cartDTO.thumbImg }" width="70px" onerror=""></a>
							</td>

							<td class="orderOption" style="text-align: left; vertical-align: top; padding: 30px 0;">
								<div class="thumbImg" id="productName${cnt}" >${cartDTO.productName}</div>
							
								
							</td>

							<td class="price"><f:formatNumber pattern="###,###,###" value="${cartDTO.discountPrice }" />원</td>
							
							<td style="vertical-align: top; padding: 22px 0 30px 0;">
								<table cellpadding="0" cellspacing="0" border="0" style="margin: 0 auto;">
									<tr>
										<td style="padding: 0; height: 0px; border: 0">
											<div style="float: left;">
												<input type="text" name="productQty" id="${status.index}" step="1" min="1" size="2" 
													   value="${cartDTO.productQty }" class="line productQty${cnt}" 
													   style="border: 1px solid #DDD; width: 40px; text-align: right; 
													   		  height: 38px; padding-right: 5px; font-weight: 500;"/>
											</div>
											<div style="float: left; padding-left: 3px;">
													<div style="padding: 1px 0 3px 0;">
														<img class="up" id="${status.index}"
															src="${pageContext.request.contextPath }/assets/image/add-button.png"
															style="cursor: pointer; width: 14px;">
													</div>
													<div>
														<img class="down" id="${status.index}"
															src="${pageContext.request.contextPath }/assets/image/minus-button.png"
															style="cursor: pointer; width: 14px;">
													</div>
											</div>
										</td>
									</tr>
									
									<tr>
										<td style="padding: 10px 0 0 0; height: 0px; border: 0">
											
											
											<input type="button" value="수정" class="sub-button-xs modifyBtn" id="modifyBtn_${cnt }" 
												   style="text-align:center; font-weight:bold; width:65px; height:30px; line-height:30px; padding:0; float:right; font-weight:500;">
										</td>
									</tr>
								</table>
							</td>
							
							<td rowspan="1" style="text-align: center; background: #fff; color: #333; padding-top: 30px; 
												   vertical-align: top; border-left: 1px solid #ebebeb; border-right: 1px solid #ebebeb;">
								<div id="deliveryState">기본배송</div>
							</td>
							
							<td id="eachCost" style="vertical-align: top; color: #333; text-align: right; padding: 30px 0; font-weight: 700; padding-right: 20px;">
								<f:formatNumber pattern="###,###,###" value="${cartDTO.discountPrice * cartDTO.productQty }" />원
							</td>	
						</tr>
					</c:forEach>
				</c:if>
					
				<!-- 상품합계 부분 시작 -->
				<tr>
					<td colspan="10" style="padding: 30px 0;">
						<table width="100%" cellpadding="0" cellspacing="0" class="totalPriceArea">
							<tr class="totalPrice" style="padding-right: 0px;">
								<td style="border: none;">
									<font style="color: #333; font-weight: 500;">
										상품합계금액 (배송비 별도)
									</font>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<font id="totalCost" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #FFA7A7; font-weight: 700;">
										<c:if test="${list.size()==0}">
											0
										</c:if>
										<c:if test="${list.size()!=0}">
											<f:formatNumber pattern="###,###,###" value="${total}"/>
										</c:if>
									</font>
									<font style="font-size: 15px; color: #FFA7A7; font-weight: 700;">
										원
									</font>
								</td>
							</tr>
						</table>		
					</td>
				</tr>
				<!-- 상품합계 부분 끝 -->					
			</table>
		</form>
		
		<!-- 버튼 부분 -->
		<!-- 장바구니 리스트가 없을 때 -->
		<c:if test="${list.size()==0}"> 
			<div class="cart_button">
				<div class="none_previous subButton-xs" style="width: 140px; margin: 31px 0px -60px 260px;">
					<a href="javascript:history.back();">이전으로</a>				</div>
				
				<div class="shopContinue main-button-s" style="width: 140px; margin: -59px 564px 0px;">
					<a href="/miniproject"><li class="shopContinue main-button-s" >쇼핑계속하기</li></a>
				</div>
			</div>
		</c:if>
		
		<!-- 장바구니 리스트가 있을 때 -->
		<c:if test="${list.size()!=0}"> 
			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="order_btn" style="padding: 30px 0 0 0;">
				<tr>
					<td>
						<div>
							<div class="previous" style="width: 140px; display: inline-block;">
								<a href="javascript:history.back();"><li class="subButton subButton-xs">이전으로</li></a>
							</div>
							<div class="selectDelete" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#" onfocus="blur()"><li class="subButton subButton-xs">선택 삭제</li></a>
							</div>
							<div class="allDelete" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#"><li class="subButton subButton-xs">비우기</li></a>
							</div>
							<div class="" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="/miniproject" ><li class="subButton subButton-xs">쇼핑 계속하기</li></a>
							</div>
							
							<div class="selectOrder" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#"><li id="selectOrderBtn" class="main-button-s">선택 주문하기</li></a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</c:if>
	</div>
	<!-- indiv end -->
</div>
<!-- sub_Wa end -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">


$('.cart_select').click(function() {
	if($('.cart_select').hasClass('checkedAll')) {
		$('input[name=cartCheckbox]').prop('checked', false);
		$('.cart_select').removeClass('checkedAll');
				
	} else {
		$('input[name=cartCheckbox]').prop('checked', true);
		$('.cart_select').addClass('checkedAll');
	}	
});



//숫자가 아닌경우  유효성검사 필요
$('input[name=productQty]').focusout(function() {
	var input = $(this).val();
	//alert(input);
	if (isNaN(input)==true) {
		$(this).val("1");
		
	}else if(isNaN(input)==false){
		$(this).val(input);
	}
	
});	


//수량 변경
$('.up').click(function() {
	var id_check = $(this).attr("id");//status.index
	var qty = $('#' + id_check).val();
	qty++;
	$('#' + id_check).val(qty);
	//alert(id_check);
	//alert(qty);
});

$('.down').click(function() {
	var id_check = $(this).attr("id");
	var qty = $('#' + id_check).val();
	if (qty > 1) {
		qty--;
		$('#' + id_check).val(qty);
	}
	//alert(id_check);
	//alert(qty);
});

//수정
$('.modifyBtn').off('click').on('click',function(){
	var idName = $(this).attr('id');
	var cnt = idName.substring(10,idName.length);
	
	 
	var productCode = $('#productCode'+cnt).val();
	var input = $('.productQty'+cnt).val();
	var productName = $('#productName'+cnt).text();
	var cartCode = $('#cartCode'+cnt).val();
	//alert("cartCode= "+cartCode+" productCode="+productCode+" productName="+productName+" productQty="+input+" optionContent="+optionContent);
	
	$.ajax({
		type:'post',
		url:'/miniproject/cart/goods_cart_modify',
		data:{'cartCode':cartCode,
			'productQty':input},
			success:function(){
				location.href="/miniproject/cart/goods_cart";
			}
	});
});

//장바구니 선택삭제
$('.selectDelete').click(function() {
	var productCode = '';
	

	//alert("삭제");
	if(confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?")){
		for (var i = 1; i <= $('input[name=cartCheckbox]').length; i++) {
			if ($('.checkbox' + i).is(':checked')) {
				productCode = $('#productCode' + i).val();
	
				
				
				if('${memId}'!=''){//회원
					$.ajax({
						type : 'post',
						url : '/miniproject/cart/deleteCart',
						data : {
							'userId' : '${memId}',
							'productCode' : productCode
						}
					});
				//alert('회원 장바구니 선택삭제 성공');
				}
				
			} //if; 체크 유무 확인
		} //for
		alert("삭제가 완료되었습니다.");
	}
	//새로고침
	if('${memId}'!='')
		location.href = '/miniproject/cart/goods_cart';
	
});


//장바구니 전체삭제
$('.allDelete').click(function() {
	if(confirm("장바구니를 전부 비우시겠습니까?")){
		if('${memId}'!=''){//회원
			$.ajax({
				type : 'POST',
				url : '/miniproject/cart/allDeleteCart',
				data : {
					'userId' : '${memId}'
				}
			});
		}
		alert('장바구니 비우기 완료');
		if('${memId}'!='')
			location.href = '/miniproject/cart/goods_cart';
		
	}
});





		
//선택주문하기
$('#selectOrderBtn').click(function(){
	
	var checkedValue = $('input:checkbox[name=cartCheckbox]:checked'); 
	var checkedValueStr = "";
	
	for(i = 0; i<checkedValue.length; i++){
		checkedValueStr += checkedValue[i].value;		//checkbox value값 = cartCode
		checkedValueStr += ",";
	}
	if('${memId}'!=''){
		location.href="/miniproject/order/order_cart?checkedValueStr="+checkedValueStr;
	}

	
});
</script>






