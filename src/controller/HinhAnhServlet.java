package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import connect.DBConnect;


@WebServlet("/HinhAnhServlet")
public class HinhAnhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mags=request.getParameter("maGS");
		System.out.println("load hinh anh "+mags);
		byte[] img = null;
		ServletOutputStream sos = null;
		String sql = "select HinhAnh from GiaSu where MaGS='"+mags+"'";
		try
		{
			Connection conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				img = rs.getBytes(1);
			}
			sos = response.getOutputStream();
			sos.write(img);
		}
		catch(Exception e)
		{
			
		}
	}
    public HinhAnhServlet() {
       super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
