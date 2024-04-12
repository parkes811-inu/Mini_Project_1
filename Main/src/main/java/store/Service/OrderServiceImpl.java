package store.Service;

import java.util.List;

import store.DAO.OrderDAO;
import store.DTO.Order;

public class OrderServiceImpl implements OrderService{
	
	private OrderDAO orderDAO = new OrderDAO();

	@Override
	public List<Order> list(int order_no) {
		List<Order> orderList = orderDAO.list(order_no);
		
		return orderList;
	}

	@Override
	public Order select(int no) {
		Order order = orderDAO.select(no);
		return order;
	}
	
	@Override
	public int insert(Order order) {
		
		int result = orderDAO.insert(order);
		
		return result;
	}
	
	@Override
	public int statusUpdate(int table_no) {
		
		int result = orderDAO.statusUpdate(table_no);
		
		return result;
	}

	@Override
	public int delete(int no) {
		int result = orderDAO.delete(no);
		return result;
	}

	

	


}
