<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="store.DAO.UserDAO"%>
<%@ page import="store.DTO.Users"%>

<%
    // 요청으로부터 전화번호와 point를 받아옵니다.
    String phoneNum = request.getParameter("phoneNum");
	int point = Integer.parseInt(request.getParameter("pointsToAdd"), 10);

    // UserDAO 인스턴스 생성
    UserDAO userDao = new UserDAO();
    
    // UserDTO 객체 생성 및 전화번호 설정
    Users user = new Users();
    user.setPhone(phoneNum);
    user.setPoint(point);
    
    out.println("user.setPoint(point)");
    
    // 유저 추가
    int result = userDao.join(user);
    
    if(result > 0) {
        out.println("<p>User registration successful.</p>"); // 성공 메시지
    } else {
        out.println("<p>User registration failed.</p>"); // 실패 메시지
    }
%>