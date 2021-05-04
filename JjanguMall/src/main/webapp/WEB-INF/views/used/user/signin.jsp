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
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <div class="content"> 
           
      <div id="comments">
        
        <h2>${param.result }</h2>
       <form action="${pageContext.request.contextPath }/user/auth" method="post">
		<div class="one_half first">
			<label for="ID">ID <span>*</span></label>
			<input type="text" name="id" id="id" value="" size="22">
		</div>
		
		<div class="one_half third">
			<label for="password">Password <span>*</span></label> 
			<input type="password" name="password" id="password" value="" size="22">
		</div>
		
		<div>
			<input name="submit" type="submit" value="Sign in">
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

<c:import url="/WEB-INF/views/include/footer.jsp"/>
<c:import url="/WEB-INF/views/include/footerjs.jsp"/>
</body>
</html>