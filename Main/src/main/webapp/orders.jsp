<!-- 2024.04.05 박은서
     주문하기 버튼 클릭시 나오는 결제 화면 jsp
 -->
<%@page import="java.util.List"%>
<%@page import="store.DAO.CartDAO"%>
<%@page import="store.DTO.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css"> 
<title>결제</title>
</head>
<body>
<%
    int tableNum = 1; // 예시 테이블 번호
    CartDAO cartDao = new CartDAO();
    List<Cart> cartList = cartDao.getUniqueCartList(tableNum); 
    int totalPrice = 0; // 총 가격 계산을 위한 변수
%>
  <h1 class="title">결제</h1>
<div class="card">
  <h2 class="subtitle"><%= tableNum %> 번 테이블 주문서</h2>
  <div class="order-details">
    <div class="order-header">
      <span>주문 정보</span>
      <span>수량</span>
      <span>금액</span>
    </div>
    <% for (Cart cartItem : cartList) { %>
    <div class="order-item">
      <span><%= cartItem.getProductName() %></span>
      <span><%= cartItem.getAmount() %></span>
      <span>₩<%= cartItem.getPrice() %></span>
    </div>
    <% totalPrice += cartItem.getPrice(); %>
    <% } %>
    <div class="total-amount">
      <br>
      <span>총합</span>
      <span>₩ <%= totalPrice %> 원</span>
    </div>
  </div>
  <div class="point">
        <input type="text" id="phoneNum" placeholder="포인트 적립 번호" />
    </div>
  <div class="buttons">
    <button id="cardButton" class="btn black">카드</button>
    <button id="cashButton" class="btn black">현금</button>
    <button id="pointButton" class="btn black">포인트 사용</button>
    <button id="cancelButton" class="btn black">결제 취소</button>
  </div>
</div>

    <script src="<%=request.getContextPath()%>/static/js/orders.js"></script> <!-- JavaScript 파일 참조 -->
</body>
</html>
