package com.book.read.repository;

import com.book.read.model.OrderDetail;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
    @Query("from OrderDetail o group by o.book_id order by sum (o.quantity) desc")
    Page<OrderDetail> getBestSeller(Pageable pageable);
}
