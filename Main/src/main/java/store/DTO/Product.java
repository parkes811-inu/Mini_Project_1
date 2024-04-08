/*	2024.04.04 : 반예진 
 * 
 * 2024.04.05 : 박은서 수정 
 * - 수량 삭제 - private int count 삭제 
 * 
 * */

package store.DTO;

/**
 * 상품
 * - 상품아이디
 * - 상품명
 * - 가격
 * - 상품 설명
 * - 파일 경로
 * 
 */
public class Product {
	
	private String productId;
	private String name;
	private int price;
	private String description;
	private String imagePath;
	private String category;
	private int count;
	
	// ====================================================================================
	// 기본 생성자
	public Product() {
		
	}
	

	public Product(String productId, String name, int price) {
		this.productId = productId;
		this.name = name;
		this.price = price;
	}
	
	
	public Product(String productId, String name, int price, int count, String filePath) {
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.imagePath= filePath;
	}
	// ====================================================================================
	
	// ====================================================================================
	// getter&setter
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}
	
	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	// ====================================================================================

	// ====================================================================================
	// toString()
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", price=" + price + ", imagePath=" + imagePath + "]";
	}
	// ====================================================================================

	
}

