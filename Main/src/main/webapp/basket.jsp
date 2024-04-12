<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="java.awt.geom.Path2D"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="store.DAO.CartDAO" %>
<%@ page import="store.DTO.Cart" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="static/css/style.css"> 
<title>장바구니</title>
</head>

<body>
<%
	//세션에서 tableNum 값을 가져옵니다. 세션에 값이 없을 경우를 대비하여 기본값을 설정할 수 있습니다.
	Integer tableNumObj_basket = (Integer) request.getSession().getAttribute("tableNum");
	int tableNum1 = 0; // 기본값 설정
	
	if (tableNumObj_basket != null) {
	    tableNum1 = tableNumObj_basket.intValue(); // intValue() 메소드를 사용하여 int로 변환
	}
	
	CartDAO cartDao2 = new CartDAO();
	List<Cart> uniqueCartList = cartDao2.getUniqueCartList(tableNum1); // 중복 제거된 장바구니 목록 가져오기
	
	if(uniqueCartList.isEmpty()) {
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
	<%@ include file="layout/footer.jsp" %>
	<%@ include file="layout/footer2.jsp" %>
	<div class="basket">
	  <h1 class="title">장바구니</h1>
	  <h2 class="subtitle"><%= tableNum1 %> 번 테이블 주문서</h2>
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
	}
  %>
</div>

<script>
$(document).ready(function() {
    $('.quantity-decrease').click(function() {
 		var tableNum = <%= tableNum1 %>;
        var productName = $(this).data('productId'); // 제품 이름을 가져옵니다.
        //console.log(productName);
        var quantitySpan = $(this).siblings('.quantity');
        var currentQuantity = parseInt(quantitySpan.text());
		var price = $(this).data('price')
		var operation = "-";
        
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
                    // quantity: newQuantity, // 변경된 수량
                	operation: operation
                    //price: price // 제품 별 가격
                },
                success: function(response) {
                    // 서버로부터 성공적인 응답을 받았을 때의 처리
                    alert("수량이 업데이트되었습니다.");
                    window.location.reload(); // 현재 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    // 에러 발생 시 처리
                    alert("수량 업데이트 중 오류가 발생했습니다.");
                }
            });
        }
    });

    $('.quantity-increase').click(function() {
    	var tableNum = <%= tableNum1 %>; 
    	var productName = $(this).data('productId'); // 제품 이름을 가져옵니다.
    	var quantitySpan = $(this).siblings('.quantity');
        var currentQuantity = parseInt(quantitySpan.text());
        var newQuantity = currentQuantity + 1;
        quantitySpan.text(newQuantity);
		var operation = "+";

        // 여기에 AJAX 요청을 추가하여 서버에 수량 변경사항 반영
        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "updateQuantityServlet.jsp", // 서버 측 업데이트 처리를 위한 URL(서블릿)
            data: {
                tableNum: tableNum, // 테이블 번호
                productName: productName, // 제품 이름
                operation: operation
                //quantity: newQuantity, // 변경된 수량
                //price: price // 제품 별 가격
            },
            success: function(response) {
                // 서버로부터 성공적인 응답을 받았을 때의 처리
                alert("수량이 업데이트되었습니다.");
                window.location.reload(); // 현재 페이지 새로고침
            },
            error: function(xhr, status, error) {
                // 에러 발생 시 처리
                alert("수량 업데이트 중 오류가 발생했습니다.");
            }
        });
    });
});
</script>
	
</body>

</html>

