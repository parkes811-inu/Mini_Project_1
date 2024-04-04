<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 추가된 수량 만큼 
	String amount = "100";
	String price = "10000";
%>
<footer class="footer2">
	<!-- 주문 요약 -->
	<div class="order-summary">
	    <div class="order-info">
	        <p>수량: <span class="order-quantity">    <%= amount %>    </span>     개</p>
	        <br>
	        <p>금액: <span class="order-amount">      <%= price %>     </span>     원</p>
	    </div>
	    <a href="cart/orders.jsp" class="order-button">주문하기</a>
	</div>
</footer>

