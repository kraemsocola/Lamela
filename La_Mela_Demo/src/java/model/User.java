/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hp
 */
public class User {

    String fullname, email, phone_number, address, password;
    int role_id,id;
    Role role;
    int quantity;

    public User() {
    }

    public User(String fullname, String email, String phone_number, String address, String password, int role_id, int id, Role role, int quantity) {
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.role_id = role_id;
        this.id = id;
        this.role = role;
        this.quantity = quantity;
    }

    
    
    public User(String fullname, String email, String phone_number, String address, String password, int role_id, int id, Role role) {
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.role_id = role_id;
        this.id = id;
        this.role = role;
    }

    public User(String fullname, String email, String phone_number, String address, String password, int role_id, Role role) {
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.role_id = role_id;
        this.role = role;
    } 

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

}
