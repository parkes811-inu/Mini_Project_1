package store.DAO;

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
				   + " FROM ORDERS "
				   + " WHERE table_no = ? ";
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
				//order.setOrder_date(rs.getDate("order_date"));

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
				   + " FROM ORDERS "
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
		
		String sql = " INSERT INTO ORDERS (ORDER_NO, TABLE_NO, MENU_NAME, AMOUNT, PRICE, ORDER_DATE, STATUS, PHONE) "
				   + " VALUES(SEQ_ORDER.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setInt( 1, order.getOrder_no() );
			psmt.setInt( 2, order.getTable_no() );
			psmt.setString( 3, order.getMenu_name() );
			psmt.setInt( 4, order.getAmount() );
			psmt.setInt( 5, order.getPrice() );
			psmt.setDate( 6, order.getOrder_date() );
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
	
	
	public int delete(int no) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " DELETE FROM ORDERS "
				   + " WHERE ORDER_NO = ? ";
		
		try {
			psmt = con.prepareStatement(sql);	// 쿼리 실행 객체 생성
			psmt.setInt( 1, no );				// 1번 ? 에 게시글 번호를 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("주문 삭제 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
}
