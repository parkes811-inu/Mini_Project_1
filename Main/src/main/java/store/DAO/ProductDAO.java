// 2024.04.03 반예진
// 장바구니를 위한 Produuct DAO 정의

package store.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import store.DTO.Product;


public class ProductDAO extends JDBConnection {

	/**
	 * 메인메뉴 조회
	 * @param Product_id
	 * @return Product
	 */
	public Product check(String id) {
	    Product product = null;
	    String sql = " SELECT * "
	    		     + " FROM product "
	    		    + " WHERE product_id = ? "; 
	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, id);
	        ResultSet rs = psmt.executeQuery();
	        
	        if(rs.next()) {
	            product = new Product();
	            product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setPrice(rs.getInt("price"));
	            product.setDescription(rs.getString("description"));
	            product.setImagePath(rs.getString("image_path"));
	            // product 객체에 더 많은 속성이 있다면, 여기서 추가로 설정
	        }
	        rs.close();
	    } catch (SQLException e) {
	        System.err.println("제품 조회 중 예외 발생");
	        e.printStackTrace();
	    }
	    return product;
	}
	
	/* 
	 * 2024-04-05 : 박은서
	 * 메인 메뉴 화면에 모달 팝업 띄우기를 위한 메뉴 조회 쿼리
	 */
	public ArrayList<Product> getAllProducts(String category) throws SQLException {
	    ArrayList<Product> products = new ArrayList<>();
	    String sql = "SELECT * "
	    			+ " FROM product "
	    			+ " WHERE category = ? ";

	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, category); // 카테고리 설정
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Product product = new Product();
	            product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setPrice(rs.getInt("price"));
	            product.setDescription(rs.getString("description"));
	            product.setImagePath(rs.getString("image_path"));
	            
	            products.add(product);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // 예외 처리
	        throw e;
	    } finally {
	        if (rs != null) try { rs.close(); } catch (SQLException e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
	    }

	    return products;
	}

	
}



















