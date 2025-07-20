/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestDAO;

import com.nicolaualfredo.vendra.util.DBConnection;
import java.sql.Connection;

/**
 *
 * @author Nicolau Alfredo
 */
public class ConnectionTest {

    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("Connection successful: " + (conn != null));
        } catch (Exception e) {
            System.err.println("Connection failed: " + e.getMessage());
        }
    }
}
