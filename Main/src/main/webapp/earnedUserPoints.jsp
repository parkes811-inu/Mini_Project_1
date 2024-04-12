<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="store.DAO.UserDAO"%>
<%@ page import="store.DTO.Users"%>
<!-- 2024-04-12 : 박은서, 포인트 적립 -->
<%
	// 포인트 적립
	
    String phoneNum = request.getParameter("phoneNum");
    int earnedToPoint = Integer.parseInt(request.getParameter("earnedPoint"));
    
    UserDAO userDao = new UserDAO();
    Users user = new Users(); // 기본 생성자로 객체 생성
    user.setPhone(phoneNum); // setter 메소드를 사용해 전화번호 설정
    //user.setPoint(earnedToPoint);
    user = userDao.check(user); // 사용자 정보 조회
    
    if(user != null) {
	     int updateResult = userDao.updatePoints(phoneNum, earnedToPoint); // 데이터베이스 업데이트
	     if(updateResult > 0) {
	         // 업데이트 성공
	         out.print(earnedToPoint); // 적립된 포인트 반환
	     } else {
	         // 업데이트 실패
	         out.print("포인트 업데이트에 실패했습니다.");
	     }
    }
%>