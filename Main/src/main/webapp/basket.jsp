<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="layout/footer.jsp" %>
<%@ include file="layout/footer2.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="static/css/style.css"> 
<title>장바구니</title>
</head>

<body>
<%
	int tableNum = 1;
	CartDAO cartDao2 = new CartDAO();
	List<Cart> uniqueCartList = cartDao2.getUniqueCartList(tableNum); // 중복 제거된 장바구니 목록 가져오기
%>
	<div class="basket">
	  <h1 class="title">장바구니</h1>
	  <h2 class="subtitle"><%= tableNum %> 번 테이블 주문서</h2>
  <%
      for (Cart cartItem : uniqueCartList) {
	          // uniqueCartList를 반복하며 각 항목을 표시
  %>
	  <div class="menu-item" data-tableNum="<%= cartItem.getTableNo()%>">
	    <img src="<%=request.getContextPath()%>/<%= cartItem.getImagePath() %>" alt="<%= cartItem.getProductName() %>" />
	    <div class="menu-description">
	      <h3><%= cartItem.getProductName() %></h3>
	      <p><%= cartItem.getAmount() %>개</p>
	      <p><%= cartItem.getPrice() %> 원</p>
	      <button class="quantity-decrease" data-product-id="<%= cartItem.getProductName() %>">-</button>
		  <span class="quantity"><%= cartItem.getAmount() %></span> <!-- 기본 수량 -->
		  <button class="quantity-increase" data-product-id="<%= cartItem.getProductName() %>">+</button>
	    </div>
	  </div>
  <%
      }
  %>
</div>

<script>
$(document).ready(function() {
    $('.quantity-decrease').click(function() {
    	// tableNum을 어떻게 받아올건지 ?
        var tableNum = 1; 
        	//$(this).data('tableNum');
        console.log(tableNum);
        var productName = $(this).data('productName'); // 제품 이름을 가져옵니다.
        console.log(productName);

        var quantitySpan = $(this).siblings('.quantity');
        console.log(quantitySpan);
        
        var currentQuantity = parseInt(quantitySpan.text());
        console.log(currentQuantity);
        
		var price = $(this).data('price')
        //if(currentQuantity == 0) {
        	// 장바구니에서 데이터 삭제하는 서블릿 작성
        	//$.ajax {
        		//type: "POST",
        		//url: "deleteB"
        	//}
        //}
        
        if (currentQuantity > 0) {
            var newQuantity = currentQuantity - 1;
            quantitySpan.text(newQuantity); // 화면에 수량 업데이트

            // AJAX 요청
            $.ajax({
                type: "POST",
                url: "updateQuantityServlet.jsp", // 서버 측 업데이트 처리를 위한 URL(서블릿)
                data: {
                    tableNum: tableNum, // 테이블 번호
                    productName: productName, // 제품 이름
                    quantity: newQuantity, // 변경된 수량
                    price: price // 제품 별 가격
                },
                success: function(response) {
                    // 서버로부터 성공적인 응답을 받았을 때의 처리
                    alert("수량이 업데이트되었습니다.");
                    //window.location.reload(); // 현재 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    // 에러 발생 시 처리
                    alert("수량 업데이트 중 오류가 발생했습니다.");
                }
            });
        }
    });

    $('.quantity-increase').click(function() {
        var productId = $(this).data('productId');
        var quantitySpan = $(this).siblings('.quantity');
        var currentQuantity = parseInt(quantitySpan.text());
        var newQuantity = currentQuantity + 1;
        quantitySpan.text(newQuantity);
        // 여기에 AJAX 요청을 추가하여 서버에 수량 변경사항 반영
    });
});
</script>
	
</body>

</html>

