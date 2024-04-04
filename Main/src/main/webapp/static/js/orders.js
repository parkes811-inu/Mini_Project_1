/**
 * 2023-04-04
 * 결제 화면 javaScript
 * 
 * 카드, 현금, 포인트 사용, 결제 취소 버튼 클릭 이벤트 정의 
 */


/*결제 취소 이벤트*/
document.getElementById('cancelButton').addEventListener('click', function() {
  window.location.href = 'basket.jsp';
});