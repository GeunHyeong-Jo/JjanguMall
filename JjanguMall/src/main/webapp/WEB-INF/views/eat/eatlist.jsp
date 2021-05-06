<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		location.href ="${pageContext.request.contextPath }/eat/"+e+"?no=0";

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
				<h1 class="h2">먹은 칼로리 수치</h1>
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
						<option value="months">월별</option>
					</select>
				</div>
			</div>

			<canvas class="my-4" id="myChart" width="900" height="380"></canvas>

			<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/eat/weeks?no=${no+1}">◀</a></li>
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/eat/weeks?no=0">오늘날짜로
						돌아오기</a></li>
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/eat/weeks?no=${no-1}">▶</a></li>
			</ul>
			</nav>

			<h2>Section title</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>먹은 음식</th>
							<th>해당 칼로리</th>
							<th>먹은 시간</th>
							<th>먹은 날짜</th>
							<th>먹은 요일</th>
							<th>삭제</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items='${list }' var='vo'>
							<tr>
								<td width="110">${vo.foodDTO.name}</td>
								<td width="110">${vo.foodDTO.calory}</td>
								<td>${vo.foodlistDTO.eatTime }</td>
								<td>${vo.foodlistDTO.reg_date }</td>
								<c:choose>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 1 }">
										<td>월</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 2 }">
										<td>화</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 3 }">
										<td>수</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 4 }">
										<td>목</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 5 }">
										<td>금</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 6 }">
										<td>토</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 0 }">
										<td>일</td>
									</c:when>
								</c:choose>
								<td><a
									href="${pageContext.request.contextPath }/eat/delete?no=${ vo.foodlistDTO.foodListNo}">삭제</a></td>
								<td><a
									href="${pageContext.request.contextPath }/eat/update?no=${ vo.foodlistDTO.foodListNo}">수정</a></td>
							</tr>
							<br>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-start">
				<div class="col-4">총 먹은 칼로리 : ${authUser.totalCalory }</div>
				<div class="col-4">하루 권장 칼로리 : ${calory}</div>
				<div class="col-4">1 주일간 총 칼로리 : ${authUser.totalCalory- calory*7 }</div>
			</div>

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
          labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
          datasets: [{
            data: [${Sunday},${Monday}, ${Tuesday}, ${Wednesday}, ${Thursday}, ${Friday}, ${Saturday}],
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


	<!-- 음식 내역 및 칼로리 수치 리스트 -->
	<p>오늘 먹은 음식 및 먹은 시간대를 체크해주세요.</p>
	<form action="${pageContext.request.contextPath }/calory/eat/insert"
		method="post">
		사용자 : ${memId } <br> 먹은 음식 <input type="text" name="name"
			value=""><br> 먹은 시간
		<fieldset>
			<legend>먹은 시간</legend>
			<label>아침</label> <input type="radio" name="eatTime" value="morning"
				checked="checked"> <label>점심</label> <input type="radio"
				name="eatTime" value="lunch"> <label>저녁</label> <input
				type="radio" name="eatTime" value="evening">
		</fieldset>
		<input type="submit" value="등록">
	</form>
	<br>
</body>
</html>