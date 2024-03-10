package com;

import java.io.IOException;
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
@WebServlet("/DeleteCar")
public class Delete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int carId = Integer.parseInt(req.getParameter("CarId"));
		
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb","root","Tiger@123");
			
			PreparedStatement pst = conn.prepareStatement("Delete from car where CarId=?");
			pst.setInt(1, carId);
			pst.executeUpdate();
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM car");
			  ResultSet rs = pst1.executeQuery();
			  
			  req.setAttribute("carDetails", rs);
			  RequestDispatcher rd = req.getRequestDispatcher("display.jsp");
			  rd.forward(req, resp);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally {
					if (conn!= null) {
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
		
	}
}
