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
    	
    	String username = request.getParameter("dienthoai");
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu?useSSL=false", "root", "12345678");
        PreparedStatement ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
                    " GiaSu.DienThoai = ?");
        ps.setString(1,request.getParameter("dienthoai"));
        
        System.out.println(" dienthoai la: " + request.getParameter("dienthoai"));
        
        ResultSet res = ps.executeQuery();
        if(res.first())
        	{
           out.print("Số điện thoại đã tồn tại!");
           System.out.println(" dienthoaiiiiii la: " + request.getParameter("dienthoai"));
        	}
        
        }
    
	catch (Exception e)
		{
            System.out.println(e);  
        }
        
%>