package com.book.read.controller;

import com.book.read.model.Account;
import com.book.read.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService accountService;

    //Đăng nhập
    @PostMapping("/login")
    @ResponseBody
    public boolean login(String email, String password, HttpSession session) {
        Account account = accountService.login(email, password);
        if (account == null) {
            return false;
        }
        session.setAttribute("account", account);
        return true;
    }

    @PostMapping("/register")
    @ResponseBody
    public boolean register(Account account) {
        System.out.println(account.toString());
        try {
            accountService.register(account);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //Chekc mail đã tồn tại
    @GetMapping("/checkEmail")
    @ResponseBody
    public boolean checkEmail(@RequestParam String email) {
        if (accountService.findByEmail(email) != null) {
            return false;
        }
        return true;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("account");
        return "redirect:/";
    }
}
