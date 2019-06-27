package com.book.read.controller;

import com.book.read.model.Catalog;
import com.book.read.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/catalog")
public class CatalogController {
    @Autowired
    CatalogService catalogService;

    @GetMapping("")
    public String index(ModelMap mm, @RequestParam int id) {
        mm.addAttribute("catalog", catalogService.getById(id));
        return "catalog";
    }

    @GetMapping("/all")
    @ResponseBody
    public List<Catalog> all() {
        return catalogService.getAll();
    }
}
