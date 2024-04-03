<%@page import="com.oreilly.servlet.CookieNotFoundException"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="store.Service.UserServiceImpl"%>
<%@page import="store.Service.UserService"%>
<%@page import="store.DAO.UserDAO"%>
<%@page import="store.DTO.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		2024-04-03 : 박은서
		간단한 로그인 구현을 위해 변경 -> 전화번호가 ID, name이 비밀번호
	*/
	
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	
	Users user = new Users();
	user.setPhone(phone);
	user.setName(name);
	
	// 로그인 요청
	UserService userService = new UserServiceImpl();
	Users loginUser = userService.login(user);
	
	
	// 아이디 저장
	String rememberId = request.getParameter("rememberId");
	Cookie cookieRememberId = new Cookie("rememberId", "");
	Cookie cookieUserId = new Cookie("userId", "");
	
	// 체크박스 체크 시, 값 : on
	if( rememberId != null && rememberId.equals("on") ) {
		// 쿠키 생성
		// UTF-8 으로 인코딩하여 값을 저장해야한다.
		cookieRememberId.setValue( URLEncoder.encode( rememberId, "UTF-8" ) );
		cookieUserId.setValue( URLEncoder.encode( phone, "UTF-8" ) );
	}
	// 체크박스 미체크 시
	else {
		// 쿠키 삭제
		cookieRememberId.setMaxAge(0);
		cookieUserId.setMaxAge(0);
	}
	// 쿠키 응답에 등록
	response.addCookie(cookieRememberId);
	response.addCookie(cookieUserId);
	// -------------------------------------------------
	
	
	// 자동 로그인
	String rememberMe = request.getParameter("rememberMe");
	Cookie cookieRememberMe = new Cookie("rememberMe", "");
	Cookie cookieToken = new Cookie("token", "");
	
	// 자동 로그인 체크 여부, 토큰 쿠키에 대한 경로 설정
	cookieRememberMe.setPath("/");
	cookieToken.setPath("/");
	// 쿠키 유효기간 설정 - 초단위 --> 7일
	cookieRememberMe.setMaxAge(7*60*60*24);		 
	cookieToken.setMaxAge(7*60*60*24);
	
	// 체크 여부에 따라 쿠키 생성 또는 삭제
	if( rememberMe != null && rememberMe.equals("on") ) {
		// 자동 로그인 체크 
		// - 토큰 발행
		String tokenValue = userService.refreshToken(phone);
		// - 쿠키 생성
		cookieRememberMe.setValue( URLEncoder.encode( rememberMe, "UTF-8") );
		cookieToken.setValue( URLEncoder.encode( tokenValue, "UTF-8") );
	} else {
		// 자동 로그인 미체크
		// 쿠키 삭제
		cookieRememberMe.setMaxAge(0);
		cookieToken.setMaxAge(0);
	}
	
	// 응답에 쿠키 등록
	response.addCookie(cookieRememberMe);
	response.addCookie(cookieToken);
	// -------------------------------------------------
	
	
	if( loginUser != null ) {
		// 로그인 성공
		// 세션에 아이디 등록 후, 메뉴 페이지로 이동
		session.setAttribute("loginId", loginUser.getPhone());
		response.sendRedirect("modal.jsp");
	}
	else {
		// 로그인 실패
		response.sendRedirect("login/login.jsp?msg=0");
	}
	
	
	

%>




