<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="indiv"><!-- Start indiv -->
	<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222; padding-top: 10px;">
		주문하기
	</div>
	
	<div style="margin: 30px 0 0 0;">
		<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문상세내역</h5>
	</div>
	
	<!-- 주문상세내역 -->
	<table width="100%" cellpadding="0" cellspacing="0" border="0" class="table_tit_style02" style="margin-top: 15px;">
		
		<thead>
			<tr>
				<th colspan="2" style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: left; padding-left: 15px; font-weight:500;">상품정보</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: right; padding-right:50px;">판매가</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; font-weight:500;">수량</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: right; padding-right:20px; font-weight:500;">합계</th>
			</tr>
		</thead>
		
		<c:set var="total" value="0" />
		<c:forEach var="cartDTO" items="${list }" varStatus="status">
		
		<tbody>		
			<tr>
				<td style="vertical-align:top; padding: 30px 0;">
					<a href="#" style="margin-bottom:0;">
					<img src="${pageContext.request.contextPath }/assets/image/thumb/${cartDTO.thumbImg }" width="70"></a>
				</td>
			
				<td class="ta_l order_option" style="text-align:left;vertical-align:top; padding: 30px 0;">
					<div style="color: #222; font-weight: 700; font-size: 14px;">${cartDTO.productName}</div>
						
				</td>
				<td style="color: #222; vertical-align:top; padding: 30px 50px 30px 0; text-align:right;"><f:formatNumber pattern="###,###,###" value="${cartDTO.discountPrice }" />원
				</td>
				<td style="vertical-align:top; padding: 22px 0 30px 0;">
					<div style="padding-top: 8px; vertical-align: top; color:#222;">${cartDTO.productQty }개</div>
				</td>
			
				<td style="vertical-align:top; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;">
				<f:formatNumber pattern="###,###,###" value="${cartDTO.discountPrice * cartDTO.productQty }" />원</td>
				
				<c:set var="total" value="${total + cartDTO.discountPrice * cartDTO.productQty }" />
			</tr>			
		</tbody>		
		</c:forEach>
		
		<tfoot>
			<tr>
				<td colspan="10" style="padding: 30px 0;">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="total_price_area">
						<tbody>
							<tr class="total_price" style="padding-right: 0px;">
								<td>
									<font style="color:#333;font-weight:500;">상품합계금액 (배송비 별도)</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<font id="totalPrice" style="font-family:'Montserrat', sans-serif; font-size:24px; color:#FFA7A7; font-weight:700;">
										<f:formatNumber pattern="###,###,###" value="${total}"/>원
									</font>
																
								</td>
							</tr>
						</tbody>
					
					
					</table>
				</td>
			</tr>
		</tfoot>
	</table>
	
	
	<form id="orderForm" method="post" action="" onsubmit="return chkOrder('${memId}');">
	
		<div style="margin: 30px 0 0 0;">
			<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문서 작성</h5>
		</div>
		
		<!-- 주문자 정보 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
			style="background-color: #fff; margin-bottom:20px; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr>
			    <td class="box_tit" style="font-size: 15px; color: #333; font-weight:700;">주문자정보</td>
			</tr>
			<tr>
				<td>
				  	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
						<tbody>
						    <tr>
						      <td class="box_sub_tit" style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 5px;">주문하시는분 :</td>
						      <td style="padding-top: 5px;">
						           <input type="text" name="userName" id="userName" value="${userDTO.userName }" readonly required>
						
							     
						     </td>
						    </tr>
				   
							<tr>
								<td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">주문자 핸드폰 :</td>
								<td style="padding:5px 0">
								   <input type="text" name="userPhone" id="userPhone" value="${userDTO.userPhone}" size="12" maxlength="11" required label="주문자 핸드폰번호" 
								   style="width:150px;">
								   
								</td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">이메일 :</td>
					            <td style="padding:5px 0">
					              <input type="text" name="userEmail" id="userEmail" value="${userDTO.userEmail }" required
					              style="width:211px;">
					            </td>
				          	</tr>
			               </tbody>
			       	 </table>
				</td>
			</tr>
		
		</table>
	
		<!-- 배송 정보 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr class="box_tit">
			      <td style="font-size: 15px; color: #333; font-weight:700;">배송정보</td>
			</tr>
			<tr>
			      <td>
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          <tbody>
				         
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;padding: 15px 0 5px 0;">받으실분 :</td>
				            <td style="padding: 15px 0 5px 0;">
				              <input type="text" name="receiverName" id="receiverName" value="" required 
				              style="width:205px;">
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">받으실곳 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverZipcode" id="receiverZipcode" size="5" readonly required
								style="width:100px;" >
				              
				              <div class="sub-button-s" onclick="daumCheckPost()"
				              style="text-align:center; width: 112px;height: 42px;position: absolute; margin: -40px 0 0 120px;line-height: 42px; font-size: 12px;" align="absmiddle">우편번호 검색</div>
				            </td>
				            
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverAddr1" id="receiverAddr1" 
				              style="width:400px; " required readonly>
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverAddr2" id="receiverAddr2" label="세부주소"
				              style=" width:345px; ">
				              <div style="padding:5px 0 0 1px;font:12px dotum;color:#999;" id="div_road_address_sub"></div>
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0"></td>
				          </tr>
						  <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">핸드폰번호 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverPhone" id="receiverPhone" size="12" maxlength="11" required label="수령자 핸드폰번호" 
				              style="width:150px;">
				            
				            </td>
				          </tr>
				          
			          	 
				          <tr id="paper_delivery_menu">
				            <td style="font-size: 13px; color: #666; font-weight:normal;">배송선택 :</td>
				            <td style="padding:5px 0; font-size: 13px; color: #333; font-weight:normal;">
				              <input type="radio" name="deliveryOption" value="0" checked style="height: 14px; border-color: #fff;">기본배송
				            </td>
				          </tr>
				          
				         
			          	</tbody>
			          </table>
			  
			      </td>
			</tr>
		</table>
	
		
		<!-- 결제 금액 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr class="box_tit">
			   <td style="font-size: 15px; color: #333; font-weight:700;">결제금액</td>
			</tr>
			
		    <tr>
		      <td>	    
		        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
		        	<tbody>
			        	<tr>
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">상품합계금액 :</td>
				            <td class="noline" style="font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">
				              <span id="goodsPrice"><f:formatNumber pattern="###,###,###" value="${total}"/></span><span id="paper_goodsprice" style="font-weight:normal; color:#333;">원</span>
				            </td>
			          	</tr>
						<tr>
							<c:if test="${total < 30000 }">
							<td style="font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">배송비 :</td>
							<td class="noline" style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
								<div id="" style="display: block;">+ <span id="paper_delivery" style="font-weight:normal; color:#333;">2,500</span> 원</div>
								
							</td>
							</c:if>
							<c:if test="${total >= 30000 }">
							<td style="font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">배송비 :</td>
							<td class="noline" style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
								<div id="" style="display: block;">+ <span id="paper_delivery" style="font-weight:normal; color:#333;">0</span> 원</div>
							</td>
							</c:if>
						</tr>
						
		          <tr>
		            <td style="font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">총 결제금액 :</td>
		            <td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
			            <c:if test="${total < 30000 }">
			            <span id="totalP" style="width:146px; text-align:right; font-size:28px; color:#2ac1bc; font-weight:700; 
			            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;">
			            
			            <f:formatNumber pattern="###,###,###" value="${total+2500}"/></span>
			            
			            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
		            	</c:if>
		            	<c:if test="${total >= 30000 }">
		            	<span id="totalP" style="width:146px; text-align:right; font-size:28px; color:#2ac1bc; font-weight:700; 
			            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;">
			            
			            <f:formatNumber pattern="###,###,###" value="${total}"/></span>
			            
			            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
			            </c:if>
		            </td>
		          </tr>
		        </tbody>
		        </table>
		      </td>
		    </tr>
	
		 </table>
	
		<!-- 결제 수단 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 10px 40px; border: 1px solid #ddd;">
		    <tbody>
			    <tr class="box_tit">
			      <td style="font-size: 15px; color: #333; font-weight:700;">결제수단</td>
			    </tr>
			    <tr>
			      <td>
			    
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          
			          <tbody>
				          <tr>
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">일반결제 :</td>
				            <td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
				              <input type="radio" name="payType" value="0" style="height: 14px; border-color: #fff;" checked> 신용카드&nbsp;&nbsp;&nbsp;&nbsp;
				              <input type="radio" name="payType" value="1" style="height: 14px; border-color: #fff;"> 핸드폰&nbsp;&nbsp;&nbsp;&nbsp;
				            </td>
				          </tr>
		       	 	  </tbody>
		        	</table>
		          </td>
				</tr>
			</tbody>		
		</table>
	
		
		<!-- 취소 / 다음 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
			      <tr>
			        <td align="center" height="100">
			          <div style="width:100%" class="noline">
			            <div style="width: 180px; display: inline-block;">
			            	<div onclick="location.href='${pageContext.request.contextPath }/order/orderCancle'" class="sub-button-s" 
							style="text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;">취소</div>			            
			            </div>
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="button" id="orderWriteBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="다음">			
						</div>					
			          </div>
			        </td>
			      </tr>
		    </tbody>
		</table>
		
	</form>

</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
	
 	var thumbImg = '${thumbImgList}';
 	var thumbImgArray = thumbImg.split(",");
	var productCode = '${productCodeList}';
	var productCodeArray = productCode.split(",");
	var productName = '${productNameList}';
	var productNameArray = productName.split(",");
	var discountPrice = '${discountPriceList}';
	var discountPriceArray = discountPrice.split(",");
	var purchaseQty = '${purchaseQtyList}';
	var purchaseQtyArray = purchaseQty.split(",");
		
});

//다음 주소 API
function daumCheckPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
       
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
         	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	addr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                	addr += (addr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                                 
            } else {
                document.getElementById("receiverAddr1").value = '';
            }
          
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('receiverZipcode').value = data.zonecode;
            document.getElementById("receiverAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("receiverAddr2").focus();
        }
    }).open();
}

//숫자 3자리당 쉼표찍기
function AddComma(number) {
	return Number(number).toLocaleString('en');
}

//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}


//다음 버튼 이벤트
$('#orderWriteBtn').click(function(){

	//유효성검사
	if($('#receiverZipcode').val()==''){
		alert("주소를 입력해주세요");
		$('#receiverZipcode').focus();
		return false;
	}else if($('#receiverAddr2').val()==''){
		alert("세부주소를 입력해주세요.");
		$('#receiverAddr2').focus();
		return false;
	}
	//user정보 및 배송정보
	
	$.ajax({
		type : 'POST',
		url : '/miniproject/order/updateUserInfo',
		async: false,
		data : {'userId'			: '${memId}',
				'userName'			: '${memName}',
				'userPhone'			: $('#userPhone').val(),
				'userEmail'			: $('#userEmail').val(),
				'receiverName' 		: $('#receiverName').val(),
				'receiverAddr1' 	: $('#receiverAddr1').val(),
				'receiverAddr2' 	: $('#receiverAddr2').val(),
				'receiverZipcode' 	: $('#receiverZipcode').val(),
				'receiverPhone' 	: $('#receiverPhone').val()
		},
		success : function(data){
			if(data == "success"){
				//alert("고객배송정보보내기 성공");
			}
			else {
				//alert("실패!!");
			}
		}
	});
	
	var thumbImg = '${thumbImgList}';
 	var thumbImgArray = thumbImg.split(",");
	var productCode = '${productCodeList}';
	var productCodeArray = productCode.split(",");
	var productName = '${productNameList}';
	var productNameArray = productName.split(",");
	var discountPrice = '${discountPriceList}';
	var discountPriceArray = discountPrice.split(",");
	var purchaseQty = '${purchaseQtyList}';
	var purchaseQtyArray = purchaseQty.split(",");


	//상품정보 : orderDB
	for(i = 0 ; i < thumbImgArray.length-1 ; i++){
		
		$.ajax({
			type : 'POST',
			url : '/miniproject/order/setOrderInfo',
			async: false,
			data : {'userId' 		: '${memId}',
					'userName' 		: '${userDTO.userName}',
					'thumbImg' 		: thumbImgArray[i],
					'productCode' 	: productCodeArray[i],
					'productName'	: productNameArray[i],
					'discountPrice' : discountPriceArray[i],
					'purchaseQty' 	: purchaseQtyArray[i],
					'totalPrice'	: discountPriceArray[i] * purchaseQtyArray[i],
					'paymentType' 	: $('input[name="payType"]:checked').val()*1,
					'totalPayment' 	: stringNumberToInt($('#totalP').text())
					},
			dataType : 'text',
			success : function(data){
				if(data == "success"){
					//alert("주문정보보내기 성공");
				}
				else {
					//alert("실패!!");
				}
			}

		});
	}
	location.href = "/miniproject/order/order_settle?checkedValueStr=${checkedValueStr}";
});

//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}
</script>




