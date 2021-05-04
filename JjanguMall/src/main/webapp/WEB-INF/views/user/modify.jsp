<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<table width=1000px height=100% cellpadding=0 cellspacing=0 border=0 >
<tr>

<!-- 우측 실행 화면 (두번째 td태그) -->
<td valign=top width=100% height=100% bgcolor="ffffff" >


<!-- 비밀번호 재확인 영역 -->
<div class="indiv" style="margin:20px 30px 50px 30px;"><!-- Start indiv -->

<div class="mem_tit" style="font-size: 22px; font-weight: 700; text-align: left; color:#222;">
	비밀번호 재확인
</div>
<div id="cp_body">
	<form id="confirmForm" name="confirmForm" method="post" action="../user/modifyForm.do">
		
		<!-- 회색선 영역 / 비밀번호 입력란 -->
		<div id="cp_form_border" style="width:738px; height:235px; background:#fff; border:6px solid #efefef; margin:15px 0 30px 0;">
			<div id="cp_form" style="padding:0;">
			<h4 style="font-size:14px; font-family:Noto Sans KR; text-align:center; font-weight:400; color:#666; line-height: 23px;padding: 20px 0 0 0;">회원님의 정보를 안전하게 보호하기 위해<br/>비밀번호를 다시 한 번 확인합니다.</h4>
			<table cellpadding="4" cellspacing="0" border="0" align="center">
				<tr align="left">
					<td width="70" style="font-size:13px; font-family:Noto Sans KR; font-weight:400; color:#666;">아이디</td>
					<td style="color:#333; font-weight:700;" >
						<input type="hidden" id="userId" name="userId" value="${sessionScope.memId }">
						${sessionScope.memId }
					</td>
				</tr>
				<tr align="left">
					<td width="70"><label style="font-size:13px; font-family:Noto Sans KR; font-weight:400; color:#666;">비밀번호</label></td>
					<td>
						<input type="password" name="userPwd" id="userPwd" class="line" style="position:relative; border:1px solid #DDD; width:276px; height:50px; padding-left: 10px; font-size:15px; color: #333; background-color:#fff;  border-radius:0;">
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 확인, 취소 버튼 -->	
	<div align="center" style="padding:0 0 80px 0">
		<div style="width: 150px; display: inline-block; border:1px solid #A4A4A4;">
			<a href="javascript:void(0);" onclick="history.go(-1);" style="text-decoration:none;">
			 <span id="cancelBtn" style="text-align:center; font-family:Noto Sans KR; color:#a4a4a4; cursor:pointer; height:60px; width:150px; line-height:60px; 
			 font-weight:700; font-size:13px;">취소
			 </span>
			</a>
		</div>
		<div style="width: 150px; display: inline-block; padding-left: 5px;">
			<input type="button" id="confirmBtn" 
			style="display: inline-block; font-family:Noto Sans KR; text-align:center; cursor:pointer; color:#fff; height:60px; background-color:#444; width:150px; 
			line-height:60px; border:none; border-radius:0; font-weight:700; font-size:13px;" value="확인">
		</div>
	</div>

	</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#confirmBtn').click(function(){
	
	var userId = $('#userId').val();
	var userPwd = $('#userPwd').val();
	alert("userId="+userId);
	
	$.ajax({
		type:'post',
		url:'../user/checkPwd.do',
		data:{'userId':userId,
			'userPwd':userPwd},
		success:function(data){
			if(data=='not_exist'){
				alert('비밀번호를 정확하게 입력해주세요.');
				
			}else if(data=='exist'){
				$('#confirmForm').submit();
			}
		}
		
	});
	
	
		
});
</script>

</div><!-- End indiv -->

</td> <!-- 두번째td 태그 끝 -->

</tr>
</table>


