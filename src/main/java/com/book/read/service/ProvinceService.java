package com.book.read.service;

import com.book.read.model.Province;
import com.book.read.repository.ProvinceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceService {
    @Autowired
    ProvinceRepository provinceRepository;

    public List<Province> getAll() {
        return provinceRepository.findAll();
    }
}
