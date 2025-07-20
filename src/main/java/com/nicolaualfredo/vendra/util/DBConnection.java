/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nicolaualfredo.vendra.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Nicolau Alfredo Responsible for managing DB connection using config
 * file
 */
public class DBConnection {

    private static final String CONFIG_PATH = "config/config.properties";

    public static Connection getConnection() throws SQLException, IOException {
        Properties props = new Properties();
        try (FileInputStream fis = new FileInputStream(CONFIG_PATH)) {
            props.load(fis);
        }

        String user = props.getProperty("user");
        String password = props.getProperty("password");
        String url = "jdbc:mysql://localhost:3306/vendra";

        return DriverManager.getConnection(url, user, password);
    }
}
