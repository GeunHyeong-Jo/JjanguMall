<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/join.css">   
    
<div class="indiv" style="padding-top: 100px; margin:90px 150px 50px 150px;">
<!-- Start indiv -->
	<div class="loginMsg_bg">
		<img src="${pageContext.request.contextPath }/assets/image/loginMsg.jpg" alt="로그인 이미지" />
	</div>
	<div class="login_bg">
		<form method="post" id="userLoginForm" name="userLoginForm" >
			<div class="form_box">
				<div class="info">
					<p>
						<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px"></label>
						<input type="text" name="userId" placeholder="아이디" id="userId"  
						style="position:relative; border:1px solid #DDD;width:450px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none; border-radius:0;" tabindex="1">
					</p>
					<p>
						<label style="display: block; position:absolute; top:16px; left:15px; z-index:8; font-size:15px; color:#999; line-height:16px"></label>
						<input type="password" name="userPwd" tabindex="2" placeholder="비밀번호" id="userPwd" 
						style="position:relative; border:1px solid #DDD; width:450px; height:50px; padding-left: 20px; font-size:15px; color: #333; background-color:#fff; -webkit-appearance:none;border-radius:0;" tabindex="2">
					</p>
					<p id="notice" style="color:red;"> ${param.result }</p>
				</div>
				<div style="width:100%" >
					<div style="width: 470px; display: inline-block;">
						<input type="button" id="loginBtn" class="main-button" style="border:0; text-align:center; height:64px; background-color:#444; width:470px; line-height:64px; -webkit-appearance: none; border-radius:0;" tabindex="3" value="로그인">
					</div>
				</div>
			</div>
		</form>
		
	</div>


	
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$('#loginBtn').on('click', function(){

	var userId = $('#userId').val();
	var userPwd = $('#userPwd').val();
	var notice=$('#notice');
	if(userId == "" || userPwd == ""){
		alert("아이디 또는 비밀번호 입력 형식 오류입니다.");
		
	}	
	else{
		$.ajax({
			type : 'post',
			url  : '/miniproject/user/login',
			data : {"userId" : userId,
					"userPwd" : userPwd	},
			dataType : 'text',
			success : function(data){
				console.log(data);
				if(data=='not_exist'){
					notice.text("아이디 또는 비밀번호 오류입니다");
				}
				else{ //data == false 로그인 성공
					location.href="/miniproject";
				}
			}
		});
	}	
});	

</script>

