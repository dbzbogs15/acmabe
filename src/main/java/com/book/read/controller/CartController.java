package com.book.read.controller;

import com.book.read.model.Book;
import com.book.read.model.Cart;
import com.book.read.model.Item;
import com.book.read.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    BookService bookService;

    @GetMapping("")
    public String index(HttpSession session, ModelMap mm) {
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null) {
            return "redirect:/";
        }
        mm.addAttribute("cart", cart);
        return "cart";
    }

    @GetMapping("/index")
    @ResponseBody
    public Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        return cart;
    }


    @GetMapping("/add")
    @ResponseBody
    public Cart cart(@RequestParam Integer quantity, @RequestParam Integer productId, HttpSession session) {
        Book book = bookService.getBook(productId);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            cart.addItem(book, quantity);
        } else {
            cart.addItem(book, quantity);
        }
        cart.setTotalPrice(cart.totalPrice());
        session.setAttribute("cart", cart);
        return cart;
    }

    @DeleteMapping("/{productId}")
    @ResponseBody
    public boolean delete(@PathVariable int productId, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        int index = cart.exists(productId);
        try {
            List<Item> items = cart.getItemList();
            items.remove(index);
            cart.setItemList(items);
            cart.setTotalPrice(cart.totalPrice());
            session.setAttribute("cart", cart);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;

    }
    @GetMapping("/confirm")
    public String confirm() {
        return "cart_confirm";
    }
}
