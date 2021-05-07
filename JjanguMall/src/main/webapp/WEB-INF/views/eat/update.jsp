<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/dashboard/">

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

</head>
<script type="text/javascript">
	function changeList(e) {
		location.href = "${pageContext.request.contextPath }/eat/" + e
				+ "?no=0";

	}
</script>
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
	feather.replace()
</script>
<body>
	<div class="container-fluid">
		<div class="row">
			<c:import url="/WEB-INF/views/includes/header.jsp" />
			<c:import url="/WEB-INF/views/includes/navigation.jsp" />
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

				<h1>업데이트 내역</h1>
				<p></p>
				<form
					action="${pageContext.request.contextPath }/calory/eat/update?no=${no}"
					method="post">
					사용자 : ${memId } <br> 먹은 음식 <input type="text" name="name"
						value=""><br> 먹은 시간
					<fieldset>
						<legend>먹은 시간</legend>
						<label>아침</label> <input type="radio" name="eatTime"
							value="morning" checked="checked"> <label>점심</label> <input
							type="radio" name="eatTime" value="lunch"> <label>저녁</label>
						<input type="radio" name="eatTime" value="evening">
					</fieldset>
					<input type="submit" value="등록">
				</form>
				<br>
				<p>
					<a href="${pageContext.request.contextPath }/eat/index">리스트
						바로가기</a>
				</p>
			</main>
		</div>
	</div>
</body>
</html>