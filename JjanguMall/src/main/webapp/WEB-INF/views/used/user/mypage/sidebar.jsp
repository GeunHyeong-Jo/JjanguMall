<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body id="top">
    <div class="sidebar one_quarter first"> 
      <h6>거래 내역</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="${pageContext.request.contextPath }/used/user/sellitem">판매 중인 물품</a></li>
          <li><a href="${pageContext.request.contextPath }/used/user/sell"> 판매 거래 중</a></li>
          <li><a href="${pageContext.request.contextPath }/used/user/buy"> 구매 거래 중</a></li>
        </ul>
      </nav>
    </div>
   </body>
  </html>
  