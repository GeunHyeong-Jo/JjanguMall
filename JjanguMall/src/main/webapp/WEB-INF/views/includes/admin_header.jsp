<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="top_1" style="width:1100px;">
	<div id="top_menu_area">
		<div id="top_logo">
			<a href="${pageContext.request.contextPath }/admin/productList">
				<image src="${pageContext.request.contextPath }/assets/image/admin_logo.png" />
			</a>
		</div><!-- top_logo 끝 -->
		
		<div id="top_cate">
			<table>
				<tbody>
					<tr>
						<td><!-- 상품관리 -->
							<div>
								<a href="${pageContext.request.contextPath }/admin/productList" class="cate1">상품관리</a>
							</div>
						</td>
						
					</tr>
				</tbody>			
			</table>
		</div><!-- top_cate 끝 -->
		
		<ul id="top_menu" class="utilMenu">
			<li><a href="${pageContext.request.contextPath }/admin/logout" class="utilMenuText">로그아웃</a></li>
		</ul>
		
	</div><!-- top_menu_area 끝-->
</div><!-- top_1 끝-->




<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

