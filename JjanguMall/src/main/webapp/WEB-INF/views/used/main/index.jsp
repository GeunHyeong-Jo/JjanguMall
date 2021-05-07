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
        <li><img src="used/images/demo/slides/01.png" alt="">
        </li>
        <li><img src="used/images/demo/slides/02.png" alt="">
        </li>
        <li><img src="used/images/demo/slides/03.png" alt="">
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>

<div class="wrapper row2">
  <div class="latest"> 
    <!-- ################################################################################################ -->
    <ul class="nospace group">
      <c:forEach var="itemVo" items="${itemList }" varStatus="status">
        <li>
          <figure><a class="overlay" href="${pageContext.request.contextPath }/used/detail/${itemVo.no }"><img src="${pageContext.request.contextPath }/used/upload/${itemVo.imageNo }.png" alt=""></a>
          </figure>
        </li>
      </c:forEach>
    </ul>
    <!-- ################################################################################################ -->
  </div>
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