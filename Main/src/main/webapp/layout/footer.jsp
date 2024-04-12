<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에서 tableNum 값을 가져옵니다. 세션에 값이 없을 경우를 대비하여 기본값을 설정할 수 있습니다.
// 	Integer tableNumObj1 = (Integer) request.getSession().getAttribute("tableNum");
// 	int tableNum_foot1 = 0; // 기본값 설정
	
// 	if (tableNumObj1 != null) {
// 	    tableNum_foot1 = tableNumObj1.intValue(); // intValue() 메소드를 사용하여 int로 변환
// 	}
%>
<footer class="footer">
    <nav class="footer-nav">
        <a href="info.jsp" class="footer-link">
            <img src="static/img/logo_info.png" alt="Favorites" class="footer-icon">
            <span>사용안내</span>
        </a>
        <a href="modal_menu.jsp?tableNum=${ tableNum }" class="footer-link">
            <img src="static/img/home.png" alt="Home" class="footer-icon">
            <span>홈</span>
        </a>
        <a href="basket.jsp?tableNum=${ tableNum }" class="footer-link">
            <img src="static/img/basket.png" alt="Orders" class="footer-icon">
            <span>장바구니</span>
        </a>
    </nav>
</footer>
