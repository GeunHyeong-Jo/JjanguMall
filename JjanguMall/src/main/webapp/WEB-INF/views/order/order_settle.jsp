<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="indiv2" style="width:1000px; margin-top:135px;" ><!-- Start indiv -->
	<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222;">
		결제하기
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
		<tbody id="tbody">	
		<c:set var="total" value="0" />
		<c:forEach var="orderlistAndProductDTOs" items="${list }" varStatus="status">	
			<tr>
				<c:set var="total" value="${total + orderlistAndProductDTOs.price * orderlistAndProductDTOs.count }" />
				<td style="vertical-align:top; padding: 30px 0;">
					<a href="#" style="margin-bottom:0;">
					<img src="${pageContext.request.contextPath }/assets/image/thumb/${orderlistAndProductDTOs.img }.jpg" style="width: 70px;"></a>
				</td>
				<td class="order_option" style="text-align:left;vertical-align:top; ">
					<div style="color: #222; height:auto; font-weight: 700; font-size: 14px; padding: 30px 0; margin:20px 0 20px 0;">${orderlistAndProductDTOs.name }</div>
				</td>
				<td style="color: #222; vertical-align:middle; padding: 30px 50px 30px 0; text-align:right;">${orderlistAndProductDTOs.price }<span>원</span></td>
				<td style="vertical-align: middle; padding: 22px 0 30px 0;">
					<div style="padding-top: 8px; vertical-align: middle; color:#222;">${orderlistAndProductDTOs.count }<span>개</span></div>
				</td>
				<td class="totalPrice" tyle="vertical-align: middle; color:#333; text-align:right; padding: 30px 20px 0 0; font-weight:700; ">
				<f:formatNumber pattern="###,###,###" value="${orderlistAndProductDTOs.price * orderlistAndProductDTOs.count }" /><span>원</span></td>
				
			</tr>
			</c:forEach>		
		</tbody>
		
		<tfoot id="tfooter">
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
			<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문정보확인</h5>
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
						      <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">주문자 이름:</td>
						      <td id="userName" class="box_sub_tit" style=" font-size: 13px; color: #666; padding-top: 5px; ">${userDTO.userName }</td>
						    </tr>
				   
							<tr>
								<td class="box_sub_tit" style="font-size: 13px; color: #666;">주문자 핸드폰 :</td>
								<td id="userPhone" class="box_sub_tit" style="font-size: 13px;color: #666; padding-top: 5px; ">${userDTO.cellNumber }</td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666;">이메일 :</td>
					            <td id="userEmail" class="box_sub_tit" style=" font-size: 13px; color: #666;" >${userDTO.email }</td>
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
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">받는 분 이름:</td>
				            <td id="receiverName" class="box_sub_tit" style="font-size: 13px; color: #666;">${rName }</td>
				          </tr>
				          
				           <tr>
				             <td class="box_sub_tit" style="font-size: 13px; color: #666;">핸드폰번호 :</td>
				            <td id="receiverPhone" class="box_sub_tit" style="font-size: 13px; color: #666;">${rPhone }</td>
				          </tr>
				          
				          <tr>
				             <td class="box_sub_tit" style="font-size: 13px; color: #666;">우편번호 :</td>
				            <td id="receiverZipcode" class="box_sub_tit" style="font-size: 13px; color: #666;">${rZipcode }</td>
				            
				          </tr>
				          <tr>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">주소 : </td>
				            <td id="receiverAddr" class="box_sub_tit" style="font-size: 13px; color: #666;">${rAddress}</td>
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
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">총 주문 금액 : </td>
				            <td>
				            	<span id="totalPayment1" style="font-size: 13px; color: #666;"><f:formatNumber pattern="###,###,###" value="${total}"/>원</span>
				            </td>
				          </tr>
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">배송비 : </td>
				            <td>
				            <span id="del1">+</span>
				            <span id="deliveryFee" class="box_sub_tit" style="font-size: 13px; color: #666;"></span>
				            <span id="del2">원</span>
				            </td>
				        </tr>
						
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">결제금액 : </td>
				            <td>
				            <span id="totalAmount" style="font-size: 13px; color: #666;"><f:formatNumber pattern="###,###,###" value=""/>원</span>
				            </td>
				       </tr>		        
		        	</tbody>
		        </table>
		      </td>
		    </tr>
	
		 </table>
	
		
		<!--  다음 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
			      <tr>
			        <td align="center" height="100">
			          <div style="width:100%" class="noline">
			            
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="button" id="payBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="확인">			
						</div>					
			          </div>
			        </td>
			      </tr>
		    </tbody>
		</table>

</div>
<!-- indiv 끝 -->


<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
var totalP = "${total}";	
var prdArray = new Array();
var prdQtyArray = new Array();

	
	//총주문금액
	$('#totalAmount').text(AddComma(totalP));
	
	//배송비 및 총 결제 금액
	var totalPayment = 0;
	if(totalP >= 30000) { //배송비 없음
		$('#del1').text("+ ")
		$('#del2').text(" 원(조건부 무료)")
		$('#deliveryFee').text("0");
		totalPayment = stringNumberToInt(totalP);
		$('#totalAmount').text(AddComma(totalPayment));
		$('#totalPayment2').text(AddComma(totalPayment));
		
	}
	else { //배송비 2500원
		$('#del1').text("")
		$('#del2').text("")
		$('#deliveryFee').text(AddComma(2500));
		totalPayment = stringNumberToInt(totalP)+ 2500;
		$('#totalAmount').text(AddComma(totalPayment));
		$('#totalPayment2').text(AddComma(totalPayment));
	}
		
	


	$('#payBtn').click(function(){
			
			alert("상품구매가 완료되었습니다! 좋은 하루 되세요");
			location.href="${pageContext.request.contextPath }";
		
	});//결제버튼
});


//숫자 3자리당 쉼표찍기
function AddComma(number) {
	return Number(number).toLocaleString('en');
}

//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}

</script>