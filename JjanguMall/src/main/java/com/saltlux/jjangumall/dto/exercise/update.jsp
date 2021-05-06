<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
</head>
<body>
	<h1>업데이트 내역</h1>
	<p>
	
	</p>
	<form action="${pageContext.request.contextPath }/exercise/update?no=${no}" method="post">
	    사용자 :	${authUser.name } <br>
		실행 운동 : <input type="text" name="name" value=""><br> 
		운동 시간(10분단위) : <input type="text" name="time" value=""><br>
	    <input type="submit" value="등록">
	</form>
	<br>
	<p>
		<a href="${pageContext.request.contextPath }/exercise/index">리스트 바로가기</a>
	</p>
</body>
</html>