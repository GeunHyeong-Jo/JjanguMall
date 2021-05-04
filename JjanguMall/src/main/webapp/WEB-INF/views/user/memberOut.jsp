<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table width=1000 height=100% cellpadding=0 cellspacing=0 border=0>
<tr>
  <!-- 우측 실행 화면 (두번째 td태그) -->
  <td valign=top width=100% height=100% class=outline_side>
   <div class="indiv" style="margin:0 10px 0 30px;"> <!-- start indiv -->
    <div class="mem_tit" style="font-size:22px; font-weight:700; text-align:left; color:#222;">
    	회원탈퇴
    </div>
    
    <form method="post" action="${pageContext.request.contextPath }/user/memberDelete" name="memberOutForm" id="memberOutForm">
     <input type="hidden" id="userId" name="userId" value="${sessionScope.memId}">
     <!-- 탈퇴안내 -->
     <div style="margin:30px 0 0 0">
      <h5 class="join_tit in_stt" style="font-size:16px; font-weight:700; border-bottom:0px solid #dfdfdf; text-align:left;
      padding-bottom:0; margin:0 0 15px 0;">
      	탈퇴안내
      </h5>
     </div>
     
     <!-- 탈퇴하기(비밀번호 입력) -->
     <div style="margin:50px 0 10px 0">
      <h5 style="font-size:16px; font-weight:700; border-bottom:0px solid #dfdfdf; text-align:left;
      psffinh-bottom:0; margin:0;">탈퇴하기</h5>
     </div>
     
     <div style="font-size:13px; line-height:22px; font-weight:700; color:#222; margin-bottom:5px;">
      <label for="userPwd">비밀번호가 어떻게 되세요?</label>
     </div>
     <div>
      <input type="password" name="userPwd" id="userPwd" class="line" onchange="changePwd()"
      style="border:1px solid #DDD; width:200px; height:38px;
      padding-left:10px; font-size:13px; color:#333; border-radius:0;">
      <input type="hidden" id="chkPwd" value="">
     </div>
     
     
     <!-- 탈퇴하기/취소버튼 -->
     <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:20px; margin-bottom:70px;">
      <tr>
       <td align="center" height="100">
        <div style="width:100%;" class="noline">
         <div style="width:150px; display:inline-block;">
          <input type="submit" id="memberOutBtn" style="display:inline-block; border:1px solid #DDD; text-align:center; height:60px; 
          width:150px; line-height:60px; border-radius:0; font-size:13px; font-weight:700; color:#a4a4a4; background:#ffffff; margin-top:2px;
          -webkit-appearance: none; cursor:pointer;" value="탈퇴하기">
         </div>
         <div style="width:145px; display:inline-block; padding-left:5px; background:#444444; cursor:pointer; ">
          <a href="javascript:void(0)" onclick="history.back()" style="text-decoration:none;">
           <span id="CancelBtn" style="width:145px; text-align:center; height:60px; line-height:60px; font-size:13px; 
           font-weight:700; color:#ffffff;">취소</span>
          </a>
         </div>
        </div>
       </td>
      </tr>
     </table>
     
    </form>	

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function changePwd(){
	var userId=$('#userId').val();
	var userPwd=$('#userPwd').val();			
	
	$.ajax({
		type:'post',
		url:'/miniproject/user/checkPwd',
		data:{'userId':userId,
			'userPwd':userPwd},
		success:function(data){
			if(data=='exist'){
				$('#chkPwd').val('exist');	
			}else{
				$('#chkPwd').val('not_exist');	
			}
			
		}				
	});
}

$('#memberOutBtn').click(function(){
	if($('#userPwd').val()=='')
		alert('비밀번호를 입력하여 주십시요.');
	else 
		var result = confirm("회원 탈퇴를 하시면 회원님의 모든 테이터(개인정보 등)가 삭제 되어집니다. \n 그래도 회원을 탈퇴하시겠습니까?");
		if(!result){return false;}
		
	
	if($('#chkPwd').val()=='not_exist'){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}else {
		alert("회원탈퇴");
		$('#memberOutForm').submit();
	}
});
</script>


   </div><!-- End indiv -->
  </td> <!-- 두번째 td태그 끝 -->

 </tr>
</table>    