/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nicolaualfredo.vendra.model;

import java.math.BigDecimal;

/**
 *
 * @author Nicolau Alfredo
 */
public class SalesItems {

    private int id;
    private SalesItems salesItems;
    private Products products;
    private int quantity;
    private BigDecimal unitPrice;
    private BigDecimal subtotal;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SalesItems getSalesItems() {
        return salesItems;
    }

    public void setSalesItems(SalesItems salesItems) {
        this.salesItems = salesItems;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }
    
    
}
