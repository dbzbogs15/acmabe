package com.book.read.service;

import com.book.read.model.OrderDetail;
import com.book.read.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {
    @Autowired
    OrderDetailRepository orderDetailRepository;

    public OrderDetail addOrderDetail(OrderDetail orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }

    public Page<OrderDetail> getBestSeller(int page, int size) {
        return orderDetailRepository.getBestSeller(PageRequest.of(page, size));
    }
}
