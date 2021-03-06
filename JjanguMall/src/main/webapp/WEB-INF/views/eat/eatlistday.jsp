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
		location.href ="${pageContext.request.contextPath }/calory/eat/"+e+"?no=0";

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
				<h1 class="h2">Dashboard</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group mr-2">
						<button class="btn btn-sm btn-outline-secondary">Share</button>
						<button class="btn btn-sm btn-outline-secondary">Export</button>
					</div>
					<li>?????? ??????</li>
					<select class="form-control" name="showList" onchange=changeList(this.value)>
						<option >===??????===</option>
						<option value="index">?????? ??????</option>
						<option value="days" selected>??????</option>
						<option value="weeks">?????????</option>
						<option value="months">??????</option>
					</select>
				</div>
			</div>

			<canvas class="my-4" id="myChart" width="900" height="380"></canvas>
				
			<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/eat/days?no=${no+1}">???</a></li>
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/eat/days?no=0">???????????????
						????????????</a></li>
				<li class=page-item><a class="page-link"
					href="${pageContext.request.contextPath }/eat/days?no=${no-1}">???</a></li>
			</ul>
			</nav>

			<h2>Section title</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>?????? ??????</th>
							<th>?????? ?????????</th>
							<th>?????? ??????</th>
							<th>?????? ??????</th>
							<th>?????? ??????</th>
							<th>??????</th>
							<th>??????</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items='${list }' var='vo'>
							<tr>
								<td width="110">${vo.foodDTO.name}</td>
								<td width="110">${vo.foodDTO.calory}</td>
								<td>${vo.foodlistDTO.eat_Time }</td>
								<td>${vo.foodlistDTO.reg_date }</td>
								<c:choose>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 1 }">
										<td>???</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 2 }">
										<td>???</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 3 }">
										<td>???</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 4 }">
										<td>???</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 5 }">
										<td>???</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 6 }">
										<td>???</td>
									</c:when>
									<c:when test="${vo.foodlistDTO.reg_date.day eq 0 }">
										<td>???</td>
									</c:when>
								</c:choose>
								<td><a
									href="${pageContext.request.contextPath }/calory/eat/delete?no=${ vo.foodlistDTO.foodListNo}">??????</a></td>
								<td><a
									href="${pageContext.request.contextPath }/calory/eat/update?no=${ vo.foodlistDTO.foodListNo}">??????</a></td>
							</tr>
							<br>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row justify-content-start">
				<div class="col-4">??? ?????? ????????? : ${authUser.totalCalory }</div>
				<div class="col-4">?????? ?????? ????????? : ${calory}</div>
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
          labels: ["Morning", "Lunch", "Evening"],
          datasets: [{
            data: [${Morning},${Lunch}, ${Evening}],
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


	<!-- ?????? ?????? ??? ????????? ?????? ????????? -->
	<p>?????? ?????? ?????? ??? ?????? ???????????? ??????????????????.</p>
	<form action="${pageContext.request.contextPath }/eat/insert"
		method="post">
		????????? : ${authUser.name } <br> ?????? ?????? <input type="text" name="name"
			value=""><br> ?????? ??????
		<fieldset>
			<legend>?????? ??????</legend>
			<label>??????</label> <input type="radio" name="eatTime" value="morning"
				checked="checked"> <label>??????</label> <input type="radio"
				name="eatTime" value="lunch"> <label>??????</label> <input
				type="radio" name="eatTime" value="evening">
		</fieldset>
		<input type="submit" value="??????">
	</form>
	<br>
</body>
</html>