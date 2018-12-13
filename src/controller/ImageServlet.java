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

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mags=request.getParameter("maGS");
		System.out.println(mags);
		byte[] img = null;
		ServletOutputStream sos = null;
		String sql = "select HinhAnh from giasu where MaGS='"+mags+"'";
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

}
