<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/header.css" />


<div id="top_1" style="width:1000px;">
	<div id="top_menu_area">
		<div id="top_logo">
			<a href="${pageContext.request.contextPath }">
				<img src="${pageContext.request.contextPath }/assets/image/logo.png" alt="쏭 문방구" style="width:130px; height:48px;"/>
			</a>
		</div><!-- top_logo 끝 -->
		
		
		
		<ul id="top_menu" class="utilMenu">
			<c:if test="${memId == null}">
			<li><a href="${pageContext.request.contextPath }/user/loginForm" class="utilMenuText">로그인</a></li>
			<li><a href="${pageContext.request.contextPath }/user/joinForm" class="utilMenuText">회원가입</a></li>
			</c:if>
			<c:if test="${memId != null}">
			<li>${memName }님</li>
			<li id="logoutBtn"><a href="${pageContext.request.contextPath }/user/logout" class="utilMenuText">로그아웃</a></li>
			</c:if>
			
			<c:if test="${memId != null}">
			<li><a href="${pageContext.request.contextPath }/cart/goods_cart" class="utilMenuText">장바구니</a></li>
			</c:if>
			
			<c:if test="${memId == null}">
			<li><a href="${pageContext.request.contextPath }/user/loginForm" class="utilMenuText">마이페이지</a></li>
			</c:if>
			
			<c:if test="${memId != null}">
			<li><a href="${pageContext.request.contextPath }/mypage/mypage_orderlist" class="utilMenuText">마이페이지</a></li>
			</c:if>
			
		</ul>
		
	</div><!-- top_menu_area 끝-->
</div><!-- top_1 끝-->


