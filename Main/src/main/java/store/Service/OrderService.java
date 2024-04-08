package store.Service;

import java.util.List;

import store.DTO.Order;

public interface OrderService {
	
	List<Order> list(int order_no);
	
	int insert(Order order);
	
	Order select(int no);
	
	int delete(int no);

}
