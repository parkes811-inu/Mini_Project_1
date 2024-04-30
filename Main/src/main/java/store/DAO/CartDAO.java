/*
 * 2024-04-08 : 박은서
 * 장바구니 DAO 정의 
 * */
package store.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import store.DTO.Cart;

public class CartDAO extends JDBConnection {

	/**
	 * 장바구니 추가
	 * @param cart
	 * @return
	 */
	/*
	 *
	 *     
    cartItem.setProductName(productName);
    cartItem.setAmount(count);
    cartItem.setPrice(price);
    cartItem.setImagePath(imagePath);

	 * */
	public int addToCart(Cart cart) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		// 전화번호, 이름만 users 테이블에 저장
		// join_date는 회원 가입 당시 일자를 sysdate로 추가
		// table 번호를 어떻게 받아 올건지 ???
		String sql = " INSERT INTO cart ( table_no, user_id, product_name, amount, price ) "
				   + " VALUES(?, '', ?, ?, ?) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setInt( 1, cart.getTableNo() );
			psmt.setString( 2, cart.getProductName() );
			psmt.setInt( 3, cart.getAmount() );
			psmt.setInt( 4, cart.getPrice() );
			// psmt.setString( 4, cart.getImagePath() );
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
	 * 장바구니 확인
	 * @param int no? 테이블 번호, 유저 아이디? 
	 * @return
	 */
	public Cart check(int tableNo) {
		Cart cart = new Cart();
		// SQL 작성
		String sql = " SELECT SUM(amount) AS total_amount, SUM(price) AS total_price "
				   + " FROM cart "
				   + " WHERE table_no = ? ";
				   // 테이블 번호랑? userId 별로 조회해야하는데 처음에 어떻게 해야할지?
				   //+ " AND user_id = ? "; //  and name = ? "
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setInt( 1, tableNo );
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				cart.setAmount( rs.getInt("total_amount") );
				cart.setPrice( rs.getInt("total_price") );
				return cart;		// return 포인트
			}
			return null;
		} catch(SQLException e) {
			System.err.println("장바구니 요약 시, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}
	
	
	 /*
	  * 2024-04-09 : 박은서
     * 특정 테이블 번호의 장바구니 목록 가져오기
     */
    public List<Cart> getCartList(int tableNum) {
        List<Cart> cartList = new ArrayList<>();

        try {
        	// 이미지 패스를 가져오기 위해 테이블 조인
            String sql = "SELECT C.table_no, C.user_id, C.product_name, C.amount,"
            		+ "			 C.price, P.image_path "
            			+ " FROM cart C, product P "
            			+ " WHERE table_no = ? "
            			+ " AND C.product_name = P.name ";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, tableNum);

			rs = psmt.executeQuery();

            while (rs.next()) {
                Cart cart = new Cart();
                // rs에서 값을 가져와서 cart에 설정
                cart.setProductName(rs.getString("product_name"));
                cart.setPrice(rs.getInt("price"));
                cart.setAmount(rs.getInt("amount"));
                cart.setImagePath(rs.getString("image_path"));
                 cart.setTableNo(rs.getInt("table_no"));
                // 추가적으로 필요한 속성이 있다면 여기에 설정
                cartList.add(cart);
            }
        } catch (SQLException e) {
            System.err.println("장바구니 목록 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
            // 자원 해제
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (psmt != null) try { psmt.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }

        return cartList;
    }
    
    /*
     * 2024-04-09 : 박은서
     * 중복제거 후 장바구니 페이지에 적용하기 위한 메소드
     */
    public List<Cart> getUniqueCartList(int tableNum) {
        List<Cart> originalList = getCartList(tableNum); // 원본 장바구니 목록 가져오기
        Map<String, Cart> cartMap = new HashMap<>(); // 제품 이름을 키로 사용하여 중복 제거
        
        for (Cart item : originalList) {
            if (cartMap.containsKey(item.getProductName())) {
                // 이미 존재하는 항목이면, 수량과 가격 업데이트
                Cart existingItem = cartMap.get(item.getProductName());
                existingItem.setAmount(existingItem.getAmount() + item.getAmount());
                // 가격은 총합으로 업데이트하거나 다른 로직 적용 가능
                existingItem.setPrice(existingItem.getPrice() + item.getPrice());
            } else {
                // 새 항목이면, 맵에 추가
                cartMap.put(item.getProductName(), item);
            }
        }
        
        return new ArrayList<>(cartMap.values()); // 중복 제거된 목록 반환
    }


	public static int insert(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}


	public static List<Cart> list() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * 2024-04-09 : 박은서
	 * 장바구니 내역 업데이트를 위한 메소드
	 */
	@SuppressWarnings("resource")
	public int updateCartItemQuantityAndPrice(int tableNo, String productName, String operation) {
	    int result = 0;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;

	    try {
	        // 1. product 테이블에서 productName에 해당하는 가격 조회
	        String priceQuery = "SELECT price FROM product WHERE name = ?";
	        psmt = con.prepareStatement(priceQuery);
	        psmt.setString(1, productName);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            int productPrice = rs.getInt("price");
	            // 연산에 따른 가격 조정
	            int adjustedPrice = "+".equals(operation) ? productPrice : -productPrice;
	            
	            // 2. cart 테이블에서 해당 테이블 번호와 제품 이름에 맞는 항목의 수량과 가격 업데이트
	            String updateQuery = " UPDATE cart SET amount = amount + ?, price = price + ? "
	                               + " WHERE table_no = ? AND product_name = ? AND amount > 0 "
	                               + " LIMIT 1 ";
	            psmt = con.prepareStatement(updateQuery);
	            psmt.setInt(1, "+".equals(operation) ? 1 : -1); // 수량 조정
	            psmt.setInt(2, adjustedPrice); // 가격 조정
	            psmt.setInt(3, tableNo);
	            psmt.setString(4, productName);
	            
	            result = psmt.executeUpdate();

	            // 3. 장바구니에서 항목의 개수가 0이 된 경우 해당 항목 삭제
	            if (result > 0) {
	                String deleteQuery = "DELETE FROM cart WHERE table_no = ? AND product_name = ? AND amount <= 0";
	                psmt = con.prepareStatement(deleteQuery);
	                psmt.setInt(1, tableNo);
	                psmt.setString(2, productName);
	                psmt.executeUpdate();
	            }
	            return result;
	        } else {
	            return 0;
	        }
	    } catch (SQLException e) {
	        System.err.println("카트 항목 수량 및 가격 업데이트 중 예외 발생");
	        e.printStackTrace();
	    } finally {
	        // 자원 해제
	        if (rs != null) try { rs.close(); } catch (SQLException e) {}
	        if (psmt != null) try { psmt.close(); } catch (SQLException e) {}
	        if (con != null) try { con.close(); } catch (SQLException e) {}
	    }
	    return result;
	}

	/*
	 * 2024-04-11 : 박은서
	 * 결제 완료 후 장바구니 내역 orders 테이블에 저장하기
	 * 
	 * 04-12 : 박은서
	 * orders 테이블에 신규 고객과 기존 고객 분류를 위한 customerStatus 추가
	 */
	public boolean complete(int tableNo, int point, String payment, String phoneNum, String customerStatus) {
	    PreparedStatement psmtSelect = null;
	    PreparedStatement psmtInsert = null;
	    PreparedStatement psmtDelete = null;
	    ResultSet rs = null;
	    boolean isSuccess = false;
	    // Connection con = null; // 데이터베이스 연결 객체

	    try {
	        // cart 테이블에서 해당 tableNo에 해당하는 항목 조회
	        String sqlSelect = " SELECT product_name, SUM(amount) AS amount, SUM(price) AS price "
	        				+ " FROM cart "
	        				+ " WHERE table_no = ? "
	        				+ " GROUP BY product_name ";
	        
	        psmtSelect = con.prepareStatement(sqlSelect);
	        psmtSelect.setInt(1, tableNo);
	        rs = psmtSelect.executeQuery();
	        
	        while (rs.next()) {
	            // 조회된 각 항목을 orders 테이블에 삽입
	            String sqlInsert = "INSERT INTO orders (TABLE_NO, MENU_NAME, AMOUNT, PRICE, ORDER_DATE, STATUS, USE_POINT, PAYMENT, PHONE, CLASSIFICATION) "
	            					+ "VALUES (?, ?, ?, ?, NOW(), 'PAY OK', ?, ?, ?, ?)";
	            psmtInsert = con.prepareStatement(sqlInsert);
	            psmtInsert.setInt(1, tableNo);
	            psmtInsert.setString(2, rs.getString("product_name"));
	            psmtInsert.setInt(3, rs.getInt("amount"));
	            psmtInsert.setInt(4, rs.getInt("price"));
	            psmtInsert.setInt(5, point);
	            psmtInsert.setString(6, payment);
	            psmtInsert.setString(7, phoneNum);
	            psmtInsert.setString(8, customerStatus);

	            psmtInsert.executeUpdate();
	        }

	        // cart 테이블에서 해당 항목 삭제
	        String sqlDelete = "DELETE FROM cart WHERE table_no = ?";
	        psmtDelete = con.prepareStatement(sqlDelete);
	        psmtDelete.setInt(1, tableNo);
	        psmtDelete.executeUpdate();

	        isSuccess = true; // 처리 성공
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        isSuccess = false; // 처리 실패
	    } finally {
	        // 자원 해제
	        try {
	            if (rs != null) rs.close();
	            if (psmtSelect != null) psmtSelect.close();
	            if (psmtInsert != null) psmtInsert.close();
	            if (psmtDelete != null) psmtDelete.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isSuccess;
	}



	public static int delete(String productName) {
		// TODO Auto-generated method stub
		return 0;
	}


	public static int update(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}



















