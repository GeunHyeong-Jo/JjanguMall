<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/mypage.css">    


<table cellpadding=0 cellspacing=0 border=0 class="outline_both">
	<tr>
		<td valign=top width=20% nowrap style="padding-left:50px;">
			<!-- 마이페이지 -->
			<jsp:include page="/WEB-INF/views/mypage/mypageSide.jsp" />
		</td>
		<td valign=top  bgcolor="" class="outline_side">
			<!-- 내용 -->
			<jsp:include page="/WEB-INF/views${contents}"/>
		</td>
	</tr>
</table>

