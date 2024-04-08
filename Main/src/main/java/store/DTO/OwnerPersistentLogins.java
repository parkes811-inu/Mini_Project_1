package store.DTO;

import java.util.Date;

public class OwnerPersistentLogins {

	private int pNo;
	private String ownerId;
	private String token;
	private Date regDate;
	private Date updDate;
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
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
	
	@Override
	public String toString() {
		return "OwnerPersistentLogins [pNo=" + pNo + ", ownerId=" + ownerId + ", token=" + token + ", regDate="
				+ regDate + ", updDate=" + updDate + "]";
	}
	
	
}
