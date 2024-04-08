/*
 * 2024-04-08 : 박은서
 * 장바구니 DAO 정의 
 * */
package store.DAO;

import java.sql.SQLException;
import java.util.List;

import store.DTO.Cart;
import store.DTO.Users;

public class CartDAO extends JDBConnection {

	/**
	 * 회원 가입
	 * @param user
	 * @return
	 */
	public int join(Users user) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		// 전화번호, 이름만 users 테이블에 저장
		// join_date는 회원 가입 당시 일자를 sysdate로 추가
		String sql = " INSERT INTO users ( phone, point, join_date ) "
				   + " VALUES(?, ?, sysdate) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, user.getPhone() );
			psmt.setInt( 2, user.getPoint() );
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 회원가입 		성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("회원 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 포인트 확인
	 * @param user
	 * @return
	 */
	public Users check(Users user) {
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM users "
				   + " WHERE phone = ?"; //  and name = ? "
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, user.getPhone() );
			// psmt.setString( 2, user.getPoint() );
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				user.setPhone( rs.getString("phone") );
				user.setPoint( rs.getInt("point"));
				user.setJoinDate( rs.getDate("join_date") );
				return user;		// return 포인트
			}
			return null;
		} catch(SQLException e) {
			System.err.println("로그인 시, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}
	
	/*
	 * Point 업데이트
	 */
	public int updatePoints(String phone, int newPoints) {
	    String sql = "UPDATE users SET point = ? WHERE phone = ?";
	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setInt(1, newPoints);
	        psmt.setString(2, phone);
	        
	        int result = psmt.executeUpdate();
	        return result; // 성공적으로 업데이트된 행의 수 반환
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return 0; // 오류 발생 시 0 반환
	    }
	}


	public static int insert(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}


	public static List<Cart> list() {
		// TODO Auto-generated method stub
		return null;
	}


	public static int update(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}


	public static int delete(String productName) {
		// TODO Auto-generated method stub
		return 0;
	}
}



















