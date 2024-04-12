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
    // 요청 파라미터에서 장바구니 정보 받아오기
    String phoneNum = request.getParameter("phoneNum");
    int tableNo = Integer.parseInt(request.getParameter("tableNo"));
    int point = Integer.parseInt(request.getParameter("point")); // 사용한 포인트 만큼.
    String payment = request.getParameter("payment");
	String customerStatus = request.getParameter("classification");
    // 장바구니 항목을 데이터베이스에 추가
    CartDAO cartDao = new CartDAO();
    
	boolean storeSuccess = cartDao.complete(tableNo, point, payment, phoneNum, customerStatus);
    
    // 결과에 따라 응답 설정
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    if (storeSuccess == true) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("error");
    }
%>
