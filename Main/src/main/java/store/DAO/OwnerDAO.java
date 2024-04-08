package store.DAO;

import java.sql.SQLException;
import java.util.UUID;

import store.DTO.Owner;
import store.DTO.OwnerPersistentLogins;

public class OwnerDAO extends JDBConnection {
	
	/**
	 * 오너 로그인
	 * @param owner
	 * @return
	 */
	public Owner login(Owner owner) {
		String sql = " SELECT * "
				   + " FROM OWNER "
				   + " WHERE ID = ? AND PW = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString( 1, owner.getId() );
			psmt.setString( 2, owner.getPassword() );
			rs = psmt.executeQuery();
					
			if( rs.next() ) {
				owner.setId( rs.getString("id") );
				owner.setPassword( rs.getString("pw") );
				return owner;
			}
			return null;
		} catch(SQLException e) {
			System.err.println("로그인 시, 예외 발생");
			e.printStackTrace();
		}
		return null;		
	}
	
	/**
	 * 토큰 생성
	 * @param ownerId
	 * @return
	 */
	public String insertToken(String ownerId) {
		int result = 0;
		String sql = " INSERT INTO persistent_logins (p_no, id, token)"
				   + " VALUES (SEQ_PER_LOGIN.nextval, ?, ?)";
		// 토큰 발행
		String token = UUID.randomUUID().toString();
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, ownerId);
			psmt.setString(2, token);
			
			result = psmt.executeUpdate();
		}catch (SQLException e) {
			System.err.println("자동 로그인 정보 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + " 개 등록되었습니다.");
		return token;
	}
	
	/**
	 * 토큰 수정
	 * 기존 토큰 존재 시, 갱신
	 * @param ownerId
	 * @return
	 */
	public String updateToken(String ownerId) {
		int result = 0;
		String sql = " UPDATE persistent_logins"
				   + " SET token = ?"
				   + " 	  , upd_date = sysdate"
				   + " WHERE id = ? ";
		// 토큰 발행
		String token = UUID.randomUUID().toString();
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, ownerId);
			
			result = psmt.executeUpdate();
		}catch (SQLException e) {
			System.err.println("자동 로그인 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + " 개 수정되었습니다.");
		return token;
	}
	
	/**
	 * 토큰 조회1 - id로 조회
	 * @param ownerId
	 * @return
	 */
	public OwnerPersistentLogins selectToken(String ownerId) {
		String sql = " SELECT * "
				   + " FROM persistent_logins "
				   + " WHERE id = ? ";
		
		OwnerPersistentLogins persistentLogins = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, ownerId);
			
			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogins = new OwnerPersistentLogins();
				persistentLogins.setpNo(rs.getInt("p_no"));
				persistentLogins.setOwnerId(rs.getString("id"));
				persistentLogins.setToken(rs.getString("token"));
				persistentLogins.setRegDate(rs.getDate("reg_date"));
				persistentLogins.setUpdDate(rs.getDate("upd_date"));
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogins;
	}
	
	/**
	 * 토큰 조회2 - token으로 조회
	 * @param token
	 * @return
	 */
	public OwnerPersistentLogins selectTokenByToken(String token) {
		String sql = " SELECT * "
				   + " FROM persistent_logins "
				   + " WHERE token = ? ";
		
		OwnerPersistentLogins persistentLogins = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			
			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogins = new OwnerPersistentLogins();
				persistentLogins.setpNo(rs.getInt("p_no"));
				persistentLogins.setOwnerId(rs.getString("id"));
				persistentLogins.setToken(rs.getString("token"));
				persistentLogins.setRegDate(rs.getDate("reg_date"));
				persistentLogins.setUpdDate(rs.getDate("upd_date"));
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogins;
	}
	
	/**
	 * 토큰 삭제
	 * @param ownerId
	 * @return
	 */
	public int deleteToken(String ownerId) {
		int result = 0;
		String sql = " DELETE FROM persistent_logins WHERE id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, ownerId);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + " 개의 데이터가 삭제되었습니다.");
		return result;
	}
}
