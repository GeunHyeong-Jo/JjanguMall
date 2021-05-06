<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trade</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<body id="top">
  <c:import url="/WEB-INF/views/used/include/header.jsp"/>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <div class="content"> 
           
      <div id="comments">
        
   
       <form action="${pageContext.request.contextPath }/used/regist" method="post" enctype="multipart/form-data">
		<div class="one_third first">
			<label for="TITLE">TITLE <span>*</span></label>
			<input type="text" name="title" id="title" value="" size="22">
		</div>
		
		<div class="one_third">
			<label for="region">REGION</label>
			<input type="text" name="region" id="region" value="" size="22">
		</div>
		
		<div class="one_third">
			<label> Region</label>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</div>
		
		<div class="three_third first">
			<label for="IMAGE">IMAGE <span>*</span></label>
			<input type="file" name="pictures" multiple required>
		</div>
		
		<div class="block clear">
			<label for="contents">Contents</label>
			<textarea name="contents" id="contents" cols="25" rows="10"></textarea>
		</div>
		<br>
		<div>
			<input name="submit" type="submit" value="등 록">
			&nbsp; 
			<input name="reset" type="reset" value="Reset Form">
		</div>
		</form>
      </div>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<c:import url="/WEB-INF/views/used/include/footer.jsp"/>
<c:import url="/WEB-INF/views/used/include/footerjs.jsp"/>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("region").value = addr;
            }
        }).open();
    }
</script>
</body>
</html>