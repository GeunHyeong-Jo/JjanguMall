<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko" class="windows chrome pc">
<head>
<title>관리자 페이지</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 파비콘 각 페이지마다 들어가야 함 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/admin-index.css" />
</head>

<body>
	<div id="wrap"><!-- 페이지 전체를 감싸는 div -->
		<!-- header 시작 -->
		<div id="header_main">
			<jsp:include page="/WEB-INF/views/includes/admin_header.jsp" />
		</div>
		<!-- header 끝 -->
	
	
		<!-- main container 시작 -->
		<div id="main_wrap">
					
			<div id="content_wrap">
				<jsp:include page="/WEB-INF/views${display}" />
			</div><!-- content_wrap -->
			
			<a href="#" id="topBtn">
				<image src="${pageContext.request.contextPath }/assets/image/topBtn.png" />
			</a>
		
		</div><!-- main_wrap_end -->
	
	</div><!-- wrap_end -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(window).scroll(function(){
		if($(this).scrollTop() > 400){
			$('#topBtn').fadeIn();
		} else {
			$('#topBtn').fadeOut();
		}
	});
	
	$('#topBtn').click(function(){
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
	
});
</script>
</html>




