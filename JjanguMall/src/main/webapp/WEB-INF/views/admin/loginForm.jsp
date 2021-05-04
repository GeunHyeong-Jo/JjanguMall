<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/image/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	font-family: 'Hanna', sans-serif; font-size:17px; font-weight:normal;
}


p{font-size:30px; margin-left:50px;}
#admin_login_div{
	border:1px solid #bdbdbd; width:410px; height:330px; margin:150px auto;
	padding-top:70px; background:#ffffff; border-radius:5px;
}
#admin_login_div table{width:250px; height:150px; margin:auto;}
#admin_login_div input{
	float:left; width:170px; height:30px;
	border:1px solid #bdbdbd; margin-bottom:4px;
}

#admin_Btn_Div{margin:auto; width:250px; height:50px; margin-top:20px;}
div.admin_Btn{
	width:240px; height:30px; float:left; background:#c3c3c3;
	text-align:center; padding-top:15px; margin-top:20px;
	cursor:pointer;
}
div.admin_Btn:hover{background:#444444;}


.checkDiv{width:150px; height:15px; padding-top:3px; }

#loginResultDiv{clear:both; width:160px; margin:auto; padding-left:80px; padding-top:10px;}

</style>

</head>
<body>

<p>관리자 로그인</p>
<div id="admin_login_div">	
	
		<table name="adminLoginForm" action="#">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" id="adminId" name="adminId" placeholder="관리자 아이디" />
					<div id="adminIdDiv" class="checkDiv"></div>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="adminPwd" name="adminPwd" placeholder="비밀번호"/>
					<div id="adminPwdDiv" class="checkDiv"></div>
				</td>
			</tr>
		</table>
		
		<div id="admin_Btn_Div">
			<div id="admin_loginBtn" class="admin_Btn">로그인</div>
			<div id="loginResultDiv"></div>
		</div>
	</div>
	
</div><!-- admin_login_div -->

</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$().ready(function(){
	$('#admin_loginBtn').click(function(){
		$('#adminIdDiv').empty();
		$('#adminPwdDiv').empty();
		$('#loginResultDiv').empty();
		
		if($('#adminId').val()=='')
			$('#adminIdDiv').text('아이디를 입력하세요').css('color','red').css('font-size','15px');
		else if($('#adminPwd').val()=='')
			$('#adminPwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','15px');
		
		//관리자 DB에서 조회 후 로그인 성공/실패 구분  - TBL_ADMIN  : 테이블명
		else {
			$.ajax({
				type : "post",
				url : '/miniproject/admin/loginProcess',
				data : {"id" : $('#adminId').val(), "pwd" : $('#adminPwd').val()},
				dataType : 'text',
				success : function(data){
					if(data == 'login_ok'){
						location.href="/miniproject/admin/productList";
					} else if(data == 'login_fail'){
						$('#loginResultDiv').text("로그인 실패").css("color","red").css("font-size","12pt");
					}
				}
			});
		}
	});
	
});

</script>
</html>