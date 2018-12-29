<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "dao.DangKyLamGiaSuDAO" %>
<%@ page import = "java.io.IOException" %>
<%@ page import ="java.io.PrintWriter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
    	
    	String username = request.getParameter("username");
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu?useSSL=false", "root", "12345678");
        PreparedStatement ps = con.prepareStatement("SELECT  * FROM TaiKhoan WHERE " +
                    " TaiKhoan.TenDangNhap = ?");
        ps.setString(1,request.getParameter("username"));
        
        System.out.println(" username la: " + request.getParameter("username"));
        
        ResultSet res = ps.executeQuery();
        if(res.first())
        	{
           out.print("Tên đăng nhập đã tồn tại!");
        	}
         
        }
    
	catch (Exception e)
		{
            System.out.println(e);  
        }
        
%>