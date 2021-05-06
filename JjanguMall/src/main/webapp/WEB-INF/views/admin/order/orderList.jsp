<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
.order_search th{
	width: 154px;
	height: 35px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.order_search td{
	width: 700px;
	padding-left: 10px;
}

#searchBtn{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
	color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#orderSeach_list th{
	height: 53px;
	font-weight: 500;
}

.order_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}

.tbl_button {
    width:55px;
    height:25px;
    background-color: #1B87D4;
    border: none;
    color:#fff;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    cursor: pointer;
    border-radius:10px;
}

.tbl_button:hover {
    background-color: #f8585b;
}


#order_searchBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#order_resetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}

#orderSeach_list th{
	font-weight: 500;
    background-color: #f5f4f4;
}
.oreder_search input{
	padding-left: 10px;
}
#orderTable{
	 width:100%;
	 border: 1px solid #d9dadc; 
	 border-spacing: 0; 
	 line-height: 1.5;
}
#orderTable select{
	width: 80px;
	height: 27px;
}
#order_selectDiv{
	width: 100%;
	padding-bottom: 10px;
	overflow: auto;
}

#selDelete{
	width: 100px;
	height: 35px;
    padding: 0 20px;
    font-size: 14px;
	font-weight: normal;
    cursor: pointer;
	color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}
#selDelete:hover{
   background-color:#1b87d4;
   color:#ffffff;
}

#order_state{
	width: 150px;
	height: 35px;
    padding: 0 5px;
    font-size: 14px;
	font-weight: normal;
}
.searchKeyword{
	height: 23px;
	padding-left: 5px;
}
.searchPeriod{
	height: 23px;
	padding-left: 5px;
}
.orderList_tr{
	background-color: #fff;
}
.orderList_tr:hover{
	background-color: #eef;
	color : #1b87d4;
}

#orderManagerPagingDiv{
	width: 1000px;
	float: left;
	text-align: center;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0,0,0); /* Fallback color */
	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
    
	/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    max-width: 100%; /* Could be more or less, depending on screen size */     
     width: auto; display: table;                   
}

.modalDiv{
	width:185px;
	cursor:pointer;
	background-color:#DDDDDD;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	margin: 0 15px 0 15px;
}
</style>
</head>
<body>
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">	
	<div id="order_search_wrap" style="width: 1200px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 id="orderManager" style="font-weight:normal; display:inline-block;cursor:pointer;">주문관리</h1>
			&ensp;&ensp;
			<h1 id="orderRegister" style="font-weight:normal; display:inline-block;cursor:pointer;">주문등록</h1>
		</div>
		
		<form id="orderSearchForm">
			<div class="order_search" align="left">
				<table border="1" id="orderTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select id="searchKeywordOption">
								<option value="orderCode">주문번호</option>
								<option value="userName">주문자명</option>
								<option value="userId">주문자 ID</option>
							</select>
							<input type="text" id="searchKeyword" class="searchKeyword" style="width: 250px;">
						</td>
					</tr>
					
					<tr>
						<th>기  간</th>
						<td>
							<input type="button" id="today" class="searchPeriod" style="width: 60px;" value="오늘">
							<input type="button" id="threeday" class="searchPeriod" style="width: 60px;" value="3일">
							<input type="button" id="week" class="searchPeriod" style="width: 60px;" value="7일">
							<input type="button" id="onemonth" class="searchPeriod" style="width: 60px;" value="1개월">
							<input type="button" id="sixmonth" class="searchPeriod" style="width: 60px;" value="6개월">
							&ensp;
							<select id="startYear" name="startYear" class="inputPeriod" style="width: 60px;">
							    <option value="2017" >2017</option>
							    <option value="2018" >2018</option>
							    <option value="2019" selected >2019</option>
							</select>
							<select id="startMonth" name="startMonth" class="inputPeriod" style="width: 60px;">
							 <option value="">월</option>
						     <c:forEach begin="1" end="12" var="i" step="1">
							  <option value="<c:out value="${i}"/>">${i}</option>
						     </c:forEach>
							</select>
							<select id="startDay" name="startDay" class="inputPeriod" style="width: 60px;">
							 <option value="">일</option>
						     <c:forEach begin="1" end="31" var="i" step="1">
							  <option value="<c:out value="${i}"/>">${i}</option>
							 </c:forEach>
							</select>
							&nbsp;~&nbsp;
							<select id="endYear" name="endYear" class="inputPeriod" style="width: 60px;">
								<option value="2017" >2017</option>
							    <option value="2018" >2018</option>
							    <option value="2019" selected >2019</option>
							</select>
							<select id="endMonth" name="endMonth" class="inputPeriod" style="width: 60px;">
							 <option value="">월</option>
						     <c:forEach begin="1" end="12" var="i" step="1">
						      <option value="<c:out value="${i}"/>">${i}</option>
							 </c:forEach>
							</select>
							<select id="endDay" name="endDay" class="inputPeriod" style="width: 60px;">
							 <option value="">일</option>
						     <c:forEach begin="1" end="31" var="i" step="1">
							  <option value="<c:out value="${i}"/>">${i}</option>
						     </c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>주문상태</th>
						<td>
							<input type="radio" name="orderState" value="" checked>&nbsp;전체&emsp;
							<input type="radio" name="orderState" value="0">&nbsp;주문취소&emsp;
							<input type="radio" name="orderState" value="1">&nbsp;주문접수&emsp;
							<input type="radio" name="orderState" value="2">&nbsp;배송준비&emsp;
							<input type="radio" name="orderState" value="3">&nbsp;배송중&emsp;
							<input type="radio" name="orderState" value="4">&nbsp;배송완료&emsp;
							<input type="radio" name="orderState" value="5">&nbsp;주문완료
						</td>
					</tr>
					<tr>
						<th>교환/환불</th>
						<td>
							<input type="radio" name="erState" value="" checked >&nbsp;전체&emsp;
							<input type="radio" name="erState" value="교환접수">&nbsp;교환접수&emsp;
							<input type="radio" name="erState" value="교환완료">&nbsp;교환완료&emsp;
							<input type="radio" name="erState" value="환불접수">&nbsp;환불접수&emsp;
							<input type="radio" name="erState" value="환불완료">&nbsp;환불완료
						</td>
					</tr>
					<tr>
						<th>회원구분</th>
						<td>
							<input type="radio" name="userClass" value="" checked>&nbsp;전체&emsp;
							<input type="radio" name="userClass" value="회원">&nbsp;회원&emsp;
							<input type="radio" name="userClass" value="kokonut0">&nbsp;비회원
						</td>
					</tr>
					
				</table>
				<div align="center" style="margin:10px 0 10px 0;">
					<div id="order_search_div"></div>
				</div>
				<div style="margin-top: 15px" align="center">
					<input type="button" id="order_searchBtn" class="order_btn_group" value="검 색">
					<input type="reset" id="order_resetBtn" class="order_btn_group" value="초기화">
				</div>
				
			</div>
		</form>
		
		<form name="orderList_actionForm">
		<input type="hidden" id="pg" name="pg" value="${pg }">
		<div id="orderSeach_list" align="left" style="margin-top: 50px;">
			<div id="order_selectDiv">
				<input type="button" id="selDelete" value="선택 삭제" onclick="selectDelete()"/>
			</div>
			
			<table id="orderList_table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 3%;">
						<input type="checkbox" id="check_all" style="cursor:pointer;">
					</th>	
					<th style="width: 10%;">주문일</th>
					<th style="width: 9%;">주문번호</th>
					<th style="width: 25%;">상품이름</th>
					<th style="width: 9%;">주문자</th>
					<th style="width: 8%;">결제금액</th>
					<th style="width: 8%;">주문상태</th>
					<th style="width: 8%;">취소처리</th>
					<th style="width: 10%;">교환/환불상태</th>
					<th style="width: 10%;">교환/환불상세</th>
				</tr>
			</table>
			<br>
			<div id="orderManagerPagingDiv"></div>
			<br><br><br><br>
		</div>
		</form>
				
		<!-- 선택 갱신 시 확인&취소 / Modal -->
	    <div id="open_changeConfirmModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">주문상태 갱신</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">선택된 주문의 주문상태를 갱신하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="changeConfirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="changeConfirmClose_Modal" style="float:right;">
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>
		</div>
		
  		<!--End Modal-->
		 <!-- 선택 삭제 시 확인&취소 / Modal -->
	    <div id="open_deleteConfirmModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">주문삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">정말  삭제 하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="deleteConfirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="deleteConfirmClose_Modal" style="float:right;">				
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>
		</div>
  		<!--End Modal-->
  		
		<!-- 체크박스 선택 X / Modal -->
		<div id="open_nonCheckModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">	
				<p style="text-align: center;"><span style="font-size: 14pt;"><b><span id="noneCheck_modal" style="font-size: 24pt;"></span></b></span></p>
                <p id="stateNoneSelect" style="text-align: center; line-height: 1.5; color: red;"><br />항목을 선택해 주세요</p>
                <p><br /></p>
            	<div class="close_Modal" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
               		<span class="pop_bt" style="font-size: 13pt;" >
                   	 	 닫기
                	</span>
            	</div>
     		</div>
		</div>
    	 <!--End Modal-->
		
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

/* 숫자탭 컴마 추가 */
function addComma(num) {
 var regexp = /\B(?=(\d{3})+(?!\d))/g;
 return num.toString().replace(regexp, ',');
}

$(document).ready(function(){
	//orderlist loading
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/getOrderList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				if(items.orderState==0)
					var orderState = '주문취소';
				else if(items.orderState==1)
					var orderState = '주문접수';
				else if(items.orderState==2)
					var orderState = '배송준비';
				else if(items.orderState==3)
					var orderState = '배송중';
				else if(items.orderState==4)
					var orderState = '배송완료';
				else if(items.orderState==5)
					var orderState = '주문완료';
						
				//상품이름 외 x건 출력
				var orderProductName="";
				var orderProductAmount = 0;
				
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/admin/getOrderProduct.do',
					data : {'orderCode' : items.orderCode},
					dataType : 'json',
					success : function(pData){
						//alert(JSON.stringify(pData));
						
						$.each(pData.pName, function(pIndex, pItems){
							if(orderProductAmount==0){
								orderProductName = pItems.productName;
								orderProductAmount++;
							}else{
								orderProductAmount++;
							}
						
						});
						$('.order_product'+index).append($('<span/>', {
							text : orderProductName + ' 포함 ' + orderProductAmount + ' 건' 
						}).append('<br>')).append($('<button/>',{
							class : 'pDetail_button tbl_button',
							id : items.orderCode,
							type : 'button',
							text : '상세보기'
						}));
					}
				});
				//alert(orderProductName);
				$('<tr/>', {
					class : 'orderList_tr'
				}).append($('<td/>',{
					align : 'center'
					}).append($('<input/>', {
						type : 'checkbox',
						value : items.orderCode,
						name : 'check',
						class : 'check',
						style : 'cursor : pointer;'
				}))).append($('<td/>', {
					align : 'center',
					text : items.orderDate
				})).append($('<td/>', {
					align : 'center',
					class : 'productDetail',
					id : items.orderCode,
					text : items.orderCode,
					style : 'cursor : pointer;'
				})).append($('<td/>', {
					align : 'center',
				 	style : 'text-align:center; cursor :pointer;',
					class : 'productDetail order_product'+index,
					id : items.orderCode
				})).append($('<td/>', {
					align : 'center',
					text : items.userName + '(' + items.userId + ')' 
				}).css('padding', '0 5px')).append($('<td/>', {
					align : 'right',
					id : 'totalPayment_td',
					text : items.totalPayment + '원',
					style : 'padding-right: 5px;'
				})).append($('<td/>', {
					align : 'center',
					text : orderState					
				}).append('<br>').append($('<span/>',{
					class : 'whoCancel',
					id : 'whoCancel'+ items.orderCode
				}))).append($('<td/>',{
					align : 'center'
				}).append($('<button/>',{
					class : 'cancel_button tbl_button',
					id : 'cancel_button'+items.orderCode,
					type : 'button',
					text : '처리',
				}))).append($('<td/>',{
					align : 'center',
					text : items.erState,
					id : 'erState'+ items.orderCode
				})).append($('<td/>',{
					align : 'center'
				}).append($('<button/>',{
					class : 'erDetail_button tbl_button',
					id : 'erDetail'+items.orderCode,
					type : 'button',
					text : '상세'
				}))).appendTo($('#orderList_table'));
			
				
				changeByState(items.orderState, items.whoCancel, items.erState, items.orderCode);
			
			
			});//each
			
			//페이징 생성
			$('#orderManagerPagingDiv').html(data.orderManagerPaging.pagingHTML);
		}//success		
	});//ajax
	
	
});

//orderState/erState에 따른 변화
function changeByState(orderState,whoCancel,erState,orderCode){
	//주문취소인 경우
	if(orderState == 0){
		//버튼변경
		$('#cancel_button'+orderCode).text('상세');
		$('#cancel_button'+orderCode).addClass('cancel_detail');
		
		$('#cancel_button'+orderCode).css('background-color','powderblue').hover(function(){
			 $(this).css('background-color','#f8585b')}, function(){
			 $(this).css('background-color','powderblue')		 
		});
		
		$('#cancel_button'+orderCode).removeClass('cancel_button');
		
		//누가 주문취소를 했는지
		if(whoCancel == 0){
			$('#whoCancel'+orderCode).text('<주문자>').css('font-size','12px');
		}
		else if(whoCancel == 1){
			$('#whoCancel'+orderCode).text('<관리자>').css('font-size','12px');
		}
	}
	//배송완료 or 주문완료인 경우
	else if(orderState == 4 || orderState == 5){
		$('.cancel_button').hide();
	}	
	//교환/환불 버튼
	if(erState == null){
		$('#erDetail'+orderCode).hide();
	}
	else{
		$('#erDetail'+orderCode).show();
	}
}

//주문관리 클릭
$('#orderManager').click(function(){
	location.href = "/kokonutStationery/admin/orderList.do";
});

//주문등록 클릭
$('#orderRegister').click(function(){
	location.href = "/kokonutStationery/admin/orderRegister.do";
});

//제품상세페이지로 이동
$(document).on('click','.pDetail_button', function(){
	var orderCode = $(this).attr('id');
	window.open('/kokonutStationery/admin/orderView.do?orderCode='+orderCode,
			'','width=1100, height=600, left=100, resizable=no, toolbar=no','true');
});

//취소처리버튼 클릭 : 취소신청
$(document).on('click','.cancel_button',function(){
	var orderCode = $(this).attr('id');
	var orderCode = orderCode.substring(13);
	window.open('/kokonutStationery/admin/orderCancelRegisterForm.do?orderCode='+orderCode,
			'','width=840, height=600, left=100, resizable=no, toolbar=no','true'); 
});

//취소상세버튼 클릭 : 취소처리확인
$(document).on('click','.cancel_detail',function(){
	var orderCode = $(this).attr('id');
	var orderCode = orderCode.substring(13);
	window.open('/kokonutStationery/admin/orderCancelDetail.do?orderCode='+orderCode,
			'','width=840, height=550, left=100, resizable=no, toolbar=no','true'); 
});

//환불상세버튼 클릭
$(document).on('click','.erDetail_button',function(){
	var orderCode = $(this).attr('id');
	var orderCode = orderCode.substring(8);
	var erState = $('#erState'+orderCode).text();
	alert(erState);
 	window.open('/kokonutStationery/admin/erDetailForm.do?orderCode='+orderCode+'&erState='+erState,
			'','width=740, height=600, left=100, resizable=no, toolbar=no','true'); 
});

//체크박스 전체 선택
$('#check_all').click(function(){
	if($('#check_all').is(':checked'))
		$('.check').prop('checked', true);
	else
		$('.check').prop('checked', false);
});

/* 모달선택 창 닫기 */
$('#changeConfirmClose_Modal').click(function(){
	$('#open_changeConfirmModal').hide();
});

/* 모달삭제 창 닫기 */
$('#deleteConfirmClose_Modal').click(function(){
	$('#open_deleteConfirmModal').hide();
});

$('.close_Modal').click(function(){
	$('#open_nonCheckModal').hide();
	$('#open_deleteSuccessModal').hide();
});

//기간 설정 버튼
var today = new Date();
var year = today.getFullYear();
var month = today.getMonth()+1;
var day = today.getDate();

$('#today').click(function(){
	$('#startYear').val(year);
	$('#startMonth').val(month);
	$('#startDay').val(day);
	$('#endYear').val(year);
	$('#endMonth').val(month);
	$('#endDay').val(day);
});
$('#threeday').click(function(){
	if(day < 3){
		$('#startYear').val(year);
		$('#startMonth').val(month-1);
		if(month == 2 || month == 4 || month == 6 || month == 9 || month == 11){
			$('#startDay').val(30+day-2);
		}
		else {
			$('#startDay').val(31+day-2);
		}
	}
	else {
		$('#startYear').val(year);
		$('#startMonth').val(month);
		$('#startDay').val(day-2);
	}
	$('#endYear').val(year);
	$('#endMonth').val(month);
	$('#endDay').val(day);
});
$('#week').click(function(){
	if(day < 7){
		$('#startYear').val(year);
		$('#startMonth').val(month-1);
		if(month == 2 || month == 4 || month == 6 || month == 9 || month == 11){
			$('#startDay').val(30+day-6);
		}
		else {
			$('#startDay').val(31+day-6);
		}
	}
	else {
		$('#startYear').val(year);
		$('#startMonth').val(month);
		$('#startDay').val(day-6);
	}
	$('#endYear').val(year);
	$('#endMonth').val(month);
	$('#endDay').val(day);
});
$('#onemonth').click(function(){
	if(day == 30){
		$('#startYear').val(year);
		if(month == 2 || month == 4 || month == 6 || month == 9 || month == 11 ){
			$('#startMonth').val(month);
			$('#startDay').val(1);
		}
		else {
			$('#startMonth').val(month-1);
			$('#startDay').val(day);
		}
	}
	else if(day == 31){
		$('#startYear').val(year);
		$('#startMonth').val(month);
		$('#startDay').val(1);
	}
	else {
		$('#startYear').val(year);
		$('#startMonth').val(month-1);
		$('#startDay').val(day);
	}
	$('#endYear').val(year);
	$('#endMonth').val(month);
	$('#endDay').val(day);
});
$('#sixmonth').click(function(){
	if(year < 6){
		$('#startYear').val(year-1);
		$('#startMonth').val(month-5);
	}
	else{
		$('#startYear').val(year);
		$('#startMonth').val(month-5);
	}
	$('#startDay').val(day);
	$('#endYear').val(year);
	$('#endMonth').val(month);
	$('#endDay').val(day);
});


/*search orderlist : 주문내역 검색  */
$('#order_searchBtn').click(function(){

	$('#order_search_div').empty();

	var searchKeywordOption = $('#searchKeywordOption').val();
	var searchKeyword = $('#searchKeyword').val();
	
	
	var startMonth = $('#startMonth').val();
	var startDay = $('#startDay').val();
	var endMonth = $('#endMonth').val();
	var endDay = $('#endDay').val();
		
	if(startMonth < 10){
		startMonth = '0' + startMonth;
	}
	if(startDay < 10){
		startDay = '0' + startDay;
	}
	if(endMonth < 10){
		endMonth = '0' + endMonth;
	}
	if(endDay < 10){
		endDay= '0' + endDay;
	}	
	
		
	var startDate = $('#startYear').val()+startMonth+startDay; 
	var endDate = $('#endYear').val()+endMonth+endDay;
	//alert(startDate);
	//alert(endDate); 
	if(startDate.length != 8) startDate="";
	if(endDate.length != 8) endDate ="";
	
	var orderState = $('input[name="orderState"]:checked').val();
	var erState = $('input[name="erState"]:checked').val();
	var userClass = $('input[name="userClass"]:checked').val();
	
	//검색어 기간 유효성 검사
	if($('#searchKeyword').val()==''){ //검색어 null
		//기간 존재
		if($('#startMonth').val() != '' || $('#startDay').val() != '' || $('#endMonth').val() !='' || $('#endDay').val() !=''){
			if( $('#startYear').val() > $('#endYear').val()){ 
				$('#order_search_div').text('시작날짜가 종료날짜보다 클 수 없습니다').css('color', 'red').css('font-weight', '10pt');
				return;
			}
			else if($('#startYear').val() == $('#endYear').val()){
				if($('#startMonth').val() > $('#endMonth').val()){
					$('#order_search_div').text('시작날짜가 종료날짜보다 클 수 없습니다').css('color', 'red').css('font-weight', '10pt');
					return;
				}
			}
			else{
				alert("기간으로만 검색가능");
			}
		}
		//기간 null
		else if($('#startMonth').val() == '' && $('#startDay').val() == '' && $('#endMonth').val() =='' && $('#endDay').val() ==''){
			//검색어와 기간을 제외한 것들도 null
			if(orderState == '' && erState == '' && userClass == ''){
				alert("전체리스트 출력");
				//$('#order_search_div').text('검색조건을 최소한 1개이상 선택해야합니다([전체]제외)').css('color', 'red').css('font-weight', '10pt');
				
			}
		}
		//그 외(기간을 정확히 입력이 안된 부분)
		else{
			$('#order_search_div').text('검색어 혹은 기간을 입력해 주세요').css('color', 'red').css('font-weight', '10pt');
			return;
		}
	}
	else{//검색어 존재
		if($('#startMonth').val()=='' && $('#startDay').val()=='' && $('#endMonth').val()=='' && $('#endDay').val()==''){
			alert("검색어로만 검색가능");
			//기간 조건이 모두 null이면 검색어로만 검색가능
		}
		else{
			if($('#startMonth').val() != '' && $('#startDay').val() != '' && $('#endMonth').val() != '' && $('#endDay').val() != ''){
				if( $('#startYear').val() > $('#endYear').val()){ 
					$('#order_search_div').text('시작날짜가 종료날짜보다 클 수 없습니다').css('color', 'red').css('font-weight', '10pt');
					return;
				}
				else if($('#startYear').val() == $('#endYear').val()){
					if($('#startMonth').val() > $('#endMonth').val()){
						$('#order_search_div').text('시작날짜가 종료날짜보다 클 수 없습니다').css('color', 'red').css('font-weight', '10pt');
						return;
					}
				}
			}
			else{//기간이 다 입력되지않은 경우
				$('#order_search_div').text('기간을 정확히 입력해 주세요').css('color', 'red').css('font-weight', '10pt');
				return;
			}
		}
	}
	
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/orderSearchList.do',
		data : {'pg' : $('#pg').val(),
				'searchKeywordOption' : searchKeywordOption,
				'searchKeyword' : searchKeyword,
				'startDate' : startDate,
				'endDate' : endDate,
				'orderState' : orderState,
				'erState' : erState,
				'userClass' : userClass },
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data));
										
			if(data.list==null){
				$('#order_search_div').text('일치하는 항목이 없습니다').css('color', 'red').css('font-weight', '10pt');		
				return;	
			}
			
			$('#orderList_table tr:gt(0)').remove();
			
			$.each(data.list, function(index, items){
				if(items.orderState==0)
					var orderState = '주문취소';
				else if(items.orderState==1)
					var orderState = '주문접수';
				else if(items.orderState==2)
					var orderState = '배송준비';
				else if(items.orderState==3)
					var orderState = '배송중';
				else if(items.orderState==4)
					var orderState = '배송완료';
				else if(items.orderState==5)
					var orderState = '주문완료';
						
				//상품이름 외 x건 출력
				var orderProductName="";
				var orderProductAmount = 0;
				
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/admin/getOrderProduct.do',
					data : {'orderCode' : items.orderCode},
					dataType : 'json',
					success : function(pData){
						//alert(JSON.stringify(pData));
						
						$.each(pData.pName, function(pIndex, pItems){
							if(orderProductAmount==0){
								orderProductName = pItems.productName;
								orderProductAmount++;
							}else{
								orderProductAmount++;
							}
						});
						$('.order_product'+index).append($('<span/>', {
							text : orderProductName + ' 포함 ' + orderProductAmount + ' 건' 
						}).append('<br>')).append($('<button/>',{
							class : 'pDetail_button tbl_button',
							id : items.orderCode,
							type : 'button',
							text : '상세보기'
						}));
					}
				});
				//alert(orderProductName);
				$('<tr/>', {
					class : 'orderList_tr'
				}).append($('<td/>',{
					align : 'center'
					}).append($('<input/>', {
						type : 'checkbox',
						value : items.orderCode,
						name : 'check',
						class : 'check',
						style : 'cursor : pointer;'
				}))).append($('<td/>', {
					align : 'center',
					text : items.orderDate
				})).append($('<td/>', {
					align : 'center',
					class : 'productDetail',
					id : items.orderCode,
					text : items.orderCode,
					style : 'cursor : pointer;'
				})).append($('<td/>', {
					align : 'center',
				 	style : 'text-align:center; cursor :pointer;',
					class : 'productDetail order_product'+index,
					id : items.orderCode
				})).append($('<td/>', {
					align : 'center',
					text : items.userName + '(' + items.userId + ')' 
				}).css('padding', '0 5px')).append($('<td/>', {
					align : 'right',
					id : 'totalPayment_td',
					text : items.totalPayment + '원',
					style : 'padding-right: 5px;'
				})).append($('<td/>', {
					align : 'center',
					text : orderState
				}).append('<br>').append($('<span/>',{
					id : 'whoCancel'+ items.orderCode
				}))).append($('<td/>',{
					align : 'center'
				}).append($('<button/>',{
					class : 'cancel_button tbl_button',
					id : 'cancel_button'+items.orderCode,
					type : 'button',
					text : '처리',
				}))).append($('<td/>',{
					align : 'center',
					text : items.erState,
					id : 'erState'+ items.orderCode
				})).append($('<td/>',{
					align : 'center'
				}).append($('<button/>',{
					class : 'erDetail_button tbl_button',
					id : 'erDetail'+items.orderCode,
					type : 'button',
					text : '상세'
				}))).appendTo($('#orderList_table'));
				
				changeByState(items.orderState, items.whoCancel, items.erState);
				
			});//each
			$('#orderManagerPagingDiv').html(data.orderManagerPaging.pagingHTML);
			$('#pg').val(1);
		}//success
	});//ajax
	
});//order_searchBtn : 상품 검색 리스트 끝

/* 페이징 링크 */
function orderManagerPaging(pg){
	location.href="/kokonutStationery/admin/orderList.do?pg="+pg;
}

function orderSearchPaging(pg){
	$('#pg').val(pg);
	$('#order_searchBtn').trigger('click');
}

//선택삭제
function selectDelete(){
	var count = $('.check:checked').length;
	/*
	if(action=='change'){
		if(count==0){
			$('#noneCheck_modal').html('주문상태 갱신');
			$('#open_nonCheckModal').show();
		}else{
			if($('#order_state').val()=='주문상태 선택'){
				$('#noneCheck_modal').html('주문상태 갱신');
				$('#stateNoneSelect').html('갱신하실 주문상태를 선택해주세요.');
				$('#open_nonCheckModal').show();
			}
			else{
				$('#open_changeConfirmModal').show();
				$("#changeConfirmOK_Modal").off().on('click', function(){
					document.orderList_actionForm.method='post';
					document.orderList_actionForm.action='/kokonutStationery/admin/selectedOrderStateChange.do';
					document.orderList_actionForm.submit();
				});
			}
		}
	}else if(action=='delete'){}
	*/
	if(count==0){
		$('#noneCheck_modal').html('주문내역 삭제');
		$('#open_nonCheckModal').show();
	}else{
		$('#open_deleteConfirmModal').show();
		$("#deleteConfirmOK_Modal").off().on('click', function(){
			document.orderList_actionForm.method='post';
			document.orderList_actionForm.action='/kokonutStationery/admin/selectedOrderDelete.do';
			document.orderList_actionForm.submit();
		});
	}
}
</script>
</html>