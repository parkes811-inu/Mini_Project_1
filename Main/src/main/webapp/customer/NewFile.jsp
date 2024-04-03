<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>키오스크 메뉴</title>
    <link rel="stylesheet" href="static/css/style.css"> <!-- CSS 파일 참조 -->
    <script src="script.js"></script> <!-- 필요한 경우 JavaScript 파일 참조 -->
</head>

<body>

<h2>키오스크 메뉴 선택</h2>

<!-- 음식 목록 -->
<div id="foodList">
    <%-- 여기에 서버 측에서 전달받은 음식 데이터를 사용해 이미지 목록을 동적으로 생성 --%>
    <img src="pizza.png" alt="Pizza" class="food-image" onclick="showModal('Pizza', 'This is a delicious pizza.')">
    <img src="burger.png" alt="Burger" class="food-image" onclick="showModal('Burger', 'This is a tasty burger.')">
    <!-- 추가 음식 목록 -->
</div>

<!-- 모달 팝업 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2 id="foodTitle">음식 이름</h2>
        <p id="foodDescription">음식 설명</p>
    </div>
</div>

<script>
// 모달 보여주는 함수
function showModal(title, description) {
    document.getElementById('foodTitle').innerText = title;
    document.getElementById('foodDescription').innerText = description;
    document.getElementById('myModal').style.display = "block";
}

// 모달 닫기
var modal = document.getElementById('myModal');
var span = document.getElementsByClassName("close")[0];
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>
