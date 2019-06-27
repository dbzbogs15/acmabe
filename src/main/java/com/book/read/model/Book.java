package com.book.read.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "book")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String author;
    private int price;
    @Column(name = "published_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publishedDate;
    private Date created;
    @Column(name = "catalog_id")
    private int catalogId;
    private String image;
    private String review;
    @ManyToOne
    @JoinColumn(name = "catalog_id", updatable = false, insertable = false)
    private Catalog catalog;
}
