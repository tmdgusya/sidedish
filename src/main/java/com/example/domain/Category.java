package com.example.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.relational.core.mapping.MappedCollection;
import org.springframework.data.relational.core.mapping.Table;

import java.util.ArrayList;
import java.util.List;

@Table(value = "CATEGORY")
public class Category {

    @Id
    private final Long id;

    private final String name;

    @MappedCollection(idColumn = "CATEGORY_ID", keyColumn = "CATEGORY_KEY")
    private List<Item> items = new ArrayList<>();

    @PersistenceConstructor
    private Category(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public static Category of(String name) {
        return new Category(null, name);
    }

    public void addItem(Item item) {
        if(!items.contains(item)) {
            this.items.add(item);
        }
    }

    public Item findItem(String id){
        for(Item item : items){
            if(item.getId().equals(id)){
                return item;
            }
        }
        return null;
    }

    public void removeItem(Item item) {
        System.err.println(this.items.remove(item));
        System.err.println(item.getId());
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Item> getItems() {
        return items;
    }

    public void update(List<Item> newitemList){
        this.items = newitemList;
    }

}
