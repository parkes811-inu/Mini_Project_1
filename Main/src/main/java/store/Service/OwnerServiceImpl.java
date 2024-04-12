package store.Service;

import store.DAO.OwnerDAO;
import store.DTO.Owner;
import store.DTO.OwnerPersistentLogins;

public class OwnerServiceImpl implements OwnerService{

	private OwnerDAO ownerDAO = new OwnerDAO();
	
	@Override
	public Owner login(Owner owner) {
		
		Owner loginOwner = ownerDAO.login(owner);
		
		// 로그인 성공
		if ( loginOwner != null ) {
			System.out.println(" 로그인 성공! ");
			return loginOwner;
		}
		
		// 로그인 실패
		System.out.println("로그인 실패!");
		return null;
	}

	@Override
	public String refreshToken(String ownerId) {
		
		OwnerPersistentLogins persistentLogins = ownerDAO.selectToken(ownerId);
		
		String token = null;
		if (persistentLogins == null) {
			// 토큰이 없는 경우, 토큰 등록
			token = ownerDAO.insertToken(ownerId);
		} else {
			// 토큰이 없는 경우 ,토큰 수정
			token = ownerDAO.updateToken(ownerId);
		}
		return token;
	}

	@Override
	public int deleteToken(String ownerId) {
		
		int result = ownerDAO.deleteToken(ownerId);
		if (result > 0) {
			System.out.println("자동 로그인 토큰 삭제 성공!");
		} else {
			System.out.println("자동 로그인 토큰 삭제 실패!");
		}
		return result;
	}

	@Override
	public OwnerPersistentLogins selectTokenByToken(String token) {
		
		OwnerPersistentLogins persistentLogins = ownerDAO.selectTokenByToken(token);
		
		if (persistentLogins == null) {
			System.out.println("인증된 토큰 정보가 존재하지 않습니다.");
			return null;
		} else {
			System.out.println("인증된 토큰 확인됨...");
			return persistentLogins;
		}
	}

}
