<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- booststrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!--  <script src="<%= request.getContextPath() %>/static/js/bootstrap.bundle.min.js" ></script>-->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="static/js/modal.js"></script> <!-- JavaScript 파일 참조 -->

<!-- js -->
<script src="<%= request.getContextPath() %>/static/js/modal.js"></script> <!-- JavaScript 파일 참조 --> 
<script src="<%= request.getContextPath() %>/static/js/script.jsp"></script>

<script>
		
		// 목록에서 상품 아이템 클릭 
		$('.product-item').on('click', function() {
			$('#myModal').show()
			
			let item = $(this)
			let count = item.children()[0].value
			let img = $( item.children()[1] ).clone()
			let productName = item.children()[2].textContent
			let price = item.children('h3').text()
			console.log( count )
			console.log( img )
			console.log( productName )
			console.log( price )
			
			$('#detail-img-box').html( img )
			$('#product-detail-name').text( productName )
			$('#detail-count').val( count )
			$('#product-detail-price').text(price)
			
		})
		
		// 모달 내 취소하기 버튼 클릭
		$('#cancel').on('click', function() {
			$('#myModal').hide()
		})
		
		// 모달 내 수량(+, -) 버튼 클릭
		$('#detail-plus').on('click', function() {
        let count = parseInt($('#detail-count').val());
        count++;
        $('#detail-count').val(count);
        let price = parseFloat($('#product-detail-price').text());
        $('#product-detail-price').text(price + parseFloat(price / (count - 1)));
       });
   
       $('#detail-minus').on('click', function() {
           let count = parseInt($('#detail-count').val());
           if (count > 0) {
               count--;
               $('#detail-count').val(count);
               let price = parseFloat($('#product-detail-price').text());
               $('#product-detail-price').text(price - parseFloat(price / (count + 1)));
           }
       });

		
		// 모달 바깥 클릭 
		$('.closeBtn').on('click', function() {
			$('#myModal').hide()
		})
		
		document.getElementById('confirm').onclick = function(event) {
		    event.preventDefault(); // 폼의 기본 제출 동작을 방지
		    let productName = $('#product-detail-name').text();
		    let count = $('#detail-count').val();
		    let price = $('#product-detail-price').text();
		    let data = {
		        productName: productName,
		        count: count,
		        price: price
		    };
	
	    $.ajax({
	        type: "POST",
	        url: "addToCartServlet", // 장바구니에 추가하는 서블릿 URL
	        data: data,
	        success: function(response) {
	            alert('추가가 완료되었습니다.');
	        },
	        error: function(xhr, status, error) {
	            alert('추가 중 오류가 발생했습니다.');
	            console.error(xhr.responseText);
        }
    });
};
					
	</script>