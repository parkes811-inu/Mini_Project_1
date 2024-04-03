// 2024.04.03
// 자동로그인을 위한 DTO

package store.DTO;

import java.util.Date;

public class PersistentLogins {
	
	private int pNo;
	private String userId;
	private String token;
	private Date regDate;
	private Date updDate;
	
	// getter, setter, toString
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdDate() {
		return updDate;
	}
	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}
	
}
