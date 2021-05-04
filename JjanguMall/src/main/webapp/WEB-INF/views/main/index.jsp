<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko" class="windows chrome pc">
<head>
<title>SONG STATIONERY</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 파비콘 각 페이지마다 들어가야 함 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/slick-theme.css" />

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/goods_list.css" /> 

</head>

<body>
	<div id="wrap"><!-- 페이지 전체를 감싸는 div -->
		<!-- header 시작 -->
		<div id="header_main">
			<c:import url="/WEB-INF/views/includes/header.jsp" />
		</div>
		<!-- header 끝 -->
	
	
		<!-- main container 시작 -->
		<div id="main_wrap">
			
			<!-- slider -->
			<div id="slider_wrap">
				<div id="main_slider" class="main_slider">
					<div><a href="#"><img src="${pageContext.request.contextPath }/assets/image/main_banner1.png" style="height:500px;" /></a></div>
					<div><a href="#"><img src="${pageContext.request.contextPath }/assets/image/main_banner2.png" style="height:500px;" /></a></div>
					<div><a href="#"><img src="${pageContext.request.contextPath }/assets/image/main_banner3.png" style="height:500px;" /></a></div>
				</div>
				<div class="slider_nav">
					
				</div>
			</div><!-- slider_wrap -->
			
			<!-- content_wrap -->
			<jsp:include page="/WEB-INF/views/${display }"/>
			
			
			<a href="#" id="topBtn">
				<img src="${pageContext.request.contextPath }/assets/image/topBtn.png" />
			</a>
		
			<c:import url="/WEB-INF/views/includes/footer.jsp" />
		</div><!-- main_wrap_end -->
	
	</div><!-- wrap_end -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/slick.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	$('.main_slider').slick({
		autoplay : true, // 자동슬라이드여부
		autoplaySpeed : 3000,
		slidesToShow : 1, // 한번에 몇개의 이미지를 보여줄 것인지
		slidesToScroll : 1,
		arrows : true,
		fade : false,
		infinite : true,
		dots : true
	});
	
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




