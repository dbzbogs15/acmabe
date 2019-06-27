package com.book.read.service;

import com.book.read.model.Catalog;
import com.book.read.repository.CatalogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatalogService {
    @Autowired
    CatalogRepository catalogRepository;

    public List<Catalog> getAll() {
        return catalogRepository.findAll();
    }

    public Catalog getById(int id) {
        return catalogRepository.getOne(id);
    }
}
