package com.book.read.controller;

import com.book.read.model.*;
import com.book.read.service.OrderDetailService;
import com.book.read.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    OrdersService ordersService;
    @Autowired
    OrderDetailService orderDetailService;

    @PostMapping("")
    public String order(Orders orders, HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        orders.setEmail(account.getEmail());
        orders.setOrderdate(new Date());
        orders.setTotalprice(cart.totalPrice());
        ordersService.addOrder(orders);
        for(Item item : cart.getItemList()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setBook_id(item.getBook().getId());
            orderDetail.setOrder_id(orders.getId());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setUnitprice(item.getQuantity() * item.getBook().getPrice());
            orderDetailService.addOrderDetail(orderDetail);
        }
        return "order_success";
    }
}
