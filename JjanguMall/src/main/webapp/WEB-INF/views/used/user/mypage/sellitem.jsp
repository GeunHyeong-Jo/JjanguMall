<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Colossus | Pages | Full Width</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath }/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
  <c:import url="/WEB-INF/views/used/include/header.jsp"/>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <<c:import url="/WEB-INF/views/used/user/mypage/sidebar.jsp"/>
    <div class="content three_quarter"> 
      <h1>판매내역</h1>
      <div class="scrollable">
        <table>
          <thead>
            <tr>
              <th style="width: 10%">번호</th>
              <th style="width: 75%">거래명</th>
              <th style="width: 15%">거래상태</th>
            </tr>
          </thead>
          <tbody>
           <c:forEach var="itemVo" items="${itemList }" varStatus="status">
            <tr>
              <td>${itemVo.no }</td>
              <td><a href="${pageContext.request.contextPath }/used/detail/${itemVo.no }">${itemVo.title }</a></td>
              <c:choose>
                <c:when test="${itemVo.status eq 0 }">
 	              <td>거래 전</td>
                </c:when>
                <c:otherwise>
 	              <td>거래 완료</td>
                </c:otherwise>
              </c:choose>
            </tr>
           </c:forEach>
          </tbody>
         </table>
      </div>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<c:import url="/WEB-INF/views/used/include/footer.jsp"/>
<c:import url="/WEB-INF/views/used/include/footerjs.jsp"/>
</body>
</html>