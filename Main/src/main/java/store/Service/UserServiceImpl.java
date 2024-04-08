// 2024.04.03
// 자동로그인 구현

package store.Service;

import store.DAO.UserDAO;
import store.DTO.PersistentLogins;
import store.DTO.Users;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAO();
	
	@Override
	public int join(Users user) {
		int result = userDAO.join(user);
		
		if( result > 0 ) {
			System.out.println("회원 가입 처리 성공!");
		} else {
			System.out.println("회원 가입 실패!");
		}
		// 기본 회원 권한을 추가...
		
		return result;
	}

	@Override
	public Users check(Users user) {
		
		Users loginUser = userDAO.check(user);
		
		// 로그인 성공
		if( loginUser != null ) {
			System.out.println("로그인 성공!");
			return loginUser;
		}
		
		// 로그인 실패
		System.out.println("로그인 실패!");
		return null;
	}

	@Override
	public String refreshToken(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteToken(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PersistentLogins selectTokenByToken(String token) {
		// TODO Auto-generated method stub
		return null;
	}

}













