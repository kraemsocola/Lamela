/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.*;
import java.sql.Date;

/**
 *
 * @author hp
 */
public class Product {
    /*
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [category_id] int,
  [title] varchar(250),
  [color] varchar(20),
  [capacity] varchar(10),
  [model] varchar(20),
  [ram] varchar(10),
  [size] varchar(10),
  [price] int,
  [discount] int,
  [thumbnail] text,
  [description] text,
*/
    
    private String title,thumbnail,description;
    private int id,price,quantity;    
    private Category category; 
    private Galery galery;
    private Ram ram;
    private Size size;
    private Color color;
    private Capacity capacity;
    private Model model;

    public Product() {
    }

    public Product(String title, String thumbnail, String description, int id, int price, int quantity, Category category, Galery galery, Ram ram, Size size, Color color, Capacity capacity, Model model) {
        this.title = title;
        this.thumbnail = thumbnail;
        this.description = description;
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.galery = galery;
        this.ram = ram;
        this.size = size;
        this.color = color;
        this.capacity = capacity;
        this.model = model;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Galery getGalery() {
        return galery;
    }

    public void setGalery(Galery galery) {
        this.galery = galery;
    }

    public Ram getRam() {
        return ram;
    }

    public void setRam(Ram ram) {
        this.ram = ram;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Capacity getCapacity() {
        return capacity;
    }

    public void setCapacity(Capacity capacity) {
        this.capacity = capacity;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }   
    
}
