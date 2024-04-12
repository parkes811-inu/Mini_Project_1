<!-- 2024.04.05 박은서
     주문하기 버튼 클릭시 나오는 결제 화면 jsp
 -->
<%@page import="java.awt.geom.Path2D"%>
<%@page import="java.util.List"%>
<%@page import="store.DAO.CartDAO"%>
<%@page import="store.DTO.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css"> 
<title>결제</title>
</head>
<body>
<%
	//세션에서 tableNum 값을 가져옵니다. 세션에 값이 없을 경우를 대비하여 기본값을 설정할 수 있습니다.
	Integer tableNum_order = (Integer) session.getAttribute("tableNum");
	if (tableNum_order == null) {
	    // 세션에 tableNum 값이 없을 경우, 새로운 값을 파라미터에서 읽어와서 세션에 저장
	    String tableNumStr = request.getParameter("tableNum");
	    if (tableNumStr != null) {
	        tableNum_order = Integer.parseInt(tableNumStr);
	        session.setAttribute("tableNum", tableNum_order);
	    }
	}
	
    CartDAO cartDao = new CartDAO();
    List<Cart> cartList = cartDao.getUniqueCartList(tableNum_order); 
    int totalPrice = 0; // 총 가격 계산을 위한 변수
    
	if(cartList.isEmpty()) {
%>
	  <!-- 배달의 민족 장바구니를 참고해서 꾸며주세요. -->   
      <div class="container">
        <img alt="basket" src="static/img/emptyBasket.jpg" >
    	<a href="modal_menu.jsp?tableNum=<%=session.getAttribute("tableNum")%>">더 담으러가기</a>
      </div>
<%		 

	}
	else {
%>
  <h1 class="title">결제</h1>
<div class="card">
  <h2 class="subtitle" id="data-tableNo"><%= tableNum_order %> 번 테이블 주문서</h2>
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
      <span id="data-totalPrice">₩ <%= totalPrice %> 원</span>
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
<%
	}
%>

<script type="css">

</script>
</body>
</html>
