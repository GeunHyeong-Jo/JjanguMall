<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>

<html>
<head>
<title>Colossus</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

</head>
<body id="top">
<!-- ################################################################################################ -->
  <c:import url="/WEB-INF/views/used/include/header.jsp"/>
<!-- ################################################################################################ -->
<div class="wrapper">
  <div id="slider" class="clear"> 
    <!-- ################################################################################################ -->
    <div class="flexslider basicslider">
      <ul class="slides">
        <c:forEach var="imageVo" items="${imageList }">
          <li><img src="${pageContext.request.contextPath }/used/upload/${imageVo.no}.png" alt=""></li>
        </c:forEach>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <div class="content"> 
      <div id="comments">
		<div class="three_quarter first">
			<label for="title">Title </label>
			<div style="padding-top: 8px; font-weight: bold;"> ${vo.title }</div>
		</div>
		
		<div class="one_quarter">
			<label for="password">판매자</label> 
			<div style="padding-top: 8px; font-weight: bold;"><a href="${pageContext.request.contextPath }/used/user/seller/${vo.userId }"> ${vo.name }</a></div>
		</div>
		
		<div class="three_quarter first">
			<label for="Contents">Contents</label>
			<textarea name="Contents" id="Contents" cols="25" rows="10">${vo.contents }</textarea>
		</div>
		
		
		<div class="one_quarter">
			<label for="avgPoint">판매자 평점</label>
			<c:choose>
				<c:when test="${vo.avgPoint eq null}">
					<input name="submit" type="submit" value="첫 평가 전입니다">
				</c:when>			
				<c:otherwise>
					<input name="submit" type="submit" value="${vo.avgPoint }">
				</c:otherwise>
			</c:choose> 
		</div>
		
		<div class="one_quarter">
			<form action="${pageContext.request.contextPath }/used/trade/apply">
	        	<label for="avgPoint"></label>
	        	<input name="sellerId" type="hidden" value="${vo.userId }"> 
	        	<input name="no" type="hidden" value="${vo.no }"> 
			    <input name="submit" type="submit" value="거래 신청">
			</form>
		</div>
      </div>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!--  footer -->
<c:import url="/WEB-INF/views/used/include/footer.jsp"/><a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<!-- JAVASCRIPTS -->
<script src="${pageContext.request.contextPath }/used/layout/scripts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/used/layout/scripts/jquery.backtotop.js"></script>
<script src="${pageContext.request.contextPath }/used/layout/scripts/jquery.mobilemenu.js"></script>
<script src="${pageContext.request.contextPath }/used/layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>