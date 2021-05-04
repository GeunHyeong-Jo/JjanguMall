<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품 리스트 -->
<div id="contents_area" style="margin-top: 40px;">
	<div class="product_list">
      <!-- 상품 한개(반복) -->
 		<c:forEach var="list" items="${list}">
			<div class="product">
				<a href="${pageContext.request.contextPath }/goods/goods_view?productCode=${list.productCode}">

					<div class="product_img" 
					style="background-image: url(${pageContext.request.contextPath }/assets/image/thumb/${list.thumbImg});
					background-size:100%;">								
					</div>							
				</a>
				<div class="product_contents">
					<div class="product_name_div">
						<a href="${pageContext.request.contextPath }/goods/goods_view?productCode=${list.productCode}"><span class="product_name"><c:out value="${list.productName}"/></span></a>
					</div>
					<div class="product_price_div">						
						<div class="product_status status_new"></div>
				  		<a href="${pageContext.request.contextPath }/goods/goods_view?productCode=${list.productCode}"><span class="product_price"><c:out value="${list.originPrice}"/></span></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>