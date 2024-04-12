<%@page import="java.io.PrintWriter"%>
<%@page import="store.DAO.OrderDAO"%>
<%@page import="store.DTO.Order"%>

<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    int tableNo = Integer.parseInt(request.getParameter("tableNo"));
    
    OrderDAO orderDao = new OrderDAO();
    
    int result = orderDao.statusUpdate(tableNo);
    
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    // JSON 형식의 응답 데이터 생성
    String jsonResponse = "";
    if (result > 0) {
        jsonResponse = "{\"success\": true}";
    } else {
        jsonResponse = "{\"success\": false}";
    }
    
    // 응답 보내기
    PrintWriter out1 = response.getWriter();
    out.print(jsonResponse);
    out1.flush();
%>