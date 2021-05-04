<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<title>Colossus | Pages | Gallery</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<head>
<link href="${pageContext.request.contextPath }/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
/* DEMO ONLY */
.container .demo{text-align:center;}
.container .demo div{padding:8px 0;}
.container .demo div:nth-child(odd){color:#FFFFFF; background:#CCCCCC;}
.container .demo div:nth-child(even){color:#FFFFFF; background:#979797;}
@media screen and (min-width:180px) and (max-width:900px){.container .demo div{margin-bottom:0;}}
/* DEMO ONLY */
</style>
</head>
</head>
  <c:import url="/WEB-INF/views/used/include/header.jsp"/>
<body id="top">



<div class="wrapper row3">
  <main class="container clear"> 
    <div class="content"> 
      <div id="gallery">
        <figure>
          <header class="heading">Index</header>
          <form action="${pageContext.request.contextPath }/used/search/1">
          
          <div id="comments">
            <div class="one_quarter first">
              <select name="option" >
    			<option value="title">-----검색 설정------</option>
    			<option value="title">제 목</option>
    			<option value="contents">내 용</option>
    			<option value="region">지 역</option>
  			  </select>
            </div>
            <div class="two_quarter">
          	  <input type="text" name="search" value="${searchVo.search }"> 
            </div>
            <div class="one_quarter">
              <input type="submit" value="검 색">
            </div>
          </div>
          </form>
            <ul class="nospace clear">
          	  <c:forEach var="itemVo" items="${itemList }" varStatus="status">
          	    <c:choose>
          	      <c:when test="${status.index % 3 == 0 }">
                    <li class="one_third first" style="height: 380px;"><a href="${pageContext.request.contextPath }/used/detail/${itemVo.no }"><img src="${pageContext.request.contextPath }/upload/${itemVo.imageNo }.png" alt=""><p>${itemVo.title }</p></a></li>
                  </c:when>
                  <c:otherwise>
            	    <li class="one_third" style="height: 380px;"><a href="${pageContext.request.contextPath }/used/detail/${itemVo.no }"><img src="${pageContext.request.contextPath }/upload/${itemVo.imageNo }.png" alt=""><p>${itemVo.title }</p></a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
          </figure>
      </div>
      <div class="group btmspace-50 demo">
        <c:if test=""></c:if>
        <div class="one_quarter first" onclick="location.href='${pageContext.request.contextPath }/used/regist'" style="cursor:pointer;">글 쓰 기</div>
      </div>
       <nav class="pagination">
        <ul>
          <c:if test="${pageVo.page ne 1 }">
            <li><a href="${pageContext.request.contextPath }/used/search/${pageVo.page - 1 }?option=${searchVo.option }&search=${searchVo.search }">&laquo; Previous</a></li>
          </c:if>
          <c:forEach var="i" begin='${pageVo.minView }' end="${pageVo.maxView }">
          	<c:choose>
			  <c:when test="${pageVo.page  eq i }">
				<li>${i }</li>
			  </c:when>
			  <c:otherwise>
				<li><a href="${pageContext.request.contextPath }/used/search/${i }?option=${searchVo.option }&search=${searchVo.search }">${i }</a></li>
			  </c:otherwise>
			</c:choose>
          </c:forEach>
          <c:if test="${pageVo.page ne pageVo.maxView }">
            <li><a href="${pageContext.request.contextPath }/used/search/${pageVo.page + 1 }?option=${searchVo.option }&search=${searchVo.search }">Next &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
    </div>
    <div class="clear"></div>
  </main>
</div>

</body>



<!--  footer -->
<c:import url="/WEB-INF/views/used/include/footer.jsp"/>
<c:import url="/WEB-INF/views/used/include/footerjs.jsp"/>


<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
</body>
</html>