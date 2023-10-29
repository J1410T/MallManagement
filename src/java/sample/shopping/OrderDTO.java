/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Date;

public class OrderDTO {

    private String id;
    private String address;
    private Date date;
    private String phone;
    private Double total;
    private String userID;

    public OrderDTO() {
    }

    public OrderDTO(String id, String address, Date date, String phone, Double total, String userID) {
        this.id = id;
        this.address = address;
        this.date = date;
        this.phone = phone;
        this.total = total;
        this.userID = userID;
    }

    public String getId() {
        return id;
    }

    public String getAddress() {
        return address;
    }

    public Date getDate() {
        return date;
    }

    public String getPhone() {
        return phone;
    }

    public Double getTotal() {
        return total;
    }

    public String getUserID() {
        return userID;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

}
