package store.DTO;

import java.sql.Date;

public class Order {

	private int order_no;
	private int table_no;
	private String menu_name;
	private int amount;
	private int price;
	private Date order_date;
	private String status;
	private String phone;
	
	public Order() {
		
	}
	
	public Order(int order_no, int table_no, String menu_name, int amount, int price, Date order_date, String status,
			String phone) {
		super();
		this.order_no = order_no;
		this.table_no = table_no;
		this.menu_name = menu_name;
		this.amount = amount;
		this.price = price;
		this.order_date = order_date;
		this.status = status;
		this.phone = phone;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getTable_no() {
		return table_no;
	}

	public void setTable_no(int table_no) {
		this.table_no = table_no;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
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

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Order [order_no=" + order_no + ", table_no=" + table_no + ", menu_name=" + menu_name + ", amount="
				+ amount + ", price=" + price + ", order_date=" + order_date + ", status=" + status + ", phone=" + phone
				+ "]";
	}
	
	
}
