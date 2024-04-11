<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<!-- booststrap -->
<!-- <script src="<%= request.getContextPath() %>/static/js/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- js -->
<!-- <script src="<%= request.getContextPath() %>/static/js/modal.js"></script> JavaScript 파일 참조 -->
<script src="<%= request.getContextPath() %>/static/js/script.jsp"></script>
</head>
<body>
<script>
		
		// 목록에서 상품 아이템 클릭 
		$('.product-item').on('click', function() {
			$('#myModal').show()
			
			let item = $(this)
			let productId = item.attr("id")
			let count = 1;
			// let count = item.children()[0].value
			let img = $( item.children()[1] ).clone()
			let productName = item.children()[2].textContent
			let price = item.data('price');
		    let description = item.data('description'); // data-description 속성에서 description 정보를 가져옵니다.

			console.log( productId )
			console.log( count )
			console.log( img )
			console.log( productName )
			console.log( price )
			console.log(description);
			
			$('#detail-product-id').text( productId )
			$('#detail-img-box').html( img )
			$('#product-detail-name').text( productName )
			$('#detail-count').val( count )
			$('#product-detail-price').text(price)
		    $('#product-dsecription').text( description ); // 모달에 description 정보를 추가합니다.

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
            if (count > 1) {
                count--;
                $('#detail-count').val(count);
                let price = parseFloat($('#product-detail-price').text());
                $('#product-detail-price').text(price - parseFloat(price / (count + 1)));
            } else {
                // 수량 1보다 작아지면 1로 만듦
                $('#detail-count').val(1);
            }
         });
       
        function updateTotalPrice(count) {
            let price = parseFloat($('#product-detail-price').attr('data-price')); // 상품 1개당 가격
            let totalPrice = price * count;
            $('#product-detail-price').text(totalPrice.toFixed(2));
        }

		
		// 모달 바깥 클릭 
		$('.closeBtn').on('click', function() {
			$('#myModal').hide()
		})
		
		// 모달 내에서 추가하기 버튼 클릭
		$(document).ready(function() {
	    	$('#confirm').click(function(event) {
		        event.preventDefault();
		        // tableNo는 application으로 등록.
		        let tableNo = 1;
		        let productId = $('#detail-product-id').text();
		        let productName = $('#product-detail-name').text();
		        let count = $('#detail-count').val();
		        let price = $('#product-detail-price').text();
		        let data = {
		        	tableNo: tableNo,
		            productId: productId,
		            productName: productName,
		            count: count,
		            price: price
		        };

		        $.ajax({
		            type: "POST",
		            url: "addToCartServlet.jsp", // 장바구니에 추가하는 서블릿 URL
		            data: data,
		            success: function(response) {
		                alert('추가가 완료되었습니다.');
		                //alert(tableNo);
		                
		                $('#myModal').hide();
		                window.location.reload("/layout/footer2.jsp");
		            },
		            error: function(xhr, status, error) {
		                alert('추가 중 오류가 발생했습니다.');
		                console.error(xhr.status);
		                console.error(xhr.responseText);
		            }
		        });
    		});
		});	 
	</script>
</body>
