<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
</html>

<%
    // 요청 파라미터에서 상품 정보 추출
    String productName = request.getParameter("productName");
    int count = Integer.parseInt(request.getParameter("count"));
    double price = Double.parseDouble(request.getParameter("price"));
    String imagePath = request.getParameter("imagePath");

    // Cart 객체 생성 및 값 설정
    Cart cartItem = new Cart();
    cartItem.setUserId(userId);
    cartItem.setProductId(productId);
    cartItem.setProductName(productName);
    cartItem.setCount(count);
    cartItem.setPrice(price);
    cartItem.setImagePath(imagePath);

    // 장바구니 항목을 데이터베이스에 추가
    CartDAO cartDao = new CartDAO();
    boolean isSuccess = cartDao.addToCart(cartItem);

    // 결과에 따라 응답 설정
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    if (isSuccess) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("error");
    }
%>
