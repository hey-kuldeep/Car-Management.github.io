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
@WebServlet("/savesUpdateCar")
public class SaveUpdateCarServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int carId = Integer.parseInt(req.getParameter("CarId"));
		String carModel = req.getParameter("CarModel");
		String carBand = req.getParameter("CarBrand");
		int carPrice = Integer.parseInt(req.getParameter("CarPrice"));

		Connection conn = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb","root","Tiger@123");

			PreparedStatement pst = conn.prepareStatement("UPDATE car set carModel=? , carBrand=? , carPrice=? where carId=?");
			pst.setString(1, carModel);
			pst.setString(2, carBand);
			pst.setInt(3, carPrice);
			pst.setInt(4, carId);
			pst.executeUpdate();

			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM car");
			ResultSet rs = pst1.executeQuery();

			req.setAttribute("carDetails", rs);
			RequestDispatcher rd = req.getRequestDispatcher("display.jsp");
			rd.forward(req, resp);

		} catch (SQLException | ClassNotFoundException e) {
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
			}
		}
	}
}
