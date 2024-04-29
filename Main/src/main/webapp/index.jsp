<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		// 웹소켓 객체 생성
		//var socket = new WebSocket("ws://localhost:9090/Main");
		var socket = new WebSocket("ws://localhost:9090/Main/chatting");

		// 웹소켓 연결 시 호출 메소드
		socket.onopen = function() {
			console.log("WebSocket 연결 성공");
		} 
		
		// 메시지 수신 시 호출 메소드
		socket.onmessage = function(event) {
			console.log("메시지 수신: " + event.data);
			// 서버로부터 수신된 메시지 처리
			// 예를 들어, 수신된 메시지를 채팅 영역에 표시
			var chatArea = document.getElementById("chatArea");
			chatArea.innerHTML += "<div>" + event.data + "</div>";
			// 채팅 영역 스크롤 맨 아래로 이동
			chatArea.ScrollTop = chatArea.scrollHeight;
		};
		
		socket.onclose = function() {
			console.log("WebSocket 연결 종료");
		}
		
		// 메시지를 서버로 전송하기 위한 함수
		function sendMessage() {
			var messageInput = document.getElementById("messageInput");
			var message = messageInput.value;
			var name = document.getElementById("name").value;
			
			if (name == '') {
				alert('이름을 입력해주세요')
				return
			}
			
			// 메시지 전송 요청 함수 호출
			socket.send(name + " : " + message);
			
			// 메시지를 전송한 후 입력 필드를 지움
			messgaeInput.value = "";
			// 채팅 영역 스크롤 맨 아래 이동
			var chatArea = document.getElementById("chatArea");
			chatArea.scrollTop = chatArea.scrollHeight;
			
			// 엔터 키 누를 때, sendMessage 함수 호출
			function handleKeyPress(event) {
				if (event.KeyCode === 13) {
					sendMessage();
				}
			}
		}
	</script>
</head>
	<body>
		<div id="chatArea" style="height: 200px; overflow-y: scroll;"></div>
		<input type="text" id="name" name="name" placeholder="이름"/> <br>
		<input type="text" id="messageInput" placeholder="메시지를 입력하세요." onkeypress="handleKeyPress(event)">
		<button onclick="sendMessage()">보내기</button>
	</body>
</html>