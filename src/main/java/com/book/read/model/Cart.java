package com.book.read.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private List<Item> itemList = new ArrayList<>();
    private Integer totalPrice;

    public void addItem(Book product, Integer quantity) {
        int index = exists(product.getId());
        if(index == -1) {
            this.itemList.add(new Item(product, quantity));
        } else {
            Item item = this.itemList.get(index);
            item.setQuantity(item.getQuantity() + quantity);
            this.itemList.set(index, item);
        }
    }

    public int exists(int productId) {
        int size = this.itemList.size();
        for(int i = 0; i < size; i++) {
            if(this.itemList.get(i).getBook().getId() == productId) {
                return i;
            }
        }
        return -1;
    }

    public int totalPrice() {
        int total = 0;
        for(Item item: this.itemList) {
            total += item.getBook().getPrice() * item.getQuantity();
        }
        return total;
    }
}

