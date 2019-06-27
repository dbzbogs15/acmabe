package com.book.read.service;

import com.book.read.model.Account;
import com.book.read.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {
    @Autowired
    AccountRepository accountRepository;

    public Account login(String email, String password) {
        return accountRepository.login(email, password);
    }
    public Account register(Account account) {
        return accountRepository.save(account);
    }
    public Account findByEmail(String email) {
        return accountRepository.findByEmail(email);
    }
}
