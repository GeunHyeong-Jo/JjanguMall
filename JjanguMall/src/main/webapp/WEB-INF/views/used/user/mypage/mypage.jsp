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
      <div id="comments">
        <h2>Write A Comment</h2>
        <form action="" method="post">
          <div class="two_third first">
            <label for="name">Name <span>*</span></label>
            <input type="text" name="name" id="name" value="" size="22">
          </div>
          <div class="two_third first">
            <label for="email">Password <span>*</span></label>
            <input type="text" name="Password" id="Password" value="" size="22">
          </div>
          <div class="two_third first">
            <label for="url">Region</label>
            <input type="text" name="Region" id="Region" value="" size="22">
          </div>
          <div class="two_third first">
            <label for="comment">Your Comment</label>
            <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
          </div>
          <div class="first">
            <input name="submit" type="submit" value="Submit Form">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
        </form>
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