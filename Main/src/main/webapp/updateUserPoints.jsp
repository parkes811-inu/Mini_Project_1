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
    String phoneNum = request.getParameter("phoneNum");
    int pointsToUse = Integer.parseInt(request.getParameter("pointsToUse"));
    
    UserDAO userDao = new UserDAO();
    Users user = new Users(); // 기본 생성자로 객체 생성
    user.setPhone(phoneNum); // setter 메소드를 사용해 전화번호 설정
    user = userDao.check(user); // 사용자 정보 조회
    
    if(user != null) {
        int currentPoints = user.getPoint(); // 현재 포인트
        if(currentPoints >= pointsToUse) { // 포인트가 충분한 경우
            int newPoints = currentPoints - pointsToUse; // 새 포인트 계산
            int updateResult = userDao.updatePoints(phoneNum, newPoints); // 데이터베이스 업데이트
            
            if(updateResult > 0) {
                // 업데이트 성공
                out.print(newPoints); // 새로운 포인트 반환
            } else {
                // 업데이트 실패
                out.print("포인트 업데이트에 실패했습니다.");
            }
        } else {
            // 포인트 부족
            out.print("포인트가 부족합니다.");
        }
    } else {
        // 사용자 정보 없음
        out.print("-1"); // 사용자를 찾을 수 없습니다.
    }
%>