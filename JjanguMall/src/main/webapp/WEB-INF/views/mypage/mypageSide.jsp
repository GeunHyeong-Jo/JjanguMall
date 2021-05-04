<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- mypage left menu -->
<div class="mypage_list">
  
    <div class="mypae_title">
      <span>마이페이지</span>
    </div>
    <div class="mem_box">
      <table class="mem_box_table">
        <tr>
          <td class="mem_menu" colspan="2"><span class="mem_name">${memName}</span> 님</td>
        </tr>
        
        
        <tr>
          <td class="mem_menu"><a href="${pageContext.request.contextPath }/cart/goods_cart">장바구니</a></td>
          <td class="mem_val_td"><span class="mam_val" id="productInCart">${userDTO.productInCart}</span> 개</td>
        </tr>
        
      </table>
    </div>

    <div class="mypage_menu">
      <table class="mypage_menu_table">
        <tr>
          <th id="menu_top">내 쇼핑정보</th>
        </tr>
        <tr>
          <td id="mem_order">
            <a href="${pageContext.request.contextPath }/mypage/mypage_orderlist">주문내역 · 배송조회</a>
          </td>
        </tr>
    	
          <td><a href="${pageContext.request.contextPath }/user/modifyForm">회원정보수정</a><br>
        </tr>
        <tr>
          <td><a href="${pageContext.request.contextPath }/user/memberOut">회원탈퇴</a></td>
        </tr>
      </table>
    </div>
  
 </div>
 

 
 
 
 
 
 