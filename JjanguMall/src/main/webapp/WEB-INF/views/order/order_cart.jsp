<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <form id="orderForm" method="post" action="${pageContext.request.contextPath }/order/order_settle" >
    <input type="hidden"  name="checkedValueStr" value="${checkedValueStr}">
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
					<img src="${pageContext.request.contextPath }/assets/image/thumb/${cartDTO.img }.jpg" width="70"></a>
				</td>
			
				<td class="ta_l order_option" style="text-align:left;vertical-align:top; padding: 30px 0;">
					<div style="color: #222; font-weight: 700; font-size: 14px;">${cartDTO.name}</div>
						
				</td>
				<td style="color: #222; vertical-align:top; padding: 30px 50px 30px 0; text-align:right;"><f:formatNumber pattern="###,###,###" value="${cartDTO.price }" />원
				</td>
				<td style="vertical-align:top; padding: 22px 0 30px 0;">
					<div style="padding-top: 8px; vertical-align: top; color:#222;">${cartDTO.count }개</div>
				</td>
			
				<td style="vertical-align:top; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;">
				<f:formatNumber pattern="###,###,###" value="${cartDTO.price * cartDTO.count }" />원</td>
				
				<c:set var="total" value="${total + cartDTO.price * cartDTO.count }" />
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
								   <input type="text" name="userPhone" id="userPhone" value="${userDTO.cellNumber}" size="12" maxlength="11" required label="주문자 핸드폰번호" 
								   style="width:150px;">
								   
								</td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">이메일 :</td>
					            <td style="padding:5px 0">
					              <input type="text" name="userEmail" id="userEmail" value="${userDTO.email }" required
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
				              <input type="text" name="rName" id="receiverName" required 
				              style="width:205px;">
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">받으실곳 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="rZipcode" id="receiverZipcode" size="5" readonly required
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
				              <input type="text" name="rPhone" id="receiverPhone" size="12" maxlength="11" required label="수령자 핸드폰번호" 
				              style="width:150px;">
				            
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
			            <input type="hidden" name="totalPrice" value="${total+2500}">
			            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
		            	</c:if>
		            	<c:if test="${total >= 30000 }">
		            	<span id="totalP" style="width:146px; text-align:right; font-size:28px; color:#2ac1bc; font-weight:700; 
			            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;">
			            
			            <f:formatNumber pattern="###,###,###" value="${total}"/></span>
			            <input type="hidden" name="totalPrice" value="${total}">
			            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
			            </c:if>
		            </td>
		          </tr>
		        </tbody>
		        </table>
		      </td>
		    </tr>
	
		 </table>
	
		
		<!-- 취소 / 다음 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
			      <tr>
			        <td align="center" height="100">
			          <div style="width:100%" class="noline">
			            <div style="width: 180px; display: inline-block;">
			            	<div onclick="location.href='${pageContext.request.contextPath }/cart/goods_cart'" class="sub-button-s" 
							style="text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;">취소</div>			            
			            </div>
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="submit" id="orderWriteBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="결제">			
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




//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}
</script>




