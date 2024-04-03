/**
 * 2024-04-03 : 박은서
 * 메뉴 이미지 클릭 시 모달 팝업 띄우기
 */

// 모달 요소를 선택
var modal = document.getElementById("myModal");

// 모달을 여는 버튼을 선택
var btn = document.getElementById("openModalBtn");

// 모달 내 닫기 버튼을 선택
var span = document.getElementsByClassName("closeBtn")[0];

// 사용자가 모달 열기 버튼을 클릭하면 모달을 표시
btn.onclick = function() {
    modal.style.display = "block";
}

// 닫기(X) 버튼을 클릭하면 모달을 숨김
span.onclick = function() {
    modal.style.display = "none";
}

// 모달 바깥 영역을 클릭하면 모달을 숨김
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// 모달 팝업 내 추가하기 버튼을 누를 때
document.getElementById('submit').onclick = function(event) {
    event.preventDefault(); // 폼의 기본 제출 동작을 방지
	
    //var dataInput = document.getElementById('dataInput').value;

    //var xhr = new XMLHttpRequest();
    //xhr.open("POST", "AddDataServlet", true);
    //xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //xhr.onreadystatechange = function() {
        //if (this.readyState == 4 && this.status == 200) {
            // 요청이 성공적으로 완료되었을 때의 동작
           // console.log(this.responseText);
            // 모달 닫기, 성공 메시지 표시 등
        //}
    //};
   // xhr.send("data=" + encodeURIComponent(dataInput));
   alert('추가가 완료되었습니다.');
};


