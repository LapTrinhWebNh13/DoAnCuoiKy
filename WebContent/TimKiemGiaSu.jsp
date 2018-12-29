<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%-- <%@ page import = "dao.TimKiemGiaSuDAO" %> --%>
<%@ page import = "model.GiaSu" %>
<%@ page import = "java.util.ArrayList"%>;
<%@ page import = "java.io.IOException" %>
<%@ page import ="java.io.PrintWriter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
    	ArrayList<GiaSu> getListGS = new ArrayList<>();
    	String trinhdo = request.getParameter("trinhdo");
		String luong = request.getParameter("luong");
		String gioitinh = request.getParameter("gioitinh");
		System.out.println("asda");
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu?useSSL=false", "root", "12345678");
    	PreparedStatement ps=null;
    	if(trinhdo.equals("Trình độ"))
		{
    		System.out.println("asda sai td");
			if(luong.equals("Lương tối thiểu"))
			{
				System.out.println("asda sai ltt");
				if(gioitinh.equals("Giới tính"))
				{
					System.out.println("asda sai th1");
					ps = con.prepareStatement("SELECT  * FROM GiaSu ");
					
					
				}
				else
				{
					System.out.println("asda sai th2");
					ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
		                    " GioiTinh = ?");
					ps.setString(1,request.getParameter("gioitinh"));
					
				}
			}
			else
			{

				if(!gioitinh.equals("Giới tính"))
				{
					ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
		                    " LuongYeuCauToiThieu = ? and GioiTinh = ?");
					ps.setString(1,request.getParameter("luong"));
					ps.setString(2,request.getParameter("gioitinh"));
				}
				else
				{
					ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
		                    " LuongYeuCauToiThieu = ?");
					ps.setString(1,request.getParameter("luong"));
				}
			}
			
		}
    	else
    	{
    		if(!luong.equals("Lương tối thiểu"))
    		{
    			if(!gioitinh.equals("Giới tính"))
    			{
    				ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
    	                    " TrinhDo = ? and LuongYeuCauToiThieu=? and GioiTinh=?");
    				ps.setString(1,request.getParameter("trinhdo"));
    				ps.setString(2,request.getParameter("luong"));
    				ps.setString(3,request.getParameter("gioitinh"));
    			}
    			else
    			{
    				ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
    	                    " TrinhDo = ? and LuongYeuCauToiThieu=?");
    				ps.setString(1,request.getParameter("trinhdo"));
    				ps.setString(2,request.getParameter("luong"));
    				
    			}
    		}
    		else
    		{
    			if(!gioitinh.equals("Giới tính"))
    			{
    				ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
    	                    " TrinhDo = ? and GioiTinh=?");
    				ps.setString(1,request.getParameter("trinhdo"));
    				
    				ps.setString(2,request.getParameter("gioitinh"));
    			}
    			else
    			{
    				ps = con.prepareStatement("SELECT  * FROM GiaSu WHERE " +
                            " TrinhDo = ?");
        			ps.setString(1,request.getParameter("trinhdo"));
    			}
    			
    		}
    		
    	}
    	System.out.println("asda sai 1");
        ResultSet res = ps.executeQuery();
        System.out.println("asda sai 2");
        while(res.next())
        	{
        	GiaSu gs =new GiaSu();
         	gs.setMaGS(res.getString("MaGS"));
         	gs.setHoTen(res.getString("HoTen"));
         	gs.setNgaySinh(res.getString("NgaySinh"));
         	gs.setGioiTinh(res.getString("GioiTinh"));
         	gs.setDiaChi(res.getString("DiaChi"));
         	gs.setDienThoai(res.getString("DienThoai"));
         	//gs.setGiongNoi(res.getString("GiongNoi"));
         	gs.setHinhAnh(res.getBytes("HinhAnh"));
         	//gs.setNganhHoc(res.getString("NganhHoc"));
         	//gs.setTrinhDo(res.getString("TrinhDo"));
         	gs.setNgheNghiep(res.getString("NgheNghiep"));
         	gs.setUuDiem(res.getString("UuDiem"));
         	gs.setMonDay(res.getString("MonDay"));
         	gs.setLopDay(res.getString("LopDay"));
         	gs.setLuongYauCauToiThieu(res.getFloat("LuongYeuCauToiThieu"));
         	//gs.setEmail(res.getString("Email"));
         	
         	getListGS.add(gs);
        	}
        out.print(getListGS);
        System.out.println("asda " + getListGS.toString());

        }
    
	catch (Exception e)
		{
            System.out.println(e);  
        }
        
%>