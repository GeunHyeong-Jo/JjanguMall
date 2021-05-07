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
    <div class="content"> 
           
      <div id="comments">
        <h1> Seller Info</h1>
		<div class="one_third first">
			<label for="NAME">NAME </label>
			<div>${userVo.userName }</div>
		</div>
		
		
		
		<div class="one_third">
			<label for="point">평균 별점</label> 
			<div>${userVo.avgPoint }</div>
		</div>
		
      </div>
    </div>
    <table>
          <thead>
            <tr>
              <th style="width: 10%">거래번호</th>
              <th style="width: 70%">거래 제목</th>
              <th style="width: 10%">거래 점수</th>
              <th style="width: 10%">구매 / 판매</th>
            </tr>
          </thead>
          <c:forEach var="tradeVo" items="${tradeList }" varStatus="status">
           <tbody>
            <tr>
              <td><a href="#">${tradeVo.no }</a></td>
              <td>${tradeVo.title }</td>
              <c:choose>
                <c:when test="${tradeVo.point == -1}">
 	              <td>평가 전</td>
                </c:when>
                <c:otherwise>
 	              <td>${tradeVo.point }</td>
                </c:otherwise>
              </c:choose>
              <c:choose>
                <c:when test="${userVo.userId eq tradeVo.sellerId }">
 	              <td>판매</td>
                </c:when>
                <c:otherwise>
 	              <td>구매</td>
                </c:otherwise>
              </c:choose>
            </tr>
           </tbody>
          </c:forEach>
         
        </table>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<c:import url="/WEB-INF/views/used/include/footer.jsp"/>
<c:import url="/WEB-INF/views/used/include/footerjs.jsp"/>
</body>
</html>