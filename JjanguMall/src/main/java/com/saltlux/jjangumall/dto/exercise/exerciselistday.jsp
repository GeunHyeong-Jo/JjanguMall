<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
		location.href ="${pageContext.request.contextPath }/exercise/"+e+"?no=0";

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
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
				<h1 class="h2">운동한 칼로리 수치</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group mr-2">
						<button class="btn btn-sm btn-outline-secondary">Share</button>
						<button class="btn btn-sm btn-outline-secondary">Export</button>
					</div>
					<li>보기 방식 선택</li> <select class="form-control" name="showList"
						onchange=changeList(this.value)>
						<option selected>===선택===</option>
						<option value="index">전체 보기</option>
						<option value="days">일별</option>
						<option value="weeks">주차별</option>
					</select>
				</div>
			</div>

			<canvas class="my-4" id="myChart" width="900" height="380"></canvas>

			<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/exercise/days?no=${no+1}">◀</a></li>
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/exercise/days?no=0">오늘날짜로
						돌아오기</a></li>
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/exercise/days?no=${no-1}">▶</a></li>
			</ul>
			</nav>

			<h2>Section title</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>운동 종류</th>
							<th>10분당 소모 칼로리</th>
							<th>운동 시간</th>
							<th>운동 날짜</th>
							<th>운동 요일</th>
							<th>삭제</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items='${list }' var='vo'>
							<tr>
								<td width="110">${vo.exerciseVo.name }</td>
								<td width="110">${vo.exerciseVo.calory }</td>
								<td>${vo.time }</td>
								<td>${vo.date }</td>
								<c:choose>
									<c:when test="${vo.date.day eq 1 }">
										<td>월</td>
									</c:when>
									<c:when test="${vo.date.day eq 2 }">
										<td>화</td>
									</c:when>
									<c:when test="${vo.date.day eq 3 }">
										<td>수</td>
									</c:when>
									<c:when test="${vo.date.day eq 4 }">
										<td>목</td>
									</c:when>
									<c:when test="${vo.date.day eq 5 }">
										<td>금</td>
									</c:when>
									<c:when test="${vo.date.day eq 6 }">
										<td>토</td>
									</c:when>
									<c:when test="${vo.date.day eq 0 }">
										<td>일</td>
									</c:when>
								</c:choose>
								<td><a
									href="${pageContext.request.contextPath }/eat/delete?no=${ vo.getNo()}">삭제</a></td>
								<td><a
									href="${pageContext.request.contextPath }/eat/update?no=${ vo.getNo()}">수정</a></td>
							</tr>
							<br>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-start">
				<div class="col-4">총 소모한 칼로리 : ${authUser.totalCalory }</div>
				<div class="col-4">하루 권장 칼로리 : ${calory}</div>
			</div>

			<br>
			<br>
			<br>

			<form
				action="${pageContext.request.contextPath }/exercise/update?no=${no}"
				method="post">
				사용자 : ${authUser.name } <br> 실행 운동 : <input type="text"
					name="name" value=""><br> 운동 시간(10분단위) : <input
					type="text" name="time" value=""><br> <input
					type="submit" value="등록">
			</form>
			<br>
			<p>
				<a href="${pageContext.request.contextPath }/exercise/index">리스트
					바로가기</a>
			</p>
			</main>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>

	<!-- Icons -->
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
      feather.replace()
    </script>

	<!-- Graphs -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script>
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Calory"],
          datasets: [{
            data: [${authUser.totalCalory }],
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#007bff',
            borderWidth: 4,
            pointBackgroundColor: '#007bff'
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              }
            }]
          },
          legend: {
            display: false,
          }
        }
        });
      </script>
</body>
</html>