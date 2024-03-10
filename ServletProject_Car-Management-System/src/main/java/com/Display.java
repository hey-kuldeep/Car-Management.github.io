package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/displayCar")
public class Display extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");


			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb?user=root&password=Tiger@123");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM car");
			ResultSet rs = pst.executeQuery();

			req.setAttribute("carDetails",rs);
			RequestDispatcher rd = req.getRequestDispatcher("display.jsp");
			rd.forward(req, resp);

			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

}




