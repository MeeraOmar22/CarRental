/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.util;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
        private static final String JDBC_URL = System.getenv("jdbc:mysql://localhost:3306/workshopdb");
    private static final String JDBC_USERNAME = System.getenv( "root");
    private static final String JDBC_PASSWORD = System.getenv("");

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Check if any required env variable is missing
        if (JDBC_URL == null || JDBC_USERNAME == null || JDBC_PASSWORD == null) {
            throw new SQLException("Missing DB environment variables. Make sure DB_URL, DB_USER, and DB_PASS are set.");
        }

        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Return the connection
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }
}