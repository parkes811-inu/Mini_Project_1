package store.Service;

import java.util.List;

import store.DAO.CartDAO;
import store.DTO.Cart;

public class addToCartServlet implements CartService {

	@Override
	public List<Cart> list() {
		// 1. DAO 객체에 게시글 목록 요청
		List<Cart> CartList = CartDAO.list();
		// 2. 게시글 목록 데이터 가공
		// pass
		
		// 3. 게시글 목록 반환
		return CartList;
	}

	@Override
	public int insert(Cart cart) {
		// 1. 메뉴들을 전달하여 장바구니에 등록 요청
		int result = CartDAO.insert(cart);
		
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 등록 실패
		//           1 --> 데이터 등록 성공
		// * 비즈니스 로직 예시 - if( result > 0 ) 포인트 추가
		return result;
	}

	@Override
	public int update(Cart cart) {
		// 1. 메뉴 정보를 전달하여 장바구니 데이터 수정 요청
		int result = CartDAO.update(cart);
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 수정 실패
		//           1 --> 데이터 수정 성공
		return result;
	}

	@Override
	public int delete(String productName) {
		// 1. 메뉴 이름을 전달하여 장바구니에서 데이터 삭제 요청
		int result = CartDAO.delete(productName);
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 삭제 실패
		//           1 --> 데이터 삭제 성공
		return result;
	}

	@Override
	public List<Cart> getUniqueCartList(int tableNum) {
		// TODO Auto-generated method stub
		return null;
	}


}
