package store.Service;

import store.DTO.OwnerPersistentLogins;
import store.DTO.Owner;

public interface OwnerService {

	// 로그인
	public Owner login(Owner user);

	// 자동 로그인 - 토큰 갱신
	public String refreshToken(String ownerId);

	// 자동 로그인 - 토큰 삭제
	public int deleteToken(String ownerId);

	// 자동 로그인 - 토큰 조회
	public OwnerPersistentLogins selectTokenByToken(String token);
}
