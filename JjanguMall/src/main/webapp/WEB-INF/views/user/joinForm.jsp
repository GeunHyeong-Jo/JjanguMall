<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/join.css">    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/customer.css">

<table cellpadding=0 cellspacing=0 border=0 class="outline_both">
	<tr>
		<td valign=top width=80% height=100% bgcolor="" class="outline_side">
			<form id="joinForm" method="post" action="${pageContext.request.contextPath }/user/joinOk" onsubmit="return chkForm();">
				<div class="indiv"><!-- Start indiv -->
			
					<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222;">
						회원가입
					</div>
				
					
					<div class="join_tit" style="font-size: 18px; font-weight: 700; text-align: left; margin: 35px 0 13px 0;">
			 				개인회원정보
						
					
					<!-- 회원정보쓰기 -->
					<div class="memberInfo">
					
						<table id="join_table_01" width="100%" cellpadding="5" cellspacing="0" border="0">
								<tbody>									
									<!-- 아이디 -->
									<tr>
									  <td class="memberCols1">
									  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #FFA7A7;">아이디</font>
									  </td>
									  <td class="memberCols2">
										  <input type="text" name="userId" id="userId" value="" maxlength="16" required >
										  <input type="hidden" name="chkId" id="chkId" >
										  <input type="button" class="sub-button-s" id="checkIdBtn" 
										  style="text-align:center; width: 112px; height: 42px; position: absolute; margin: -41px 0 0 223px; padding: 12px 0; line-height: 16px; font-size: 12px;" align="absmiddle"
										  value="아이디중복체크">
										  
									  </td>
									</tr>
									
									<!-- 비밀번호 -->
									<tr>
									  <td class="memberCols1">
									  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #FFA7A7;">비밀번호</font>
									  </td>
									  <td class="memberCols2">
									  	<input type="password" name="userPwd" id="userPwd" maxlength="20" required>
									  	
									  </td>
									</tr>
									
									<!-- 비밀번호 확인 -->
									<tr>
									  <td class="memberCols1">
									  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #FFA7A7;">비밀번호확인</font>
									  </td>
									  <td class="memberCols2">
									  	<input type="password" name="rePwd" id="rePwd" maxlength="16" required>
									  	
									  </td>
									</tr>
									
									<!-- 이름 -->
									<tr>
									  <td class="memberCols1">
									  	<font style="font-weight:700;color:#333; border-bottom: 2px solid #FFA7A7;">이름</font>
									  </td>
									  <td class="memberCols2">
									    <input type="text" name="userName" id="userName" value="" required>
									  	
									  </td>
									</tr>
			
									<!-- 이메일 -->
									<tr>
									    <td class="memberCols1" style="vertical-align: top; padding-top:17px">
									      <font style="font-weight:700;color:#333; border-bottom: 2px solid #FFA7A7;">이메일</font>											 
									    </td>
								        <td class="memberCols2" style="padding-bottom: 10px;">
								          <input type="text" name="userEmail" id="userEmail" 
								          style="position:absolute; margin:0 0 8px 0" required>
								         
								         <!--  <input type="hidden" name="chkEmail" id="chkEmail" >          
								          <input type="button" class="sub-button-s" id="checkEmailBtn"
										  style="text-align:center;width: 112px;height: 42px; position:relative; margin-left:227px;  padding: 12px 0; line-height: 16px; font-size:12px;" align="absmiddle"
										  value="메일 중복확인"> -->
								        
				
								        </td>
									</tr>
			
									<!-- 휴대폰 -->
									<tr>
										  <td class="memberCols1" style="vertical-align: top; padding-top: 17px;">
										    <font style="font-weight:700;color:#333; border-bottom: 2px solid #FFA7A7;">휴대폰</font>
										  </td>
										  <td class="memberCols2" style="padding-bottom:15px;">
									          <input type="text" name="userPhone" id="userPhone" value="" size="11" maxlength="11" 
									          style=" width:200px;"required> 
									          <br>									          
								          </td>
									</tr>
									
									
								</tbody>
						</table>
					
					</div>
					
					<!-- 이전/다음 -->
					<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:20px; margin-bottom:70px;">
					      <tbody>
						      <tr>
						        <td align="center" height="100">
						          <div style="width:100%" class="noline">						       
						            <div style="width: 180px; display: inline-block; padding-left: 5px;">
										<input type="submit" id="userWriteBtn" class="main-button-s" 
										style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="회원가입">			
									</div>					
						          </div>
						        </td>
						      </tr>
					    </tbody>
				    </table>
				    <!-- 이전/다음 table끝 -->
				    
				
				</div>	
			</form>
</td>
	</tr>
</table>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/joinForm.js"></script>
<script type="text/javascript">
//아이디 중복체크
$('#checkIdBtn').on('click', function(){
	$.ajax({
		type : 'post',
		url  : '/miniproject/user/checkId',
		data : "userId=" + $('#userId').val(),
		dataType : 'text',
		success : function(data){
			if(data == 'exist'){
				alert("이미 등록된 아이디입니다");
			}
			else if(data == 'not_exist'){
				alert("사용 가능합니다");
				$('#chkId').val($('#userId').val());
			}
		}
	});
});

//이메일 중복체크
$('#checkEmailBtn').on('click', function(){
	
	if($('#userEmail').val()==''){
		alert("이메일을 입력해주세요.");
	}else{
		$.ajax({
			type : 'post',
			url  : '/miniproject/user/checkEmail',
			data : "userEmail=" + $('#userEmail').val(),
			dataType : 'text',
			success : function(data){
				if(data == 'exist'){
					alert("이미 등록된 이메일입니다. 다시 작성해 주십시요!");
				}
				else if(data == 'not_exist'){
					alert("사용 가능합니다");
					$('#chkEmail').val($('#userEmail').val());
				}
			}
		});
	}
});

</script>
