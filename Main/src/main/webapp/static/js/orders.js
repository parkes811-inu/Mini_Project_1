/**
 * 2023-04-04
 * 결제 화면 javaScript
 * 
 * 카드, 현금, 포인트 사용, 결제 취소 버튼 클릭 이벤트 정의 
 */

/* 카드 버튼 이벤트 */

document.getElementById('cardButton').addEventListener('click', function() {
    var phoneNumValue = document.getElementById('phoneNum').value; // input 박스의 값을 얻습니다.
  	// 장바구니 총합 구하기
  	var totalAmount = document.getElementById('data-totalPrice').innerText;
	// 숫자만 추출하기
	totalAmount = totalAmount.replace(/[^0-9]/g, '');
	totalAmount = parseInt(totalAmount, 10); // 정수로 변환
	
	// 테이블 번호 구하기 
	var tableNo = document.getElementById('data-tableNo').innerText;
	// 숫자만 추출하기
	tableNo = tableNo.replace(/[^0-9]/g, '');
	tableNo = parseInt(tableNo, 10); // 정수로 변환
	
   var pointsToAdd = totalAmount * 0.1; // 적립 포인트 
   var payment = "card"; // 결제 방식
   
   var customerStatus = "신규";// 고객 관리를 위한 변수
   
  	// 값이 비어 있는지 확인합니다.
  	if(phoneNumValue.length != 11) { 
	 	alert('포인트를 적립할 핸드폰 번호를 정확히 입력해주세요.');
  	}
  	else {
        // AJAX 요청으로 서버에 휴대폰 번호를 전송하고 사용자 포인트 조회
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkUserPoints.jsp", true); // 서버의 URL로 POST 요청을 전송합니다.
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            // 서버 응답 처리
            if (this.readyState == 4 && this.status == 200) {
				var availablePoints = parseInt(this.responseText, 10);
                
                if (availablePoints === -1) { // 번호가 데이터베이스에 없는 경우
                    var xhrAdd = new XMLHttpRequest();
                    xhrAdd.open("POST", "addUserPoints.jsp", true);
                    xhrAdd.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhrAdd.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
							
                            // 결제 완료 후 장바구니 (cart) 에 있던 목록들 order_log로 이동 후 cart 테이블에 해당 정보들 삭제.
                            var xhrInsert = new XMLHttpRequest();
							xhrInsert.open("POST", "completePayment.jsp", true);
							xhrInsert.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                			xhrInsert.onreadystatechange = function() {
											
							};
							 // -> 포인트 추가가 완료되었습니다. 얼럿 후 메인 페이지 이동
							console.log(this.responseInt);
                            alert('새로운 번호로 포인트가 추가되었습니다.');
                          	window.location.href = 'modal_menu.jsp?tableNum' + tableNo;
                          	// completePayment.jsp에 전송되는 데이터.
							xhrInsert.send("phoneNum=" + phoneNumValue + "&tableNo=" + tableNo + "&point=" + 0 + "&payment=" + payment + "&classification=" + customerStatus);
                        }
                    };
                    // checkUserPoints.jsp에 전송되는 데이터
					xhrAdd.send("phoneNum=" + phoneNumValue + "&pointsToAdd=" + pointsToAdd);
                }
        
            // 번호가 이미 존재 하는 경우
            else {
				// 기존 포인트 + 적립할 포인트 
                var earnedPoints = pointsToAdd + availablePoints;
	                
                // 애는 포인트를 쌓아야 함.
                var xhrEarned = new XMLHttpRequest();
                xhrEarned.open("POST", "earnedUserPoints.jsp", true);
                xhrEarned.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                customerStatus = "기존";
                xhrEarned.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // 포인트가 차감된 거 만큼 결제를 진행 
                    // 결제 완료 후 장바구니 (cart) 에 있던 목록들 order_log로 이동 후 cart 테이블에 해당 정보들 삭제.
                    
                    
					var xhrInsert = new XMLHttpRequest();
					xhrInsert.open("POST", "completePayment.jsp", true);
					xhrInsert.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        			xhrInsert.onreadystatechange = function() {
							
					};
					
                    // -> 주문이 완료되었습니다. 얼럿 후 메인 페이지 이동
                  	window.location.href = 'modal_menu.jsp?tableNum' + tableNo;
					xhrInsert.send("phoneNum=" + phoneNumValue + "&tableNo=" + tableNo + "&point=" + 0 + "&payment=" + payment + "&classification=" + customerStatus);
                	}
                };
                xhrEarned.send("phoneNum=" + phoneNumValue + "&earnedPoint=" + earnedPoints);
	            }
            }
        };
    	xhr.send("phoneNum=" + encodeURIComponent(phoneNumValue));
    }
  
});

	  	

/* 현금 버튼 이벤트 */
document.getElementById('cashButton').addEventListener('click', function() {
  	var phoneNumValue = document.getElementById('phoneNum').value; // input 박스의 값을 얻습니다.
  	// 장바구니 총합 구하기
  	var totalAmount = document.getElementById('data-totalPrice').innerText;
	// 숫자만 추출하기
	totalAmount = totalAmount.replace(/[^0-9]/g, '');
	totalAmount = parseInt(totalAmount, 10); // 정수로 변환
	
	// 테이블 번호 구하기 
	var tableNo = document.getElementById('data-tableNo').innerText;
	// 숫자만 추출하기
	tableNo = tableNo.replace(/[^0-9]/g, '');
	tableNo = parseInt(tableNo, 10); // 정수로 변환
	
   var pointsToAdd = totalAmount * 0.1; // 적립 포인트 
   var payment = "cash"; // 결제 방식
   
   var customerStatus = "신규";// 고객 관리를 위한 변수
   
  	// 값이 비어 있는지 확인합니다.
  	if(phoneNumValue.length != 11) { 
	 	alert('포인트를 적립할 핸드폰 번호를 정확히 입력해주세요.');
  	}
  	else {
        // AJAX 요청으로 서버에 휴대폰 번호를 전송하고 사용자 포인트 조회
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkUserPoints.jsp", true); // 서버의 URL로 POST 요청을 전송합니다.
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            // 서버 응답 처리
            if (this.readyState == 4 && this.status == 200) {
				var availablePoints = parseInt(this.responseText, 10);
                
                if (availablePoints === -1) { // 번호가 데이터베이스에 없는 경우
                    var xhrAdd = new XMLHttpRequest();
                    xhrAdd.open("POST", "addUserPoints.jsp", true);
                    xhrAdd.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhrAdd.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
							
                            // 결제 완료 후 장바구니 (cart) 에 있던 목록들 order_log로 이동 후 cart 테이블에 해당 정보들 삭제.
                            var xhrInsert = new XMLHttpRequest();
							xhrInsert.open("POST", "completePayment.jsp", true);
							xhrInsert.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                			xhrInsert.onreadystatechange = function() {
											
							};
							 // -> 포인트 추가가 완료되었습니다. 얼럿 후 메인 페이지 이동
							console.log(this.responseInt);
                            alert('새로운 번호로 포인트가 추가되었습니다.');
                          	window.location.href = 'modal_menu.jsp?tableNum' + tableNo;
                          	// completePayment.jsp에 전송되는 데이터.
							xhrInsert.send("phoneNum=" + phoneNumValue + "&tableNo=" + tableNo + "&point=" + 0 + "&payment=" + payment + "&classification=" + customerStatus);
                        }
                    };
                    // checkUserPoints.jsp에 전송되는 데이터
					xhrAdd.send("phoneNum=" + phoneNumValue + "&pointsToAdd=" + pointsToAdd);
                }
            
            // 번호가 이미 존재 하는 경우
            else {
				// 기존 포인트 + 적립할 포인트 
                var earnedPoints = pointsToAdd + availablePoints;
	                
                // 애는 포인트를 쌓아야 함.
                var xhrEarned = new XMLHttpRequest();
                xhrEarned.open("POST", "earnedUserPoints.jsp", true);
                xhrEarned.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                customerStatus = "기존";
                xhrEarned.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // 포인트가 차감된 거 만큼 결제를 진행 
                    // 결제 완료 후 장바구니 (cart) 에 있던 목록들 order_log로 이동 후 cart 테이블에 해당 정보들 삭제.
					var xhrInsert = new XMLHttpRequest();
					xhrInsert.open("POST", "completePayment.jsp", true);
					xhrInsert.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        			xhrInsert.onreadystatechange = function() {
							
					};
					
                    // -> 주문이 완료되었습니다. 얼럿 후 메인 페이지 이동
                  	window.location.href = 'modal_menu.jsp?tableNum' + tableNo;
					xhrInsert.send("phoneNum=" + phoneNumValue + "&tableNo=" + tableNo + "&point=" + 0 + "&payment=" + payment + "&classification=" + customerStatus);
                	}
                };
                xhrEarned.send("phoneNum=" + phoneNumValue + "&earnedPoint=" + earnedPoints);
	            }
            }
        };
    	xhr.send("phoneNum=" + encodeURIComponent(phoneNumValue));
    }
  
});

/* 포인트 버튼 이벤트 */
document.getElementById('pointButton').addEventListener('click', function() {
	
  	var phoneNumValue = document.getElementById('phoneNum').value; // input 박스의 값을 얻습니다.
  	// 장바구니 총합 구하기
  	var totalAmount = document.getElementById('data-totalPrice').innerText;
	// 숫자만 추출하기
	totalAmount = totalAmount.replace(/[^0-9]/g, '');
	totalAmount = parseInt(totalAmount, 10); // 정수로 변환
	
	// 테이블 번호 구하기 
	var tableNo = document.getElementById('data-tableNo').innerText;
	// 숫자만 추출하기
	tableNo = tableNo.replace(/[^0-9]/g, '');
	tableNo = parseInt(tableNo, 10); // 정수로 변환
	
   var pointsToAdd = totalAmount * 0.1; // 적립 포인트 
   var payment = "card"; // 결제 방식
   
   var customerStatus = "신규";// 고객 관리를 위한 변수
   
  	// 값이 비어 있는지 확인합니다.
  	if(phoneNumValue.length != 11) { 
	 	alert('포인트를 사용할 핸드폰 번호를 정확히 입력해주세요.');
  	}
  	else {
        // AJAX 요청으로 서버에 휴대폰 번호를 전송하고 사용자 포인트 조회
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkUserPoints.jsp", true); // 서버의 URL로 POST 요청을 전송합니다.
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            // 서버 응답 처리
            if (this.readyState == 4 && this.status == 200) {
				var availablePoints = parseInt(this.responseText, 10);
                
                if (availablePoints === -1) { // 번호가 데이터베이스에 없는 경우
                    var xhrAdd = new XMLHttpRequest();
                    xhrAdd.open("POST", "addUserPoints.jsp", true);
                    xhrAdd.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhrAdd.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
							
                            // 결제 완료 후 장바구니 (cart) 에 있던 목록들 order_log로 이동 후 cart 테이블에 해당 정보들 삭제.
                            var xhrInsert = new XMLHttpRequest();
							xhrInsert.open("POST", "completePayment.jsp", true);
							xhrInsert.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                			xhrInsert.onreadystatechange = function() {
											
							};
							 // -> 포인트 추가가 완료되었습니다. 얼럿 후 메인 페이지 이동
							console.log(this.responseInt);
                            alert('새로운 번호로 포인트가 추가되었습니다.');
                          	window.location.href = 'modal_menu.jsp?tableNum' + tableNo;
                          	// completePayment.jsp에 전송되는 데이터.
							xhrInsert.send("phoneNum=" + phoneNumValue + "&tableNo=" + tableNo + "&point=" + 0 + "&payment=" + payment + "&classification=" + customerStatus);
                        }
                    };
                    // checkUserPoints.jsp에 전송되는 데이터
					xhrAdd.send("phoneNum=" + phoneNumValue + "&pointsToAdd=" + pointsToAdd);
                }
                // 번호가 이미 존재 하는 경우
                else {
					// 사용할 포인트 입력받음
	                var pointsToUse = prompt('사용할 포인트를 입력해주세요. 현재 포인트: ' + availablePoints);
	                // 공백 제거
	                pointsToUse = pointsToUse.trim();
	                
	                // 입력한 포인트가 현재 가지고 있는 것보다 크면 오류 메시지 표시
	                if (pointsToUse > availablePoints || pointsToUse < 0 || pointsToUse === "") {
	                    alert('올바른 포인트를 적어주세요.');
	                } 
	                else {
	                    // 포인트를 차감하고 서버에 업데이트 요청
	                    var xhrUpdate = new XMLHttpRequest();
	                    xhrUpdate.open("POST", "updateUserPoints.jsp", true);
	                    xhrUpdate.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	                    customerStatus = "기존";
	                    xhrUpdate.onreadystatechange = function() {
	                        if (this.readyState == 4 && this.status == 200) {
	                            // 포인트가 차감된 거 만큼 결제를 진행 
	                             alert('포인트가 성공적으로 차감되었습니다.');
	                            // alert(parseInt(this.responseText, 10));
	                            // 결제 완료 후 장바구니 (cart) 에 있던 목록들 order_log로 이동 후 cart 테이블에 해당 정보들 삭제.
	                            if(parseInt(this.responseText) > 0) {
									var xhrInsert = new XMLHttpRequest();
									xhrInsert.open("POST", "completePayment.jsp", true);
									xhrInsert.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	                    			xhrInsert.onreadystatechange = function() {
											
									};
									xhrInsert.send("phoneNum=" + phoneNumValue + "&tableNo=" + tableNo + "&point=" + pointsToUse + "&payment=" + payment + "&classification=" + customerStatus);
								}
								
	                            // -> 주문이 완료되었습니다. 얼럿 후 메인 페이지 이동
                              	window.location.href = 'modal_menu.jsp?tableNum' + tableNo;
	                        }
	                    };
	                    xhrUpdate.send("phoneNum=" + phoneNumValue + "&pointsToUse=" + pointsToUse);
	                }
				}
            }
        };
    	xhr.send("phoneNum=" + encodeURIComponent(phoneNumValue));
    }
});

/* 결제 취소 이벤트 */
document.getElementById('cancelButton').addEventListener('click', function() {
  var tableNum = document.getElementById('data-tableNo').textContent;
  // " 번 테이블 주문서" 문자열을 제거하고 숫자 부분만 추출
  tableNum = tableNum.replace(/[^0-9]/g, '');
  /* 결제 취소 시 장바구니 화면으로 이동 */
  window.location.href = 'basket.jsp?tableNum=' + tableNum;
});



