package com.book.read.service;

import com.book.read.model.District;
import com.book.read.repository.DistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictService {
    @Autowired
    DistrictRepository districtRepository;

    public List<District> getByProvinceid(String provinceid) {
        return districtRepository.findAllByProvinceid(provinceid);
    }
}
