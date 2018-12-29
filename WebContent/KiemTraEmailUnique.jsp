<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "dao.DangKyTimGiaSuDAO" %>
<%@ page import = "java.io.IOException" %>
<%@ page import ="java.io.PrintWriter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
    	
    	String username = request.getParameter("email");
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu?useSSL=false", "root", "12345678");
        PreparedStatement ps = con.prepareStatement("SELECT  * FROM PhuHuynh WHERE " +
                    " PhuHuynh.Email = ?");
        ps.setString(1,request.getParameter("email"));
        
        System.out.println(" email la: " + request.getParameter("email"));
        
        ResultSet res = ps.executeQuery();
        if(res.first())
        	{
           out.print("Email đã tồn tại!");
           System.out.println(" emaillllll la: " + request.getParameter("email"));
        	}
          /* else
        	{
               out.print("Email thỏa mãn!");
        	}  */ 
        }
    
	catch (Exception e)
		{
            System.out.println(e);  
        }
        
%>