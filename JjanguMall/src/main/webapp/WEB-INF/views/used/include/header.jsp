<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/used/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="${pageContext.request.contextPath }">Used</a></h1>
    </div>
    <!-- ################################################################################################ -->
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="${pageContext.request.contextPath }">Home</a></li>
        <li><a class="drop" href="${pageContext.request.contextPath }/used/index/1">중고 거래</a>
        </li>
       
        <c:choose>
		  <c:when test="${empty authUser }">
            <li><a href="${pageContext.request.contextPath }/used/user/signin">Sign in</a></li>
            <li><a href="${pageContext.request.contextPath }/used/user/signup">Sign up</a></li>
          </c:when>
          <c:otherwise>
            <li><a href="${pageContext.request.contextPath }/used/user/mypage">My page</a></li>
            <li><a href="${pageContext.request.contextPath }/used/user/signout">Sign out</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </nav>
    <!-- ################################################################################################ -->
  </header>
</div>

</body>
</html>