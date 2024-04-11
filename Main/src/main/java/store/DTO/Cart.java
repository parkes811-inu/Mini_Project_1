// 2024.04.08 : 박은서
// 장바구니를 위한 DTO 정의

package store.DTO;

public class Cart {
	
	private int tableNo;
	private String userId;
	private String productName;
	private int amount;
	private int price;
	private String imagePath;
	
	// 기본 생성자
	public Cart() {
		
	}
	// ====================================================================================
	// getter&setter
	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	// ====================================================================================
	// toString()
	@Override
	public String toString() {
		return "Cart [tableNo=" + tableNo + ", userId=" + userId + ", productName=" + productName + ", amount=" + amount
				+ ", price=" + price + "]";
	}
	// ====================================================================================
}
