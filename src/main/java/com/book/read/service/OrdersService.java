package com.book.read.service;

import com.book.read.model.Orders;
import com.book.read.repository.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersService {
    @Autowired
    OrdersRepository ordersRepository;

    public Orders addOrder(Orders orders) {
        return ordersRepository.save(orders);
    }
}
