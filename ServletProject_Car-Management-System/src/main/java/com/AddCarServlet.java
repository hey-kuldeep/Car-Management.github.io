package com;

import java.io.IOException;
import java.net.http.HttpClient;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addCar")
public class AddCarServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int CarId = Integer.parseInt(req.getParameter("CarId"));
		String CarModel = req.getParameter("CarModel");
		String CarBrand = req.getParameter("CarBrand");
		int CarPrice = Integer.parseInt(req.getParameter("CarPrice"));
		
		Connection conn = null;
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb?user=root&password=Tiger@123");
			PreparedStatement pst = conn.prepareStatement("INSERT INTO car VALUES(?,?,?,?)");
			pst.setInt(1, CarId);
			pst.setString(2, CarModel);
			pst.setString(3, CarBrand);
			pst.setInt(4, CarPrice);
			
			pst.execute();
			
			resp.sendRedirect("home.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
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
