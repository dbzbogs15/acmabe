package com.book.read.controller;

import com.book.read.model.Book;
import com.book.read.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    BookService bookService;

    @GetMapping("")
    public String main(@RequestParam int id, ModelMap mm) {
        mm.addAttribute("book", bookService.getBook(id));
        return "book";
    }

    @GetMapping("/search")
    @ResponseBody
    public List<Book> search(@RequestParam String k) {
        return bookService.searchBookByName(k);
    }
}
