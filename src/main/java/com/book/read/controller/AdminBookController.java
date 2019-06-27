package com.book.read.controller;

import com.book.read.model.Book;
import com.book.read.model.Catalog;
import com.book.read.service.BookService;
import com.book.read.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/book")
public class AdminBookController {
    @Autowired
    BookService bookService;
    @Autowired
    ServletContext context;
    @Autowired
    CatalogService catalogService;

    //Hiển thị sách lên manager
    @RequestMapping("/manager")
    public String manager(ModelMap mm) {
        List<Book> bookList = bookService.getAll();
        Collections.reverse(bookList);
        mm.addAttribute("books", bookList);
        return "admin/book_manager";
    }

    //Chuyển sang trang thêm sách
    @GetMapping("/add")
    public String add(ModelMap mm) {
        //Danh sách thể loại
        mm.addAttribute("catalog", catalogService.getAll());
        return "admin/book_add";
    }

    @GetMapping("/getAllCatalog")
    @ResponseBody
    public List<Catalog> getallCatalog() {
        return catalogService.getAll();
    }

    // Xử lí thêm sách
    @PostMapping("/add")
    public String add(Book book, @RequestParam MultipartFile input_image, RedirectAttributes rd) {
        book.setCreated(new Date());
        bookService.addBook(book);
        String folder_save_file = context.getRealPath("/resources/image/book");
        try {
            input_image.transferTo(new File(folder_save_file + File.separator + book.getId() + input_image.getOriginalFilename()));
            book.setImage("resources/image/book/" + book.getId() + input_image.getOriginalFilename());
            bookService.addBook(book);
        } catch (Exception e) {
            e.printStackTrace();
        }
        rd.addFlashAttribute("message", "Thêm sách thành công");
        return "redirect:/admin/book/manager";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id, RedirectAttributes rd) {
        bookService.deleteBook(id);
        rd.addFlashAttribute("message", "Xóa thành công!");
        return "redirect:/admin/book/manager";
    }
}
