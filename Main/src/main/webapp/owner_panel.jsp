<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="store.DAO.OrderDAO"%>
<%@page import="store.DTO.Order"%>
<%@page import="store.Service.OrderServiceImpl"%>
<%@page import="store.Service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
if (session != null && session.getAttribute("loginId") != null) {
%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
<script src="static/js/color-modes.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>panel_test</title>
<link href="https://cdn.jsdelivr.net/npm/@docsearch/css@3"
	rel="stylesheet">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/sign-in.css" rel="stylesheet">
<link href="static/css/headers.css" rel="stylesheet">
<link href="static/css/grid.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important;
}

.outer-card {
	background-color: black;
	color: white;
	border-radius: 20px;
}

.inner-card {
	background-color: white;
	border-radius: 10px;
}

.inner-card .card-body {
	padding: 20px;
}

/* 내용을 화면에 꽉 차게 만듭니다. */
html, body, .container, .row, .col-md-4 {
	height: 80%;
}

/* 네비게이션 바 스타일링 */
.navbar {
	margin-bottom: 20px; /* 네비게이션 바 아래 여백 추가 */
}

/* 카드 푸터 스타일링 */
.card-footer-custom {
	background-color: transparent;
	border: none;
	display: flex;
	align-items: center;
}

.btn-custom {
	margin-left: auto;
}
</style>
</head>
<body>
	<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path
			d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path
			d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
			d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
        <path
			d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
			d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
      </symbol>
    </svg>

	<div
		class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
		<button
			class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
			id="bd-theme" type="button" aria-expanded="false"
			data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
			<svg class="bi my-1 theme-icon-active" width="1em" height="1em">
				<use href="#circle-half"></use></svg>
			<span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
		</button>
		<ul class="dropdown-menu dropdown-menu-end shadow"
			aria-labelledby="bd-theme-text">
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="light" aria-pressed="false">
					<svg class="bi me-2 opacity-50" width="1em" height="1em">
						<use href="#sun-fill"></use></svg>
					Light
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="dark" aria-pressed="false">
					<svg class="bi me-2 opacity-50" width="1em" height="1em">
						<use href="#moon-stars-fill"></use></svg>
					Dark
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center active"
					data-bs-theme-value="auto" aria-pressed="true">
					<svg class="bi me-2 opacity-50" width="1em" height="1em">
						<use href="#circle-half"></use></svg>
					Auto
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
		</ul>
	</div>


	<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd"
			d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
  <symbol id="home" viewBox="0 0 16 16">
    <path
			d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
  </symbol>
  <symbol id="speedometer2" viewBox="0 0 16 16">
    <path
			d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z" />
    <path fill-rule="evenodd"
			d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z" />
  </symbol>
  <symbol id="table" viewBox="0 0 16 16">
    <path
			d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z" />
  </symbol>
  <symbol id="people-circle" viewBox="0 0 16 16">
    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
    <path fill-rule="evenodd"
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
  </symbol>
  <symbol id="grid" viewBox="0 0 16 16">
    <path
			d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
  </symbol>
</svg>

	<%
	List<Order> orders = new ArrayList<>();

	// 테이블 리스트
	// 	    List<List<?>> tableList = new ArrayList<>();
	Map<Integer, List<?>> tableMap = new HashMap<>();
	// 	    List<List<?>> tableList = new ArrayList<>();

	OrderDAO orderDAO = new OrderDAO();
	int table_sz = 6;
	for (int i = 0; i < table_sz; i++) {
		// 자바 문법에 맞게 추가
		orders = orderDAO.list(i + 1);

		if (orders != null) {
			// 	        	tableList.add(i, orders);
			tableMap.put(i + 1, orders);
		}
	}

	// 	    pageContext.setAttribute("tableList", tableList);
	pageContext.setAttribute("tableMap", tableMap);
	
	// 오늘 날짜 가져오기
	java.util.Date utilDate = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String todayStr = sdf.format(utilDate);
	request.setAttribute("todayStr", todayStr);
	%>


	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand me-5">냉면집 QR 주문 전체 관리</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarToggler"
				aria-controls="navbarToggler" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarToggler">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<button id="salesBtn" class="btn btn-lg btn-dark ms-3 me-3" type="button">매출 관리</button>
					</li>
					<li class="nav-item">
						<button id="cancelBtn" class="btn btn-lg btn-dark ms-3" type="button">주문 취소</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 모달 창 -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">금일 매출 관리 <%= todayStr %></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
			<table class="table">
        		<thead>
            		<tr>
                		<th>테이블 번호</th>
                		<th>매출 금액</th>
            		</tr>
        		</thead>
        		<tbody>
            	<c:forEach var="table" items="${tableMap}">
				    <tr>
				        <td>${table.key}</td>
				        <td>
				            <%-- 각 테이블의 매출 합계 계산 --%>
				            <c:set var="totalSales" value="0" />
				            <c:forEach var="order" items="${table.value}">
				                <%-- 주문 날짜가 오늘인 경우에만 합산 --%>
				                <c:if test="${ order.order_date eq todayStr }">
				                    <%-- 주문 가격 합계 --%>
				                    <c:set var="totalSales" value="${totalSales + order.price}" />
				                </c:if>
				            </c:forEach>
				            <fmt:formatNumber value="${totalSales}" type="currency" currencyCode="KRW" />
				        </td>
				    </tr>
				</c:forEach>
        		</tbody>
    		</table>
    		<p>금일 총 매출: 
			    <c:set var="totalDailySales" value="0" />
			    <c:forEach var="table" items="${tableMap}">
			        <c:forEach var="order" items="${table.value}">
			            <%-- 주문 날짜가 오늘인 경우에만 합산 --%>
			            <c:if test="${ order.order_date eq todayStr }">
			                <%-- 주문 가격 합계 --%>
			                <c:set var="totalDailySales" value="${totalDailySales + order.price}" />
			            </c:if>
			        </c:forEach>
			    </c:forEach>
			    <fmt:formatNumber value="${totalDailySales}" type="currency" currencyCode="KRW" />
			</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<!-- 다른 버튼 등을 추가할 수 있습니다. -->
				</div>
			</div>
		</div>
	</div>

	<script>
    // 매출 관리 버튼 클릭 시 모달 띄우기
    document.getElementById('salesBtn').addEventListener('click', function() {
        // 모달 띄우기
        $('#myModal').modal('show');
    });
	</script>
	

	<!-- 주문 취소 모달 -->
	<div class="modal fade" id="cancelModal" tabindex="-1" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">주문 취소</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <!-- 여기에 주문 취소 폼 또는 내용을 추가하세요 -->
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                <!-- 다른 버튼 등을 추가할 수 있습니다. -->
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
    // 주문 취소 버튼 클릭 시 모달 띄우기
	    document.getElementById('cancelBtn').addEventListener('click', function() {
	        // 모달 띄우기
	        $('#cancelModal').modal('show');
	    });
	</script>
	
	
	<div class="container">
		<div class="row justify-content-center align-items-center h-100">
			<%-- 			<c:forEach var="table" items="${tableList}"> --%>
			<c:forEach var="table" items="${ tableMap }">
				<div class="col-md-4 mb-4">
					<div class="card outer-card">
						<div class="card-body">
							<h5 class="card-title">테이블 ${ table.key }</h5>
							<!-- 내부 카드 -->
							<div class="card inner-card">
								<div class="card-body">
									<c:set var="totalPrice" value="0" />
									<c:forEach var="order" items="${ table.value }">
										<%-- 주문 상태가 'pay ok'인 경우에만 화면에 표시 --%>
										<c:if test="${ order.status eq 'pay ok' }">
											<div style="display: flex; justify-content: space-between;">
												<p class="card-text text-dark">
													<!-- 반복문으로 menu_name 같은게 나오면 name 중복 제거 후 amount 만큼 더해서 출력  -->
													${ order.menu_name }
												</p>
												${ order.amount }개
												<p class="card-text text-dark">
													<fmt:formatNumber value="${ order.price }" type="currency" currencyCode="KRW" />
												</p>
											</div>

											<!-- <p class="card-text text-dark">내용을 여기에 넣으세요.</p> -->
											<p style="display: none">${ totalPrice = Integer.parseInt(totalPrice) + order.price }
											</p>
										</c:if>
									</c:forEach>
								</div>
								<div class="card-footer card-footer-custom">
									<!-- 									<p class="text-dark mb-0 mr-auto">￦</p> -->
									<p class="text-dark mb-0 mr-auto">
										<fmt:formatNumber value="${ totalPrice }" type="currency" currencyCode="KRW" />
									</p>
									<button class="btn btn-dark btn-custom"
										onclick="completeOrder('${ table.key }')">완료</button>
								</div>
							</div>
							<!-- 내부 카드 끝 -->
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<script type="text/javascript">
		function completeOrder(tableNo) {
			// AJAX 요청 생성
			var xhr = new XMLHttpRequest();
			var url = "submit_order.jsp";
			var params = "tableNo=" + tableNo; // 요청 데이터
			xhr.open("POST", url, true);

			// 요청 헤더 설정
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// 서버 응답 처리
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						// 서버 응답이 성공적으로 도착한 경우
						var response = JSON.parse(xhr.responseText);
						if (response.success) {
							alert("주문이 성공적으로 완료되었습니다.");
							location.reload();
						} else {
							alert("주문 처리 중 오류가 발생했습니다.");
						}
					} else {
						// 서버 응답이 실패한 경우
						alert("서버 오류: " + xhr.status);
					}
				}
			};

			// AJAX 요청 전송
			xhr.send(params);
		}
	</script>

	<script src="static/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
} else {
response.sendRedirect("OwnerLogin/login.jsp");
}
%>