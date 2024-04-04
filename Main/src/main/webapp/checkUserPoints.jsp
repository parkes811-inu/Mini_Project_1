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
    // 요청으로부터 전화번호를 받아옵니다.
    String phoneNum = request.getParameter("phoneNum");
    
    // UserDAO 인스턴스 생성
    UserDAO userDao = new UserDAO();
    
    // UserDTO 객체 생성 및 전화번호 설정
    Users user = new Users();
    user.setPhone(phoneNum);
    user.getPoint();
    
    // 포인트 조회
    user = userDao.login(user); // UserDAO에 이 메소드가 정의되어 있음
    
    // 조회 결과가 null이 아닌 경우 사용자 포인트 반환, null인 경우 -1 반환
    String points = (user != null) ? user.getPoint() : "-1";
    
    // 포인트(또는 -1) 출력
    out.print(points);
%>
 { conn.close(); } catch(SQLException ex) {}
	}
%>
