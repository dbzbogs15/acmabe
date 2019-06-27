package com.book.read.controller;

import com.book.read.model.District;
import com.book.read.model.Province;
import com.book.read.model.Ward;
import com.book.read.service.DistrictService;
import com.book.read.service.ProvinceService;
import com.book.read.service.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AddressController {
    @Autowired
    ProvinceService provinceService;

    @Autowired
    DistrictService districtService;

    @Autowired
    WardService wardService;

    @RequestMapping("/address/provinces")
    public List<Province> provinces() {
        return provinceService.getAll();
    }

    @GetMapping("/address/{provinceid}")
    public List<District> districts(@PathVariable String provinceid) {
        return districtService.getByProvinceid(provinceid);
    }

    @GetMapping("/address/district/{id}")
    public List<Ward> wards(@PathVariable String id) {
        return wardService.getByDistrictid(id);
    }
}
