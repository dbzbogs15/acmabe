package com.book.read.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "orders")
@Data
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String trackingnumber;
    private String name;
    private String email;
    private String phone;
    private int totalprice;
    private Date orderdate;
    private String wardid;
    private String address;
}
