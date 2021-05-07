<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품 리스트 -->
<div id="contents_area" style="margin-top: 40px;">
	<div class="product_list">
      <!-- 상품 한개(반복) -->
 		<c:forEach var="ProductDTO" items="${list}">
			<div class="product">
				<a href="${pageContext.request.contextPath }/goods_view?productNo=${ProductDTO.productNo}">

					<div class="product_img" 
					style="background-image: url(${pageContext.request.contextPath }/assets/image/thumb/${ProductDTO.img}.jpg);
					background-size:100%;">								
					</div>							
				</a>
				<div class="product_contents">
					<div class="product_name_div">
						<a href="${pageContext.request.contextPath }/goods_view?productNo=${ProductDTO.productNo}"><span class="product_name"><c:out value="${ProductDTO.name}"/></span></a>
					</div>
					<div class="product_price_div">						
						<div class="product_status status_new"></div>
				  		<a href="${pageContext.request.contextPath }/goods_view?productNo=${ProductDTO.productNo}"><span class="product_price"><c:out value="${ProductDTO.price}"/></span></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>