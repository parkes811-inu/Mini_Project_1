<!-- 2024-04-03 : 박은서
메인 메뉴 화면 및 메뉴 클릭 시 모달 팝업 -->
<%@ page import="java.sql.*" %>
<%@ page import="store.DAO.ProductDAO" %>
<%@ page import="store.DTO.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>메뉴 추가 화면</title>
    <!-- 이정용 : style.css 파일에 모달화면 css를 홍콩반점과 같이 꾸며주세요. -->
    <link rel="stylesheet" href="static/css/style.css"> 
</head>
<body>
	<!-- 
		enctype : 폼 데이터가 서버로 전송될 때, 데이터를 인코딩하는 방법을 지정하는 속성
			* method="post" 일 때만 사용가능
		- application/x-www-form-urlencoded	: 서버로 보내기 전에 인코딩
		- multipart/form-data				: 모든 문자를 인코딩하지 않음
											  * 파일, 이미지 전송할 때 사용
		- text/plain						: 공백만 + 로 변환, 나머지는 인코딩하지 않음
	 -->
	<!-- jsp 로 파일 업로드 처리 -->
	<form action="addMenu_pro.jsp" method="post" enctype="multipart/form-data">
	<!-- Servlet 으로 파일 업로드 처리 -->
<%-- 	<form action="<%= request.getContextPath() %>/fileupload/cos" method="post" enctype="multipart/form-data"> --%>
		<p>메 뉴 이 름 : <input type="text" name="productName"> </p>
		<p> 가     격 : <input type="text" name="price"> </p>
		<p>메 뉴 설 명 : <input type="text" name="description"> </p>
		<p> 카 테 고 리 : 
			<select name="Category">
			  <option value="메인">메인</option>
			  <option value="사이드">사이드</option>
			  <option value="음료">음료</option>
			</select>
		</p>	
		<!-- name을 입력 받은 사진 이름으로 바꾸기 -->
		<p> 사   진 : <input type="file" name="image" > </p>
		<br>
		<p>
			<input type="submit" value="추가 하기" />
		</p>
	</form>

</body>
</html>
    
