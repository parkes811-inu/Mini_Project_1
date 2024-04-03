<!-- 2024-04-03 : 박은서
메인 메뉴 화면 및 메뉴 클릭 시 모달 팝업 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/footer.jsp" %>
<%@ include file="layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>주문 화면</title>
    <!-- 이정용 : style.css 파일에 모달화면 css를 홍콩반점과 같이 꾸며주세요. -->
    <link rel="stylesheet" href="static/css/style.css"> 
    
</head>
<body>

<!-- 모달을 여는 버튼 -->
<button id="openModalBtn">
	<!-- 데이터베이스에서 사진 URL을 불러와 표현해야 함. -->
	<!-- 나중에 해야할 것 -->
	<!-- 음식 사진을 아무거나 넣고 진행해주세요. -->
	<img src="pizza.png" alt="food_img1">
	
	
</button>

<!-- 모달 구조 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="closeBtn">&times;</span>
        <!-- 반예진 : 버튼을 눌렀을 때, 홍콩반점 화면을 참고해서 작성 -->
        <p>이곳에 모달 내용이 표시됩니다!</p>
        <hr>
        <p>안녕하세요.</p>
        
        <br> <br> <br> <br>
        
        <button type="submit" id="submit">추가하기</button>
    </div>
</div>

<script src="static/js/modal.js"></script> <!-- JavaScript 파일 참조 -->

</body>
</html>
    
