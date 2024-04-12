package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import store.DAO.OrderDAO;
import store.DTO.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class orderServlet
 */
@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String selectedDate = request.getParameter("selectedDate");
	    System.out.println("선택한 날짜: " + selectedDate);
	    
	    OrderDAO orderDAO = new OrderDAO();   
	    List<Order> orderList = orderDAO.getOrdersByDate(selectedDate);
	    
	    // 총 주문 갯수를 저장할 변수
	    int totalOrders = orderList.size();
	    
	    // 총 매출액을 저장할 변수
	    int totalSales = 0;
	    
	    // 응답을 HTML 형식으로 작성
	    response.setContentType("text/html");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<table>");
	    out.println("<tr><th>테이블 번호</th><th>메뉴명</th><th>수량</th><th>가격</th></tr>");
	    for (Order order : orderList) {
	        // 매출 금액을 한국 원 형식으로 변환하여 출력
	        String formattedPrice = String.format("%,d", order.getPrice());
	        out.println("<tr><td>" + order.getTable_no() + "</td><td>" + order.getMenu_name() + "</td><td>" + order.getAmount() + "</td><td>" + formattedPrice + "원</td></tr>");
	        
	        // 총 매출액 계산
	        totalSales += order.getPrice();
	    }
	    out.println("</table>");
	    
	    // 총 주문 갯수 출력
	    out.println("<p>총 주문 갯수: " + totalOrders + "건</p>");
	    
	    // 총 매출액 출력
	    String formattedTotalSales = String.format("%,d", totalSales);
	    out.println("<p>총 매출액: " + formattedTotalSales + "원</p>");
	    
	    out.close();
	}


}
