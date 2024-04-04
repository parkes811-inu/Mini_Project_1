/**
 * 2023-04-04
 * 결제 화면 javaScript
 * 
 * 카드, 현금, 포인트 사용, 결제 취소 버튼 클릭 이벤트 정의 
 */

/* 카드 버튼 이벤트 */

document.getElementById('cardButton').addEventListener('click', function() {
  
  // 카드 결제 관련 로직 구현
  // total_price를 어떻게 불러올지 ?
  var total_price = 1000;
  alert( total_price + '원을 카드로 결제하였습니다.');
  
  // db에 추가하는 로직 구현.
  
  
});

/* 현금 버튼 이벤트 */
document.getElementById('cashButton').addEventListener('click', function() {
  // 현금 결제 관련 로직 구현
  // total_price를 어떻게 불러올지 ?
  var total_price = 1000;
  alert( total_price + '원을 현금으로 결제하였습니다.');
  
  // db에 추가하는 로직 구현.
});

/* 포인트 버튼 이벤트 */
document.getElementById('pointButton').addEventListener('click', function() {
	
  	var phoneNumValue = document.getElementById('phoneNum').value; // input 박스의 값을 얻습니다.
  	
  	// 값이 비어 있는지 확인합니다.
  	if(phoneNumValue.length != 11) { 
	 	alert('포인트를 사용할 핸드폰 번호를 정확히 입력해주세요.');
  	}
  	else {
        // AJAX 요청으로 서버에 휴대폰 번호를 전송하고 사용자 포인트 조회
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkUserPoints.jsp", true); // 서버의 URL로 POST 요청을 전송합니다.
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("phoneNum=" + phoneNumValue);
        xhr.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // 서버 응답 처리
                var availablePoints = parseInt(this.responseText, 10); // 가정: 서버가 포인트를 문자열로 반환한다고 가정
                
                if (availablePoints === -1) { // 번호가 데이터베이스에 없는 경우
                	// totalAmount는 데이터 베이스에서 전화번호로 조회해서 끌고 와야함.
                	// 2024-04-05 박은서 해야됨.
                    var totalAmount = 100000;
                    var pointsToAdd = totalAmount * 0.1;

                    var xhrAdd = new XMLHttpRequest();
                    xhrAdd.open("POST", "addUserPoints.jsp", true);
                    xhrAdd.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhrAdd.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            alert('새로운 번호로 포인트가 추가되었습니다.');
                        }
                    };
                	xhrAdd.send("phoneNum=" + phoneNumValue + "&pointsToAdd=" + pointsToAdd);
                }
                // 번호가 이미 존재 하는 경우
                else {
					// 사용할 포인트 입력받음
	                var pointsToUse = parseInt(prompt('사용할 포인트를 입력해주세요. 현재 포인트: ' + availablePoints), 10);
	                // 입력한 포인트가 현재 가지고 있는 것보다 크면 오류 메시지 표시
	                if (pointsToUse > availablePoints || pointsToUse < 0) {
	                    alert('사용할 수 있는 포인트보다 많거나 적습니다.');
	                } 
	       
	                else {
	                    // 포인트를 차감하고 서버에 업데이트 요청
	                    var xhrUpdate = new XMLHttpRequest();
	                    xhrUpdate.open("POST", "updateUserPoints.jsp", true);
	                    xhrUpdate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	                    xhrUpdate.onreadystatechange = function() {
	                        if (this.readyState == 4 && this.status == 200) {
	                            alert('포인트가 성공적으로 차감되었습니다.');
	                            // 이곳에서 추가 로직을 수행할 수 있습니다.
	                        }
	                    };
	                    xhrUpdate.send("phoneNum=" + phoneNumValue + "&pointsToUse=" + toString(pointsToUse));
	                }
				}
            }
        };
        
    }
});

/* 결제 취소 이벤트 */
document.getElementById('cancelButton').addEventListener('click', function() {
  window.location.href = 'basket.jsp'; // 결제 취소 시 홈으로 이동
});



