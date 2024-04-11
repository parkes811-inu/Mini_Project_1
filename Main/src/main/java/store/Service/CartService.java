/*
 * 2024-04-08 : 박은서
 * 
 * 장바구니 프로그램의 인터페이스
 * - 기능 : 
 * 1. 푸터 (장바구니) 버튼 클릭 시 조회
 * 2. 장바구니 추가
 * 3. 장바구니 수정
 * 4. 장바구니 메뉴 삭제
 * */

package store.Service;

import java.util.List;

import store.DTO.Cart;

/**
 * 게시판 프로그램의 인터페이스
 * * 게시판의 기능 메소드
 * - 게시글 목록
 * - 게시글 조회
 * - 게시글 등록
 * - 게시글 수정
 * - 게시글 삭제
 * 
 */
public interface CartService {
	
	// 장바구니 조회
	List<Cart> list();
	
	// 장바구니 등록
	int insert(Cart cart);
	
	// 장바구니 수정
	int update(Cart cart);
	
	// 장바구니 삭제
	int delete(String productName);
	
	// 장바구니 중복 제거 
    public List<Cart> getUniqueCartList(int tableNum);

}







