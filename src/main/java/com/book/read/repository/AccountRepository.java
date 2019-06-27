package com.book.read.repository;

import com.book.read.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AccountRepository extends JpaRepository<Account, String> {

    @Query("from Account where email=:email and password=:password")
    Account login(String email, String password);
    Account findByEmail(String email);
}
