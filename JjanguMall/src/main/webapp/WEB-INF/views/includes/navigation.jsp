<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
<div class="sidebar-sticky">
	<ul class="nav flex-column">
		<li class="nav-item"><a class="nav-link active"
			href="${ pageContext.request.contextPath}/calory/index"> <span
				data-feather="home"> </span>메인 화면</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="${pageContext.request.contextPath }/calory/eat/index"> <span
				data-feather="meh"></span> 먹은 리스트
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${ pageContext.request.contextPath}/calory/exercise/index"> <span
				data-feather="file"></span> 운동 리스트
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${ pageContext.request.contextPath}/calory/board/index"> <span
				data-feather="shopping-cart"></span> 문의 사항
		</a></li>
	</ul>

	<!-- h6
		class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		<span>Saved reports</span> <a
			class="d-flex align-items-center text-muted" href="#"> <span
			data-feather="plus-circle"></span>
		</a>
	</h6>
	<ul class="nav flex-column mb-2">
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> Current month
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> Last quarter
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> Social engagement
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> Year-end sale
		</a></li>
	</ul>
	 -->
</div>
</nav>