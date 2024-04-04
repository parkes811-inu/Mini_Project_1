// 2024.04.03
// 회원 관리를 위한 DTO

package store.DTO;

import java.util.Date;

public class Users {
	private String phone;
	private String name;
	private Date joinDate;
	private String point;
	
	// 기본 생성자
	public Users() {
		
	}
	
	// ====================================================================================
	// getter&setter
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	
	// ====================================================================================
	
	// toString()
	@Override
	public String toString() {
		return "Users [phone=" + phone + ", name=" + name + ", joinDate=" + joinDate + "]";
	}
	// ====================================================================================
}
