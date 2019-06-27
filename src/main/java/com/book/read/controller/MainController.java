package com.book.read.controller;

import com.book.read.model.Book;
import com.book.read.model.OrderDetail;
import com.book.read.service.BookService;
import com.book.read.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    BookService bookService;
    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("/")
    public String main(ModelMap mm) {
        List<OrderDetail> list = orderDetailService.getBestSeller(0, 6).getContent();
        System.out.println(list);
        List<Book> result = new ArrayList<>();
        for (OrderDetail orderDetails : list) {
            result.add(orderDetails.getBook());
        }
        mm.addAttribute("sachBanChay", result);
        mm.addAttribute("sachMoi", bookService.getBookSortByDate(0, 8));
        return "main";
    }

    @GetMapping("/all")
    @ResponseBody
    public Page<Book> all() {
        return bookService.getBookSortByDate(0, 8);
    }
}
