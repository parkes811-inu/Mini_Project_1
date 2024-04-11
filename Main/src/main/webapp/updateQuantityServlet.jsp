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
	int tableNum = Integer.parseInt(request.getParameter("tableNum"));
	String productName = request.getParameter("productName");
	String operation = request.getParameter("operation");
    // int quantity = Integer.parseInt(request.getParameter("quantity"));
	
    // 상품 정보를 토대로 업데이트 진행
    CartDAO cartDao = new CartDAO();
    int isSuccess = cartDao.updateCartItemQuantityAndPrice(tableNum, productName, operation);
    
    // 결과에 따라 응답 설정
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    if (isSuccess > 0) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("error");
    }
%>
