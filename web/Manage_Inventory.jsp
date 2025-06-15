<%-- 
    Document   : Manage_Inventory
    Created on : 23 Apr 2025, 11:30:32 AM
    Author     : ASYIQDANIAL
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Inventory</title>
    <style>
    
        body {
            background: url('gtr.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .welcome {
            background: url('honeycomb.jpg') no-repeat center center fixed;
            text-align: center;
            padding: 30px;
            background-color: #0056b3;
            color: white;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #89cff0;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
         nav {
        background-color: black; /* Set the nav bar color to black */
        padding: 10px;
    }
    ul.nav {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
    }
    ul.nav li {
        margin-right: 20px;
    }
    ul.nav a {
        color: white; /* Ensure links in nav bar are white */
        text-decoration: none;
        padding: 10px;
    }
    ul.nav a:hover {
        color: lightgray; /* Change link color on hover */
    }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }
        th {
            background-color: #1100bb;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        form {
            display: inline;
        }
        button {
            background-color: #1100bb;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 3px;
        }
        button:hover {
            background-color: #1100bb;
        }
    </style>
</head>
<body>
    <nav>
        <ul class="nav">
            <li><a href="Homepage.jsp">Home</a></li>
            <li><a href="Booking_Appoiment.jsp">Booking</a></li>
            <li><a href="Contact.jsp">Contact</a></li>
            <li><a href="Inventory.jsp">Maintainance</a></li>
            <li><a href="StartLogin.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Manage Inventory</h1>
        <table>
            <thead>
                <tr>
                    <th>Sparepart ID</th>
                    <th>Sparepart Name</th>
                    <th>Quantity In Stock</th>
                    <th>Supplier ID</th>
                    <th>Price</th>
                    <th>Sparepart Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String DB_URL = "jdbc:mysql://localhost:3306/workshopdb";
                    String DB_USERNAME = "root";
                    String DB_PASSWORD = "";
                    String query = "SELECT part_id, part_name, quantity_in_stock, supplier_id, price, part_type FROM inventory";

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getInt("part_id") %></td>
                                <td><%= rs.getString("part_name") %></td>
                                <td><%= rs.getString("quantity_in_stock") %></td>
                                <td><%= rs.getString("supplier_id") %></td>
                                <td><%= rs.getString("price") %></td>
                                <td><%= rs.getString("part_type") %></td>
                                <td>
                                    <form action="UpdateInventory.jsp" method="post" style="display:inline;">
                                        <input type="hidden" name="part_id" value="<%= rs.getInt("part_id") %>">
                                        <button type="submit">Update</button>
                                    </form>
                                    <form action="DeleteInventory.jsp" method="post" style="display:inline;">
                                        <input type="hidden" name="part_id" value="<%= rs.getInt("part_id") %>">
                                        <button type="submit">Delete</button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>