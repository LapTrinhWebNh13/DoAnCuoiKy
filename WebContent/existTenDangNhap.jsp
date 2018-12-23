<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Test here</title>
    </head>
    <body>
        <%
        String command = request.getParameter("command");
        try {
			switch(command)
			{
			case "new":
				try {
		        	Class.forName("com.mysql.jdbc.Driver");
		            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu", "root", "phuc123");
		            PreparedStatement ps = con.prepareStatement("SELECT  * FROM TAIKHOAN WHERE TenDangNhap = ?");
		            ps.setString(1, request.getParameter("txtTenDangNhap"));
		            ResultSet res = ps.executeQuery();
		            if (res.next()) {
		                out.print("Tên đăng nhập đã tồn tại!! Vui lòng nhập lại");
		            } else {
		            	//out.print("hợp lệ");
		            }
		        } catch (Exception e) {
		            System.out.println(e);
		        }
				break;
			case "DKLop":
				try {
		        	Class.forName("com.mysql.jdbc.Driver");
		            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu", "root", "phuc123");
		            PreparedStatement ps = con.prepareStatement("select * from DANGKY dk, TAIKHOAN tk where dk.MaGS=tk.MaTaiKhoan and tk.TenDangNhap= ?");
		            ps.setString(1, request.getParameter("txtTenDangNhap"));
		            ResultSet res = ps.executeQuery();
		            if (res.next()) {
		                out.print("Bạn đã đăng ký lớp này!!!");
		            } else {
		            	//out.print("hợp lệ");
		            }
		        } catch (Exception e) {
		            System.out.println(e);
		        }
				break;
			
			}
        } catch (Exception e) {
            System.out.println(e);
        } 
		
        %>
    </body>
</html>