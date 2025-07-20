/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nicolaualfredo.vendra.dao;

import java.util.ArrayList;

/**
 *
 * @author Nicolau Alfredo
 */
public interface GenericDAO<V> {

    // Saves a new entity in the database
    void save(V v);

    // Updates an existing entity
    void update(V v);

    // Deletes an entity
    void delete(V v);

    // Finds an entity by its primary key
    V findById(Integer id);

    // Returns all entities of this type
    ArrayList<V> findAll();
}
