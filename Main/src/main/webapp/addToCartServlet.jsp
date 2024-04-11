<%@page import="store.DAO.CartDAO"%>
<%@page import="store.DTO.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
</html>
<%
    // 요청 파라미터에서 상품 정보 추출
    int tableNo = Integer.parseInt(request.getParameter("tableNo")); 
    String productId = request.getParameter("productId");
	String productName = request.getParameter("productName");
    int count = Integer.parseInt(request.getParameter("count"));
    int price = Integer.parseInt(request.getParameter("price"));
    
    // Cart 객체 생성 및 값 설정
    Cart cartItem = new Cart();
    cartItem.setTableNo(tableNo);
    cartItem.setProductName(productName);
    cartItem.setAmount(count);
    cartItem.setPrice(price);

    // 장바구니 항목을 데이터베이스에 추가
    CartDAO cartDao = new CartDAO();
    int isSuccess = cartDao.addToCart(cartItem);

    // 결과에 따라 응답 설정
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    if (isSuccess > 0) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("error");
    }
%>
