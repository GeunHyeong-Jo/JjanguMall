<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/user.css" />




<table width=1000px height=100% cellpadding=0 cellspacing=0 border=0>
<tr>

<!-- 우측 실행 화면 (두번째 td태그) -->
<td valign=top width=100% height=100% bgcolor="ffffff">

<form id=modifyForm method=post action="${pageContext.request.contextPath }/user/modify" >

<div class="indiv" style="margin:0 10px 0 30px;"> <!-- start indiv -->

<!-- 제목 부분 -->
<div class="join_tit in_stt" style="font-size: 18px; font-weight: 700; color:#222222; height:26.4px; text-align: left; margin:0 0 13px 0;">
  개인회원정보<div style="margin:12px 0 0 0;border-bottom: 2px solid #2ac1bc;float:right;font-size:12px;font-weight:700;color:#333;">필수입력사항</div>
</div>

<!-- 정보 입력 부분 -->
<div class="hundred">
 <table width=100% cellpading=0 cellspacing=0 border=0>

  <!-- 아이디 -->
  <tr>
   <td class="memberCols1" style="height:68px;">
    <font style="border-bottom: 2px solid #2ac1bc; font-size:12px;">아이디</font>
   </td>
   <td class="memberCols2">
   <input type="hidden" id="userId" name="userId" value="${sessionScope.memId }">
    <span style="font-size: 13px; font-weight:700;">${sessionScope.memId }</span> <!-- 아이디 출력 -->
   </td>
  </tr>
  
  <!-- 비밀번호 -->
  <tr>
   <td class="memberCols1" style="height:68px;">
    <font style="border-bottom: 2px solid #2ac1bc; font-size:12px;">비밀번호</font>
   </td>
   <!-- 비밀번호 변경 버튼-->
   <td class="memberCols2">
    <a id="pwdChange" href="javascript:void(0);">
     <span style="text-align:center; width:212px; height:38px; background:#444444; position: relative; line-height: 38px; float:left; 
     color:#ffffff; font-size: 12px;" >비밀번호 변경
     </span>
    </a>
    <a id="pwdManualOpen" href="javascript:void(0);" style="font-size:12px; margin:12px 0 0 15px; position:absolute; color:#999;">
    	<u>비밀번호 도움말</u> 
    </a></br>
     <!-- 비밀번호 도움말 창 -->
     <div id="pwdManual">
      <p class="close">
       <a id="pwdManualClose" href="javascript:void(0);">
        <img style="width: 15px;" src="${pageContext.request.contextPath }/assets/image/closeBtn.png"/>
       </a> 
      </p>
      <p>
       	비밀번호에 영문 대소문자,숫자,특수문자를 
       	<br/>
       	조합하시면 비밀번호 안전도가 높아져
       	<br/>
       	도용의 위험이 줄어듭니다.
       </p>
       <ul>
        <li>
      	 영문 대소문자는 구분이 되며, 한가지로만 입력은 위험합니다.
        </li>
        <li>
                   사용가능한 특수문자 :
         <br/>
         ! " @ # $ % ^ & ' ( ) * + = , - _ . : ; < > ? / ' ~ | { }
        </li>
        <li>
         ID, 주민번호,생일,전화번호 등의 개인정보와
         </br>
                    통산 사용 순서대로의 3자 이상 연속 사용은 피해주세요.
        </li>
        <li>
                     비밀번호는 주기적으로 바꾸어 사용하시는 것이 안전합니다.
        </li>           
       </ul>
     </div>
   </td> 
  </tr>
  
  <tr id="pwLayer01" style="display:none;">
   <td colspan=2 height=1 bgcolor="#f6f6f6" style="padding:0px;">
   </td>
  </tr>
  <tr id="pwLayer02" style="display:none; background-color: #f6f6f6;">
   <td class="memberCols1">&nbsp;</td>
   <!-- 비밀번호 변경창 -->
   <td class="memberCols2">
    <table cellpadding="0" cellspacing="0" border="0">
     <tr style="border: 0px; padding: 5px 0 5px 0; font-size:12px; color:#333;">
      <td style="border:0px; padding:17px 0 0 0; font-weight:700; ">
       <label>현재 비밀번호</label>
      </td>
      <td style="border:0px; padding:20px 15px 5px 15px;">
       <input type="password" name="userPwd" id="originalPwd" class="line" onchange="changePwd()" required
       style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color:#333; border-radius:0;"/>
       <input type="hidden" id="chkPwd" value="">
       <span style="font-size:11px; color:#999; padding-left:10px;">현재 비밀번호 입력</span>
      </td>
     </tr>
   
     <tr style="border:0px; padding:5px 0 5px 0; font-size:12px; color:#333;">
      <td style="padding:0px; font-weight:700;">
       <lable>새 비밀번호</lable>
      </td>
      <td style="padding:5px 15px;">
       <input type="password" name="newPwd" id="newPwd" class="line" required
       style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color: #333; border-radius:0;"
       maxlength="20" />
       
       
		
       <span style="font-size:11px; color:#999; padding-left:10px;">새 비밀번호를 입력</span>
       
      </td> 
     </tr>
     <tr style="border:0px; padding:5px 0 5px 0; font-size:12px; color:#333;">
      <td style="padding:0 0 17px 0; font-weight:700;">
       <label>새 비밀번호 확인</label>
      </td>
      <td style="padding:5px 15px 20px 15px;">
       <input type="password" name="confirmPwd" id="confirmPwd" option="regPass" maxLength="20" required
       class="line" style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color:#333; border-radius:0;">
       <span style="font-size:11px; color:#999; padding-left:10px;">새 비밀번호를 다시 입력</span>
      </td>
     </tr>
    </table>
   </td>  
  </tr> 
  
  <tr>
   <td colspan="2" height="20" style="padding:0px;"></td>
  </tr>
  
  <!-- 이름 -->
  <tr>
   <td class="memberCols1" style="height:68px;">
    <label style="border-bottom:2px solid #2ac1bc; font-size:12px;">이름</label>
   </td>
   <td class="memberCols2">
    <input type="text" name="userName" value="${sessionScope.memName }" class="line" style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; 
    font-size:13px; color:#333; border-radius:0;"  id="userName" required>
   </td>
  </tr> 
  
  <!-- 이메일 -->
  <tr>
   <td class="memberCols1" style="vertival-align:top; padding-top:17px; position:absolute; margin-bottom:17px;">
    <label style="border-bottom:2px solid #2ac1bc; font-size:12px;">이메일</label>
   </td>
   <td class="memberCols2" style="padding-bottom:10px; ">
    <input type="text" name="userEmail" value="${sessionScope.memEmail }" id="userEmail" class="line"
    style="border:1px solid #DDD; width:200px; height:38px; padding-left:10px; font-size:13px; color:#333; position:relative; 
    border-radius:0; margin:5px 0 8px 0;" required>
    <a href="javascript:void(0)" onclick="" style="text-decoration:none;">
     <span id="checkEmailBtn" style="text-align:center; border:1px solid #ccc; width:112px; height:38px; position:absolute; margin-left:27px; margin-top:5px;
      padding:1px 0; color:#a4a4a4; line-height:40px; font-weight:700; font-size:12px;" align="absmiddle">메일 중복확인</span>
    </a>
   
    <div class="join_red01"></div>
   </td>
  </tr>
  
  <!-- 휴대폰 -->
  <tr>
   <td class="memberCols1" style="vertical-align:top; padding-top:17px;">
    <font style="border-bottom:2px solid #2ac1bc; font-size:12px;">휴대폰</font>
   </td>
   <td class="membercols2" style="padding-bottom:15px; padding-left:10px; height:74px;">
    <input type="text" name="userPhone" value="${userDTO.userPhone }" size="12" maxlength="11" id="userPhone"
    class="line" style="border:1px solid #DDD; width:150px; height:38px; text-align:center; font-size:13px; color:#333; margin:0 0 8px 0;
    border-radius:0;" required>
    
   </td>
  </tr>
  
  
  <!-- 경계선 -->
  <tr>
   <td colspan="2" height="30" style="padding:0px;"></td>
  </tr>
  <tr>
   <td colspan="2" height="1" bgcolor="#e1e1e1" style="padding:0px;"></td>
  </tr>
  
 </table>
</div>

<!-- 뒤로,수정버튼 -->
<table width=100%" cellpadding="0" cellsapcing="0" border="0" style="margin-top:20px;">
 <tr>
  <td align="center" height="100">
   <div style="width:100%" class="noline">
    <div style="width:178px; height:58px; border:1px solid #a4a4a4;  cursor:pointer; display:inline-block;">
     <a href="javascript:void(0);" style="text-decoration:none;" onclick="history.back()">
      <span id="backBtn" style="width:178px; font-size:15px; color:#a4a4a4; font-weight:700; 
      text-align:center; height:60px; line-height:60px; cursor:pointer;">뒤로</span>
     </a>
    </div>
   
    <div style="width:180px; display:inline-block; padding-left:5px;">
     <input type="submit" id="modifyBtn" style="display:inline-block; cursor:pointer; text-align:center; height:60px; width:180px;
     background-color:#444; line-height:60px; font-size:16px; font-weight:700; color:#ffffff; border-radius:0; margin-top:2px;" value="수정">
    </div>
   </div>
  </td>
 </tr>
</table>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//비밀번호변경버튼
$('#pwdChange').click(function(){
	$('#pwLayer01').css("display","table-row");
	$('#pwLayer02').css("display","table-row");
});


//메일 중복 확인
$('#checkEmailBtn').click(function(){
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
});

function changePwd(){
	var userId=$('#userId').val();
	var originalPwd=$('#originalPwd').val();			
	
	$.ajax({
		type:'post',
		url:'miniproject/user/checkPwd',
		data:{'userId':userId,
			'userPwd':originalPwd},
		success:function(data){
			
			if(data=='exist'){
				$('#chkPwd').val('exist');	
			}else{
				$('#chkPwd').val('not_exist');	
			}
			
		}				
	});
}

//유효성검사
$('#modifyBtn').click(function(){
	
	var userName = $('#userName').val();
	
	var userEmail =$('#userEmail').val();
	var userPhone = $('#userPhone').val();
	var newPwd = $('#newPwd').val();
	var pwdChkClass = $('#pwdChk').attr('class');
	
	
	if($('#pwLayer01').css('display') !='none'){
		if($('#originalPwd').val()==''){
			alert('현재 비밀번호를 입력해주세요.');			
			return false;
		}else if($('#newPwd').val()==''){
			alert('새 비밀번호를 입력해주세요.');
			return false;
		}else if($('#confirmPwd').val()==''){
			alert('새 비밀번호 확인을 입력해주세요.');
			return false;
		}else if($('#newPwd').val()!=$('#confirmPwd').val()){
			alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			return false;
		}else if($('#chkPwd').val()!='exist'){
			alert('현재 비밀번호를 정확하게 입력하여 주세요.');	
			$('#originalPwd').val('');
			$('#originalPwd').focus();
			return false;
		}
	}else
		$('#modifyForm').submit();
		
});  


</script> 


</div> <!-- end indiv -->

</form>

</td> <!-- 두번째td 태그 끝 -->

</tr>
</table>    
    