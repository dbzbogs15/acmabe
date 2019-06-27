package com.book.read.service;

import com.book.read.model.Book;
import com.book.read.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepository;

    public List<Book> getAll() {
        return bookRepository.findAll();
    }

    public Page<Book> getBookSortByDate(int page, int size) {
        return bookRepository.findAll(
                PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "created")));
    }

    public Book getBook(int id) {
        return bookRepository.getOne(id);
    }

    public List<Book> searchBookByName(String name) {
        return bookRepository.findAllByNameContains(name);
    }

    public Book addBook(Book book) {
        return bookRepository.save(book);
    }

    public void deleteBook(Integer id) {
        bookRepository.deleteById(id);
    }

}
