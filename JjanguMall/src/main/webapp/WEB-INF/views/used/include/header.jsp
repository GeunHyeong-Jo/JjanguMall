<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/header.css" />
<link href="${pageContext.request.contextPath }/used/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">


<div id="top_1" style="width:1000px;">
	<div id="top_menu_area">
		<div id="top_logo">
			<a href="${pageContext.request.contextPath }">
				<img src="${pageContext.request.contextPath }/assets/image/logo.png" alt="쏭 문방구" style="width:130px; height:48px;"/>
			</a>
		</div><!-- top_logo 끝 -->
		
		
		<ul id="top_menu" class="utilMenu">
			<li><a href="${pageContext.request.contextPath }/used/index" class="utilMenuText">중고 거래</a></li>
			<c:if test="${memId == null}">
			<li><a href="${pageContext.request.contextPath }/user/loginForm" class="utilMenuText">로그인</a></li>
			<li><a href="${pageContext.request.contextPath }/user/joinForm" class="utilMenuText">회원가입</a></li>
			</c:if>
			<c:if test="${memId != null}">
			<li>${memName }님</li>
				<li><a href="${pageContext.request.contextPath }/mypage/mypage_orderlist" class="utilMenuText">마이페이지</a></li>
			<li id="logoutBtn"><a href="${pageContext.request.contextPath }/user/logout" class="utilMenuText">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath }/used/user/sellitem" class="utilMenuText">거래내역</a></li>
			</c:if>
		</ul>
	</div><!-- top_menu_area 끝-->
</div><!-- top_1 끝-->
