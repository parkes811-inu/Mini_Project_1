/**
 * 2024-04-03 : 박은서
 * 메뉴 이미지 클릭 시 모달 팝업 띄우기
 */

// 모달 요소와 모달을 여는 버튼, 그리고 닫기 버튼을 선택
var modals = document.querySelectorAll(".modal");
var modalButtons = document.querySelectorAll(".openModalBtn");
var closeButtons = document.querySelectorAll(".closeBtn");
var submitButtons = document.querySelectorAll(".submit");


// 모달 열기 버튼에 이벤트 리스너 추가
modalButtons.forEach(function(btn, index) {
    btn.addEventListener('click', function() {
        var target = this.dataset.target; // 'data-target' 속성을 읽습니다.
        var modalToOpen = document.getElementById(target);
        if (modalToOpen) {
            modalToOpen.style.display = "block";
        } else {
            console.error("Modal with id '" + target + "' not found.");
        }
    });
});

// 닫기(X) 버튼에 이벤트 리스너 추가
closeButtons.forEach(function(btn) {
    btn.onclick = function() {
        var modalToClose = this.closest(".modal");
        modalToClose.style.display = "none";
    };
});

// 모달 바깥 영역 클릭 시 모달 숨기기
window.onclick = function(event) {
    modals.forEach(function(modal) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
};

// 모달 팝업 내 추가하기 버튼 클릭 시
submitButtons.forEach(function(submitBtn) {
    submitBtn.onclick = function(event) {
        event.preventDefault();
        alert('추가가 완료되었습니다.');
        //this.closest(".modal").style.display = "none";
        
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
    };
});




