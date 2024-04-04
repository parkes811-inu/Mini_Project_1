<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="layout/footer.jsp" %>
<%@ include file="layout/footer2.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="static/css/style.css"> 
<title>장바구니</title>

</head>
<%
	String table_num = "1";
	String coke = "2,000";
%>
<body>
<div class="basket">
  <h1 class="title">장바구니</h1>
  <h2 class="subtitle"><%= table_num %> 번 테이블 주문서</h2>
  <div class="menu-item">
    <img src="static/img/coke.jpg" alt="콜라" />
    <div class="menu-description">
      <h3>콜라</h3>
      <p>1개</p>
      <p> <%= coke %> 원</p>
    </div>
  </div>
  
  <div class="menu-item">
    <img src="static/img/sprite.jpg" alt="스프라이트" />
    <div class="menu-description">
      <h3>스트라이트</h3>
      <p>1개</p>
      <p> <%= price %> 원 </p>
    </div>
  </div>
  <!-- 여기에 더 많은 메뉴 아이템을 추가할 수 있습니다. -->
</div>
	
</body>
</html>