<%@page import="store.DAO.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	// 2024-04-13 박은서 : 
	// 주문 번호를 받아 해당 주문 삭제 
    // 요청으로부터 주문번호를 받아옵니다.
    int orderNo = Integer.parseInt(request.getParameter("orderNo"));
    
    // 유저 추가
    OrderDAO orderDao = new OrderDAO();
    
    int result = orderDao.delete(orderNo);
    
    if(result > 0) {
        out.println("<p>User registration successful.</p>"); // 성공 메시지
    } else {
        out.println("<p>User registration failed.</p>"); // 실패 메시지
    }
%>