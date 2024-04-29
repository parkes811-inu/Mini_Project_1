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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 추가 화면</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <!-- 
            enctype: 폼 데이터가 서버로 전송될 때, 데이터를 인코딩하는 방법을 지정하는 속성
                * method="post" 일 때만 사용가능
            - application/x-www-form-urlencoded: 서버로 보내기 전에 인코딩
            - multipart/form-data: 모든 문자를 인코딩하지 않음
                                    * 파일, 이미지 전송할 때 사용
            - text/plain: 공백만 + 로 변환, 나머지는 인코딩하지 않음
        -->
        <!-- jsp 로 파일 업로드 처리 -->
        <form action="addMenu_pro.jsp" method="post" enctype="multipart/form-data">
            <!-- Servlet 으로 파일 업로드 처리 -->
            <%-- <form action="<%= request.getContextPath() %>/fileupload/cos" method="post" enctype="multipart/form-data"> --%>
            <div class="form-group">
                <label for="productName">메 뉴 이 름 :</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
            </div>
            <div class="form-group">
                <label for="price">가     격 :</label>
                <input type="text" class="form-control" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="description">메 뉴 설 명 :</label>
                <input type="text" class="form-control" id="description" name="description" required>
            </div>
            <div class="form-group">
                <label for="Category">카 테 고 리 :</label>
                <select class="form-control" id="Category" name="Category" required>
                    <option value="메인">메인</option>
                    <option value="사이드">사이드</option>
                    <option value="음료">음료</option>
                </select>
            </div>
            <!-- name을 입력 받은 사진 이름으로 바꾸기 -->
            <div class="form-group">
                <label for="image">사   진 :</label>
                <input type="file" class="form-control-file" id="image" name="image" required>
            </div>
            <br>
            <button type="submit" class="btn btn-primary">추가 하기</button>
            <a href="owner_panel.jsp" class="btn btn-secondary">취소</a>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

    
