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
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<c:import url="/WEB-INF/views/used/include/header.jsp"/>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <div class="content"> 
           
      <div id="comments">
        
        <h2>${param.result }</h2>
       <form action="${pageContext.request.contextPath }/used/review?no=${param.no }" method="post">
		<div class="one_harf first">
		  <label for="Point">Point <span>*</span></label>
          <select name="point" >
    		<option value="5">-----점수 등록------</option>
    		<option value="1">1 점</option>
    		<option value="2">2 점</option>
    		<option value="3">3 점</option>
    		<option value="4">4 점</option>
    		<option value="5">5 점</option>
  		  </select>
        </div>
		<div class="block clear">
			<label for="comment">Your Comment</label>
			<textarea name="review" id="review" cols="25" rows="10"></textarea>
		</div>
		
		<div>
			<input name="submit" type="submit" value="리뷰 등록">
			&nbsp; 
			<input name="reset" type="reset" value="Reset Form">
		</div>
		</form>
      </div>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<c:import url="/WEB-INF/views/used/include/footer.jsp"/>
<c:import url="/WEB-INF/views/used/include/footerjs.jsp"/>
</body>
</html>