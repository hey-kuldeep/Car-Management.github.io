package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        Connection conn = null;

        try {
            // Establish a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_login?user=root&password=Tiger@123");

            // Prepare SQL statement to check user credentials
            PreparedStatement  pstmt = conn.prepareStatement("SELECT * FROM signup WHERE userEmail=? AND userPassword=?");
            pstmt.setString(1, userEmail);
            pstmt.setString(2, userPassword);

            // Execute the query
            ResultSet  rs = pstmt.executeQuery();

            if (rs.next()) {
                // User exists, redirect to home page
                response.sendRedirect("home.jsp");
            } else {
                // User doesn't exist or password is incorrect, redirect back to login page
                response.sendRedirect("LogIn.html?error=invalid");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle any exceptions
            response.sendRedirect("LogIn.html?error=database");
        } finally {
            // Close the database resources
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
