<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="static/css/style.css"> 
</head>
<body>

<!-- 메인 헤더: 메뉴판 제목 -->
<header class="main-header">
	<h1>메뉴판</h1>
    <hr>
</header>

	<!-- 상단 네비게이션 바 -->
<header class="header-nav">
    <nav>
        <a href="modal_menu.jsp?tableNum=${ tableNum }" class="nav-item">메뉴</a>
        <a href="sides.jsp?tableNum=${ tableNum }" class="nav-item">사이드</a>
        <a href="drinks.jsp?tableNum=${ tableNum }" class="nav-item">음료 & 주류</a>
    </nav>
</header>

</body>
</html>





