package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signUp")
public class UserSignUp extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve user input from request parameters
		String userName = req.getParameter("name");
		String userEmail = req.getParameter("email");
		String userPassword = req.getParameter("password");

		// Validate input data (e.g., check for empty fields, validate email format, etc.)
		if (userName == null || userEmail == null || userPassword == null || userName.isEmpty() || userEmail.isEmpty() || userPassword.isEmpty()) {
			// Handle invalid input (e.g., show error message)
			resp.sendRedirect("signup.jsp?error=Please fill in all fields");
			return;
		}

		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_login?user=root&password=Tiger@123");
			PreparedStatement pst = conn.prepareStatement("INSERT INTO signup VALUES (?, ?, ?)");
			pst.setString(1, userName);
			pst.setString(2, userEmail);
			pst.setString(3, userPassword);

			// Execute the query
			pst.execute();

			
			resp.sendRedirect("home.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// Log the exception
			e.printStackTrace();
		} finally {
			// Close the connection in the finally block
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
}


