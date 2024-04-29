package store.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import store.DTO.Order;

public class OrderDAO extends JDBConnection {
	// 데이터 목록
	public List<Order> list(int table_no) {

		// 목록을 담을 컬렉션 객체 생성
		List<Order> orderList = new ArrayList<Order>();

		// SQL 작성
		String sql = " SELECT * " 
				   + " FROM orders "
				   + " WHERE table_no = ? "
				   + " AND status != 'CANCELED' "
				   + " AND status != 'COMPLETE' ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - Statement (stmt)
			// stmt = con.createStatement();
			
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setInt( 1, table_no );		// ?(1) <-- no (글번호)
			// 쿼리(SQL) 실행 -> 결과 - ResultSet (rs)
			//rs = stmt.executeQuery(sql);
			rs = psmt.executeQuery(); // sql 변수를 전달할 필요 없음

			// 조회 결과를 리스트에 추가
			while (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동
				Order order = new Order();

				// 결과 데이터 가져오기
				order.setOrder_no(rs.getInt("order_no"));
				order.setTable_no(rs.getInt("table_no"));
				order.setMenu_name(rs.getString("menu_name"));
				order.setAmount(rs.getInt("amount"));
				order.setPrice(rs.getInt("price"));
				order.setStatus(rs.getString("status"));
				order.setOrder_date(rs.getDate("order_date"));
				order.setUse_point(rs.getInt("use_point"));
				order.setPayment(rs.getString("payment"));

				// 목록에 추가
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.err.println("주문 목록 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 목록 반환
		return orderList.size() == 0 ? null : orderList;
	}
	
public Order select(int no) {
		
		// 게시글 정보 객체 생성
		Order order = new Order();
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM orders "
				   + " WHERE ORDER_NO = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setInt( 1, no );		// ?(1) <-- no (글번호)
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				order.setTable_no( rs.getInt("table_no") );
				order.setMenu_name( rs.getString("menu_name") );
				order.setAmount( rs.getInt("amount"));
				order.setPrice( rs.getInt("price") );
				order.setStatus(rs.getString("status"));
			}
		} catch(SQLException e) {
			System.err.println("게시글 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 정보 1건 반환
		return order;
	}
	
	public int insert(Order order) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " INSERT INTO orders (ORDER_NO, TABLE_NO, MENU_NAME, AMOUNT, PRICE, sysdate, STATUS, PHONE) "
				   + " VALUES(SEQ_ORDER.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setInt( 1, order.getOrder_no() );
			psmt.setInt( 2, order.getTable_no() );
			psmt.setString( 3, order.getMenu_name() );
			psmt.setInt( 4, order.getAmount() );
			psmt.setInt( 5, order.getPrice() );
			// psmt.setDate( 6, order.getOrder_date() );
			psmt.setString( 7, order.getStatus() );
			psmt.setString( 8, order.getPhone() );
			
			result = psmt.executeUpdate();		
			
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("주문 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int statusUpdate(int table_no) {
		int result = 0;
		
		String sql = " UPDATE orders "
				   + " SET STATUS = 'COMPLETE' "
				   + " WHERE table_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, table_no);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("상태 수정 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	@SuppressWarnings("resource")
	public int delete(int orderNo) {
	    int result = 0;  // 결과: 적용된 데이터 건수

	    // 주문 상태를 'CANCELED'로 업데이트
	    String sql = " UPDATE orders "
	    			+ " SET status = 'CANCELED' "
	    			+ " WHERE order_no = ? ";
	    
	    PreparedStatement psmt = null; // SQL 실행 객체
	    ResultSet rs = null; // 조회 결과 처리 객체

	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setInt(1, orderNo);
	        result = psmt.executeUpdate();

	        if (result > 0) {
	            // 롤백할 포인트 계산
	            String pointSQL = " SELECT a.price * 0.1 - a.use_point AS rollbackPoint, a.phone "
	            				+ " FROM orders a, USERS b "
	            				+ " WHERE a.phone = b.phone "
	            				+ " AND a.status = 'CANCELED' "
	            				+ " AND a.order_no = ? ";
	            
	            psmt = con.prepareStatement(pointSQL);
	            psmt.setInt(1, orderNo);
	            rs = psmt.executeQuery();

	            if (rs.next()) {
	                int rollbackPoint = rs.getInt("rollbackPoint");
	                String phone = rs.getString("phone");

	                // 사용자의 포인트 업데이트
	                String update = " UPDATE USERS "
	                				+ " SET point = point - ? "
	                				+ " WHERE phone = ? ";
	                psmt = con.prepareStatement(update);
	                psmt.setInt(1, rollbackPoint);
	                psmt.setString(2, phone);
	                psmt.executeUpdate();
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println("주문 삭제 시, 예외 발생");
	        e.printStackTrace();
	    } finally {
	        // 자원 해제
	        try {
	            if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return result;
	}

	public List<Order> getOrdersByDate(String selectedDate) {
		
		List<Order> orderList = new ArrayList<Order>();
		
		String sql = " SELECT * "
					+ " FROM orders "
					+ " WHERE TRUNC(ORDER_DATE) = TO_DATE(?, 'YYYY-MM-DD') "
					+ " AND status != 'CANCELED' ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString( 1, selectedDate );
			rs = psmt.executeQuery();
			while (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동
				Order order = new Order();

				// 결과 데이터 가져오기
				order.setTable_no(rs.getInt("table_no"));
				order.setMenu_name(rs.getString("menu_name"));
				order.setAmount(rs.getInt("amount"));
				order.setPrice(rs.getInt("price"));

				// 목록에 추가
				orderList.add(order);
			}
			
		} catch (SQLException e) {
			System.err.println("Date 조회 시, 예외 발생");
			e.printStackTrace();
		}
		
		return orderList;
	}
	
}
