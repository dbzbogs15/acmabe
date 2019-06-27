package com.book.read.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "account")
@Data
public class Account {
    @Id
    private String email;
    private String password;
    private String name;
    @Column(name = "date_of_birth")
    private Date dateOfBirth;
    private boolean gender;
}
