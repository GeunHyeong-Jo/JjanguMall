

function chkForm(){
	//유효성체크
	var userId = $('#userId').val();
	var userName = $('#userName').val();	
	var pwdChkClass = $('#pwdChk').attr('class');
	
	
	if(userId.length<4){
    	
		alert("[아이디입력형식오류] 4자리 이상의 올바른 아이디를 입력해주세요");
    	$('#userId').focus();
    	return false;
    	
	}else if(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,20}$/.test(userId)){
		alert("[아이디입력형식오류] 4자리 이상의 올바른 형태의 아이디를 입력해주세요");
    	$('#userId').focus();
    	return false;
		
	}else if(userId!=$('#chkId').val()){
		//아이디중복체크확인
		alert("아이디 중복확인을 체크해주세요.");
		return false;
	}else if($('#userPwd').val()!=$('#rePwd').val()){
		
		alert("비밀번호가 같지않습니다.");
		$('#rePwd').focus();
		return false;
		
	}
	
	/*else if($('#userEmail').val()!=$('#chkEmail').val()){
		alert("이메일 중복확인을 체크해주세요.");
		return false;		
	}*/
	
}