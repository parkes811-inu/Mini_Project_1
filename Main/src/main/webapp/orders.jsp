<!-- 2024.04.05 박은서
	주문하기 버튼 클릭시 나오는 결제 화면 jsp
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="static/css/style.css"> 
<title>결제</title>

</head>
<%
	String table_num = "1";
	String total_price = "1,000";
%>
<body>
  <h1 class="title">결제</h1>

<div class="card">
  <h2 class="subtitle"><%= table_num %> 번 테이블 주문서</h2>
  <div class="order-details">
    <div class="order-header">
      <span>주문 정보</span>
      <span>수량</span>
      <span>금액</span>
    </div>
    <div class="order-item">
      <span>불고기 버거</span>
      <span>1</span>
      <span>₩9,000</span>
    </div>
    <div class="order-item">
      <span>비빔 버거</span>
      <span>1</span>
      <span>₩9,000</span>
    </div>
    <div class="total-amount">
  	  <br>
      <span>총합</span>
      <span>₩ <%= total_price %> 원</span>
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

	<!--  <a href="modal_menu.jsp">시~발</a>-->
	<script src="static/js/orders.js"></script> <!-- JavaScript 파일 참조 -->
</body>
</html>