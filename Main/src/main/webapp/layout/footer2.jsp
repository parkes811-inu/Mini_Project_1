<%@page import="store.DTO.Cart"%>
<%@page import="store.DAO.CartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="static/css/chat.css">
   
</head>
<body>

<%
    // 세션에서 tableNum 값을 가져옵니다.
    Integer tableNum6 = (Integer)session.getAttribute("tableNum");
    if (tableNum6 == null) {
        // 에러 처리 또는 기본값 할당
        tableNum6 = 1; // 예시 기본값
    }
    
   // tableNo는 application범위로 지정해야됨.
   int tableNo = tableNum6; 
   CartDAO cartDao = new CartDAO();
   Cart cart = new Cart();
   cart = cartDao.check(tableNo);
   int amount = 0;
   int price = 0;
   
   amount = amount + cart.getAmount();
   price = price + cart.getPrice();
%>

<footer class="footer2">
   <!-- 주문 요약 -->
   <div class="order-summary">
   
      <button id="chatButton" class="chat-button">채팅</button>
      
      <div id="chatWindow" class="chat-window" style="display: none;">
         <div class="chat-header">
              <span>채팅 창</span>
          </div>
          <!-- 채팅 내용이 여기 들어갑니다 -->
          <div id="chat-content" class="chat-content">
              <!-- 메세지들 -->
          </div>
          <!-- 메세지 입력 -->
          <div class="chat-input">
              <input type="text" id="messageInput" placeholder="메세지 입력" onkeypress="handleKeyPress(event)">
              <button onclick="sendMessage()">전송</button>
              <button onclick="toggleChatWindow()">닫기</button>
          </div>
         
      </div>
      
    <script>
	function toggleChatWindow() {
	    var chatWindow = document.getElementById("chatWindow");
	    if (chatWindow.style.display === "none") {
	        chatWindow.style.display = "block";
	    } else {
	        chatWindow.style.display = "none";
	    }
	}
	
	document.getElementById("chatButton").onclick = toggleChatWindow;
	
	var socket = new WebSocket("ws://localhost:9090/Main/chatting");
	
	socket.onopen = function() {
	    console.log("WebSocket 연결 성공");
	}
	
	socket.onmessage = function(event) {
	    console.log("메시지 수신: " + event.data);
	    var chatArea = document.getElementById("chat-content");
	    chatArea.innerHTML += "<div>" + event.data + "</div>";
	    chatArea.scrollTop = chatArea.scrollHeight;
	};
	
	socket.onclose = function() {
	    console.log("WebSocket 연결 종료");
	}
	
	// 페이지 로딩 시 로컬 스토리지에서 채팅 기록 불러오기
	document.addEventListener("DOMContentLoaded", function() {
	    var chatArea = document.getElementById("chat-content");
	    var chatHistory = localStorage.getItem("chatHistory");
	    if (chatHistory) {
	        chatArea.innerHTML = chatHistory;
	    }
	});

	// 페이지 종료 시 로컬 스토리지에서 채팅 기록 삭제
	window.addEventListener("unload", function() {
	    localStorage.removeItem("chatHistory");
	});

	function sendMessage() {
	    var messageInput = document.getElementById("messageInput");
	    var message = messageInput.value;
	    var tableNum = "<c:out value='${tableNum}'/>"; // JSP Expression to get server-side variable
	    
	    if (message == '') {
	        alert('요청 사항을 입력해주세요.');
	        return;
	    }
	    
	    var fullMessage = tableNum + "번 테이블 : " + message;
	    socket.send(fullMessage);
	    messageInput.value = "";
	    
	    var chatArea = document.getElementById("chat-content");
	    chatArea.innerHTML += "<div>" + fullMessage + "</div>"; // 메시지를 채팅 영역에 추가
	    chatArea.scrollTop = chatArea.scrollHeight;
	    
	    // 로컬 스토리지에 채팅 기록 저장
	    var currentChat = localStorage.getItem("chatHistory");
	    currentChat = currentChat ? currentChat + "<div>" + fullMessage + "</div>" : "<div>" + fullMessage + "</div>";
	    localStorage.setItem("chatHistory", currentChat);
	}

	function handleKeyPress(event) {
	    if (event.keyCode === 13) {
	        sendMessage();
	    }
	}
	</script>

      
       <div class="order-info">
           <p>수량: <span class="order-quantity">    <%= amount %>    </span>     개</p>
           <br>
           <p>금액: <span class="order-amount">      <%= price %>     </span>     원</p>
       </div>
       <a href="orders.jsp?tableNum=${ tableNum }" class="order-button">주문하기</a>
   </div>
</footer>

</body>
</html>