<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/goods_cart.css">

<form name="" method="post" action="" style="padding:30px;">
	<table class="mypage_table">
		<tr>
			<th>주문번호 </th>
			<td>${orderCode}<input type="hidden" id="orderCode" value="${orderCode}"></td>
		</tr>
		<tr>
			<th>주문날짜 </th>
			<td>${orderDate}</td>
		</tr>
		<tr>
	
		<tr>
			<td>
				<select name="sort" id="sort" >
					<option value="" selected>구분</option>
					<option value="교환">교환</option>
					<option value="환불">환불</option>
				</select>
			</td>
			<td>
				<select name="erReason" id="erReason">
					<option value="사유" selected>사유</option>
					<option value="배송지연">배송지연</option>
					<option value="포장불량">포장불량</option>
					<option value="상품불만족">상품불만족</option>
					<option value="상품불량">상품불량</option>
					<option value="서비스불만족">서비스불만족</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>		
		<tr>
			<td colspan="2">
			<br>
				<textarea id="erDetail" cols="110" rows="1" maxlength="100" placeholder="자세한 사유를 적어주세요(100자 이내)"></textarea>
			</td>
		</tr>
	</table>
	<hr><br>
	
	<table class="mypage_table">
      <tr id="mypage_table_top">
        <th ><!-- <input type="checkbox" id="all" checked> --> 선택</th>
        <th >상품정보(상품이름/이미지)</th>
        <th >주문수량</th>
        <th >교환/환불수량</th>
        <th >주문가격</th>
        <th >교환/환불가격</th>
        
      </tr>
      <c:forEach var="orderDTO" items="${list }" varStatus="status">
      <tr class="mypage_table_content review_content">
      	<td>
      		<!-- 선택 -->
      		<input type="checkbox" name="check" id="check_${status.count}" 
      		class="check" value="${orderDTO.productCode}" checked>      		
      		    
      	</td>
		<td id="productName">
			<!-- 상품정보(상품이름/이미지) -->
			<img id="thumbimg" src="../image/thumb/${orderDTO.thumbImg }">
			<br>${orderDTO.productName }
			
			<!-- 옵션이 있으면 옵션내용보이기 -->
			<br>
			<c:if test="${orderDTO.productOption ==1 }">
				${orderDTO.optionContent }
				<input type="hidden" id="optionContent_${status.count}" value="${orderDTO.optionContent}">
			</c:if>
		</td>
	    <td id="purchaseQty_${status.count}">
	    	<!-- 주문수량  -->
	    	${orderDTO.purchaseQty }개
	    	<input type="hidden" name="purchaseQty_${status.count}" value="${orderDTO.purchaseQty }">
	    </td>
	    <td>
		    <!-- 교환/환불가격 -->
	    	<input type="number" name="changeRefundQty" id="changeRefundQty_${status.count}" class="changeRefundQty" 
	    	style="text-align:right;" value="${orderDTO.purchaseQty }">개
	    </td>
	    <td id="totalPayment_${status.count}">
		    ${orderDTO.totalPrice }원
		    <!-- 주문가격 -->
		    <input type="hidden" name="eachPayment_${status.count}" value=" ${(orderDTO.totalPrice/orderDTO.purchaseQty) }">
	    </td>
	    <td>
	    	<!-- 교환/환불 -->
	    	<input type="text" id="changeRefundPayment_${status.count }" class="changeRefundPayment" 
	    	style="text-align:right;" value="${orderDTO.totalPrice }" readonly>원
	    </td>
      </tr>      
      </c:forEach>
      
      	<!-- 상품합계 부분 시작 -->
		<tr>
			<td colspan="10" style="padding: 30px 0;">
				<table width="100%" cellpadding="0" cellspacing="0" class="totalPriceArea">
					<tr class="totalPrice" style="padding-right: 0px;">
						<td style="border: none;">
							
							<font style="font-size:12px; color: #333; font-weight: 500;">
								상품합계금액(배송비별도)
							</font>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test='${totalPayment>=30000 }'>
								<font id="totalCost" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
									<%-- <fmt:formatNumber pattern="###,###,###" value="${totalPayment}"/> --%>	
									${totalPayment}							
								</font>
							</c:if>
							<c:if test='${totalPayment<30000 }'>
								<font id="totalCost" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
									<%-- <fmt:formatNumber pattern="###,###,###" value="${totalPayment}"/> --%>	
									${totalPayment-2500}							
								</font>
								<font id="deliveryCost" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
									(+2500)					
								</font>
							</c:if>
							<font style="font-size: 15px; color: #2ac1bc; font-weight: 700;">
								원
							</font>
							
						</td>
					</tr>
							
					<tr class="erPrice" style="visibility:hidden; padding-right: 0px;">
						<td style="border: none;">
							
							<font style="font-size:12px; color: #333; font-weight: 500;">
								환불금액(포인트제외)
							</font>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test='${totalPayment>=30000 }'>
								<font id="erTotalCost" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
									<%-- <fmt:formatNumber pattern="###,###,###" value="${totalPayment}"/> --%>	
									${totalPayment}	<%-- ${totalPayment+usePoint} --%>						
								</font>
							</c:if>
							<c:if test='${totalPayment<30000 }'>
								<font id="erTotalCost" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
								<%-- <fmt:formatNumber pattern="###,###,###" value="${totalPayment}"/> --%>	
								${totalPayment-2500} <%-- ${totalPayment-2500+usePoint}	 --%>							
								</font>
							</c:if>
							<font style="font-size: 15px; color: #2ac1bc; font-weight: 700;">
								원
							</font>
						</td>
					</tr>
					<tr class="usePoint" style=" padding-right: 0px;">
						<td style="border: none;">
							
							<font style="font-size:12px; color: #333; font-weight: 500;">
								사용한 포인트
							</font>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test='${usePoint>0 }'>
								<font id="usePoint" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
									${usePoint}							
								</font>
							</c:if>
							<c:if test='${usePoint<=0 }'>
								<font id="usePoint" style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
									0						
								</font>
							</c:if>
							<font style="font-size: 15px; color: #2ac1bc; font-weight: 700;">
								원
							</font>
						</td>
					</tr>			
				</table>		
			</td>
		</tr>
		<!-- 상품합계 부분 끝 -->		
    </table>
    <br>
    
    <div id="erBtn" class="mp_rv_pop_btn_div">
    <li  class="black_btn pop_btn">교환/환불신청</li>
  	</div>
    
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* //전체선택 / 해제
	$('#all').click(function(){//전체선택했을 때
		if($('#all').prop('checked')){
			$('.check').prop('checked',true);
		}else{
			$('.check').prop('checked',false);
		}
	}); */
	//숫자 3자리당 쉼표찍기
	function AddComma(number) {
		return Number(number).toLocaleString('en');
	}

	//콤마찍힌 숫자 정수형으로 변환
	function stringNumberToInt(stringNumber){
	    return parseInt(stringNumber.replace(/,/g , ''));
	}

	//환불일때만 환불금액보이도록
	$('#sort').on('change',function(){
		if($(this).val()=="환불"){
			$('.erPrice').css('visibility','visible');
			
		}else{
			$('.erPrice').css('visibility','hidden');
			
		}
			
	});
	
	//체크여부에 따라 환불금액 측정
	$('input:checkbox[name=check]:checked').click(function(){
		var erTotalCost=0;
		var checkbox = $('input:checkbox[name=check]:checked'); 
		checkbox.each(function(i){
			//체크한것환불금액체크
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			erTotalCost+=parseInt(td.eq(5).children('input').val(),10);
			//console.log(erCost);
		});
		
		$('#erTotalCost').text(erTotalCost);
	});
	
	//교환/환불수량 변경
	$('.changeRefundQty').on('propertychange change keyup paste input', function(){
		//구분자
		var status=$(this).attr('id').split("_");
		//구매수량
		var purchaseQty = $('input[name=purchaseQty_'+status[1]+']').val();
		//변한수량
		var changeRefundQty = $(this).val();		
		//기본가격
		var eachPayment= $("input[name=eachPayment_"+status[1]+"]").val();
		//변한수량만큼액수
		var changeRefundPayment = $('#changeRefundPayment_'+status[1]);
		
		//수량변화시 체크
		$('#check_'+status[1]).prop('checked',true);
		
		if(changeRefundQty>purchaseQty){
			alert("구매수량보다 많습니다.");
			$(this).val(purchaseQty);
			
		}else if(changeRefundQty==0){
			$('#check_'+status[1]).prop('checked',false);
			changeRefundPayment.val(0);
			
			var erTotalCost=0;
			var checkbox = $('input:checkbox[name=check]:checked'); 
			checkbox.each(function(i){
				//체크한것환불금액체크
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				
				erTotalCost+=parseInt(td.eq(5).children('input').val(),10);
				//console.log(erCost);
			});
			$('#erTotalCost').text(erTotalCost);
			
		}else if(changeRefundQty<0){
			alert("0개 이하는 환불할 수 없습니다.");
			$(this).val(0);
			changeRefundPayment.val(0);
			$('#check_'+status[1]).prop('checked',false);
			
		}else{
			changeRefundPayment.val(eachPayment*changeRefundQty);
			var erTotalCost=0;
			var checkbox = $('input:checkbox[name=check]:checked'); 
			checkbox.each(function(i){
				//체크한것환불금액체크
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				
				erTotalCost+=parseInt(td.eq(5).children('input').val(),10);
				console.log(erTotalCost);
			});
			$('#erTotalCost').text(erTotalCost);			
			
		}
	});
	
	//교환/환불버튼눌렀을시에
	$('#erBtn').on('click',function(){
		
		if($('.check').is(":checked")==false){
		//아무것도 물품을 선택하지 않았을때
			alert("교환/환불신청할 상품이 선택되지 않았습니다.");
			
		}else{
			//체크했을때
			var checkbox = $('input:checkbox[name=check]:checked'); 
			var orderCode = $('#orderCode').val();
			var erCostList = "";
			var productCodeList ="";
			var optionContentList ="";
			var changeRefundQtyList="";		
			
			checkbox.each(function(i){
				
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				
				//상품코드,옵션내용,교환/환불수량
				var productCode = td.eq(0).children('input').val();
				productCodeList+=productCode+",";
				var optionContent = td.eq(1).children('input').val();
				optionContentList+=optionContent+",";
				var changeRefundQty = td.eq(3).children('input').val();
				changeRefundQtyList+=changeRefundQty+",";
				var erCost = td.eq(5).children('input').val();
				erCostList+=erCost+",";
			});
			
			//console.log("주문코드="+orderCode+" 상품코드="+productCodeList+" 옵션내용="+optionContentList+" 교환환불수량="+changeRefundQtyList);
			
			if($("select[name='sort'] ").val()=="교환"){
				//교환일때
				if($("select[name='erReason'] ").val()=="사유"){
					alert("사유를 선택해주세요.");
					$('#erReason').focus();
				}else{
					var erReason = $("select[name='erReason'] ").val();
					var erDetail=$('#erDetail').val();
					
					$.ajax({
						type:'post',
						url:'../order/orderExchange.do',
						data:{'orderCode':orderCode,
							'erReason':erReason,
							'erDetail':erDetail,
							'productCodeList':productCodeList,
							'optionContentList':optionContentList,
							'changeExchangeQtyList':changeRefundQtyList},
						success : function(data){
							if(data=='ok'){
								alert("교환을 성공했습니다.");
								opener.location.reload();
								window.close();
								
							}
							
						}//success
					});//ajax
				}
				

				
			}else if($("select[name='sort'] ").val()=="환불"){
				//환불일때
				if($("select[name='erReason'] ").val()=="사유"){
					alert("사유를 선택해주세요.");
					$('#erReason').focus();
				}else{
					var erReason = $("select[name='erReason'] ").val();
					var erTotalCost = $('#erTotalCost').text().trim();
					var usePoint = $('#usePoint').text().trim();
					var erDetail=$('#erDetail').val();
					
					$.ajax({
						type:'post',
						url:'../order/orderRefund.do',
						data:{'orderCode':orderCode,
							'erReason':erReason,
							'erDetail':erDetail,
							'erTotalCost':(erTotalCost-usePoint),
							'erCostList':erCostList,
							'productCodeList':productCodeList,
							'optionContentList':optionContentList,
							'changeRefundQtyList':changeRefundQtyList},
						success:function(data){
							if(data=='ok'){
								alert("환불을 성공했습니다.");
								opener.location.reload();
								window.close();
								
							}
							
						}
					});//ajax
				}
				
				
			}else{
				alert("교환/환불 선택해주세요.");
				$('#sort').focus();
			}
			
		}
		
	});
	
});//ready

</script>










