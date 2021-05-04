<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/goods_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/goods_view.js?alert"></script>

<input type="hidden" id="goodsDTO" value="${goodsDTO}">
	<div id="main">

		<!-- 전체 div -->
		<div id="goodsView_area">
			<!-- 상품 소개 페이지 -->
			<div id="goods_main">
				<div id="goods_image">
					<img src="${pageContext.request.contextPath }/assets/image/thumb/${goodsDTO.thumbImg }" width="400">
				</div>
				<div id="goods_subject">
					<div>
						<b name="productName" style="font-size: 20pt; font-weight: 700;">${goodsDTO.productName}</b>
					</div>
					<div style="padding: 17px;"></div>
					<div>
						<div class="items">판매가격</div>
						<div class="item_contents" name="discountPrice"
							style="font-size: 15px; font-weight: 700;">
							${goodsDTO.originPrice}원
						</div>
					</div>
					<div>
						<div class="items">원산지</div>
						<div class="item_contents" name="origin">${goodsDTO.origin}</div>
					</div>
					<div>
						<div class="items">제조사</div>
						<div class="item_contents" name="manufacturer">${goodsDTO.manufacturer}</div>
					</div>

					
					<!-- 수량 선택 div -->
					<div id="noOptionDiv" style="margin-top: 3px;">
						<div class="items" style="padding: 5px 0;">구매수량</div>
						<div class="item_contents">
							<div style="float: left;">
								<input type="text" name="productQty" id="productQty" step="1"
									min="1" max="0" size="2" value="1"
									style="border: 1px solid #DDD; width: 47px; text-align: center; height: 42px; padding-right: 5px; font-weight: 500;" />
							</div>

							<div style="float: left; padding-left: 3px;">
								<div style="padding: 1px 0 3px 0;">
									<img id="up"
										src="${pageContext.request.contextPath }/assets/image/add-button.png"
										style="cursor: pointer; width: 14px; margin: 3px 2px;">
								</div>
								<div>
									<img id="down"
										src="${pageContext.request.contextPath }/assets/image/minus-button.png"
										style="cursor: pointer; width: 14px; margin: 3px 2px;">
								</div>
							</div>
							<div
								style="padding-left: 5px; line-height: 38px; margin: 10px 0;">개</div>
						</div>
					</div>
									
					<!-- 총 합계금액 div -->
					<div id="totalPriceDiv">
					총 금액&ensp;:&ensp;<span id="priceSpan" style="font-size: 22px; color: #333; font-weight: 600;">${goodsDTO.discountPrice}</span>
					<span>&ensp;원</span>
					</div>
					
				</div>

				<div id="goods_buttons">
					<div id="cartBtn" class="main_button">구매하기</div>				
				</div>
				<div style="width: 100%; height: 60px; display: inline-block;"></div>
			</div>
			<div style="width: 100%; height: 60px;"></div>
			<!-- 상품 소개 페이지 끝 -->
			
		</div>
	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var userId = "${memId}";
var productCode = ${goodsDTO.productCode};
var originalPrice = ${goodsDTO.originPrice};
var discountPrice = ${goodsDTO.discountPrice};
var showDiv = 0;

//장바구니 추가
$('#cartBtn').click(function(){
	
	if(userId==""){
		if(confirm("회원에게만 제공하는 서비스 입니다. 로그인하시겠습니까?")){
			location.href="/miniproject/user/loginForm";
		}
	}else{//회원
		
		$.ajax({	
			type: 'post',
			url: '/miniproject/cart/goods_cart_insert',
			data: {'userId': '${memId}',
				   'userEmail' : '${memEmail}',
				   'productCode': '${goodsDTO.productCode}',
				   'productName': '${goodsDTO.productName}',
				   'thumbImg': '${goodsDTO.thumbImg}',
				   'discountPrice': '${goodsDTO.discountPrice}',
				   'productQty' : $('#productQty').val()
				   },
			success : function(data){
				if(data=='success'){
					location.href = "/miniproject/cart/goods_cart";
				}else if(data=='fail'){
					alert("장바구니에 있는 상품입니다.");
					location.href="/miniproject/cart/goods_cart";
				}
			}
		}); //ajax		
	}	
});


//---------------------
//숫자가 아닌경우  유효성검사 필요
$('#productQty').focusout(function() {
	var input = $('#productQty').val();
	
	if (isNaN(input)==true) {
		alert("구매 수량은 숫자만 가능합니다.");
		$('#productQty').val("1");
		$('#priceSpan').text(discountPrice*1);
	}else if(isNaN(input)==false){
		$('#productQty').val(input);
		checkStock(productCode,$('#productQty'));
				
	}
	
});

//수량 변경 : 증가
$('#up').click(function() {
	var input = $('#productQty').val();
	input++;
	$('#productQty').val(input);
	$('#priceSpan').text(discountPrice*input);
	//checkStock(productCode,$('#productQty'));
}); 

//수량 변경 : 감소   
$('#down').click(function() {
	var input = $('#productQty').val();
	if (input > 1) {
		input--;
		$('#productQty').val(input);
		$('#priceSpan').text(discountPrice * input);
		//checkStock(productCode,input);
	}
});



</script>
