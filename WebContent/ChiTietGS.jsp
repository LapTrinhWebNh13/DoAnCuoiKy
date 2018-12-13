<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>THÔNG TIN CHI TIẾT GIA SƯ</title>
	<%@ page import = "connect.DBConnect" %>
	<%@ page import = "dao.GiaSuDAOImpl" %>
	<%@ page import = "model.GiaSu" %>
	<%@ page import = "dao.LopDAOImpl" %>
	<%@ page import = "model.Lop" %>
	<%@ page language="java" %>
	<%@ page import = "java.io.*" %>
	<%@ page import = "java.sql.*" %>
	<%@ page import = "java.util.*" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	<link rel="stylesheet" type="text/css" href="css/CSS_ThemPH.css">
</head>
<body>

		
		
		<div class="row">
			<div class="col-sm-1">

			</div>
			<div class="col-sm-2">
				<a href="#" title="Trung tâm gia sư Trí Việt"><img src="image/logo.jpg" style="width: 140px;margin-top: 15px; "></a>
			</div>
			<div class="col-sm-8">
				<div id="header_right">
					<h2 class="text">BAN QUẢN TRỊ TRUNG TÂM TƯ VẤN VÀ DỊCH VỤ</h2>
					<h1 class="text">GIA SƯ TRÍ VIỆT</h1>
					<p class="text">Sự hài lòng của quý phụ huynh, học sinh, thầy cô và tất cả sinh viên - Là thành công của chúng tôi</p>
					<div class="hearder_icon">
						Hỗ trợ: 0987654321
						<a href="#"><img src="image/icon-facebook.png"></a>
						<a href="#"><img src="image/icon-yahoo.png"></a>
						<a href="#"><img src="image/icon-sky.png"></a>
					</div>		
				</div>
			</div>
			<div class="col-sm-1">

			</div>
			
		</div>
	<h3 style="text-align: right;color: white">Xin chào Admin!!!!</h3>
	<a href="#" style="margin-left: 1050px;color: white">Thoát</a>
	<a href="#" style="margin-left: 20px;color: white" >Đổi mật khẩu</a>
	<div id="menu"
		style="background-color: #dddddd; margin-left: 50px; margin-top: 10px">
		<div id="main" style="background-color: white">
		<br>
			<h2 style="text-align: center">THÔNG TIN CHI TIẾT CỦA GIA SƯ</h2>
			<div class="panel-body">
				<div class="col-lg-1"></div>
				<div class="col-lg-8">
					<%
						GiaSu gs = new GiaSuDAOImpl().getGiaSu(request.getParameter("maGS"));
					%>
					<table>
						<tr >
							<td><b>Mã gia sư:</b></td>
							<td style="margin-left: 10px;"><%=gs.getMaGS() %></td>
						</tr>
						<tr>
							<td><b>Họ và tên:</b></td>
							<td style="margin-left: 10px;"><%=gs.getHoTen() %></td>
						</tr>
						<tr>
							<td><b>Ngày sinh:</b></td>
							<td style="margin-left: 10px;"><%=gs.getNgaySinh() %></td>
						</tr>
						<tr >
							<td><b>Giới tính:</b></td>
							<td style="margin-left: 10px;"><%=gs.getGioiTinh() %></td>
						</tr>
						<tr >
							<td><b>Địa chỉ:</b></td>
							<td style="margin-left: 10px;"><%=gs.getDiaChi() %></td>
						</tr>
						<tr >
							<td><b>Giọng nói:</b></td>
							<td style="margin-left: 10px;"><%=gs.getGiongNoi() %></td>
						</tr>
						<tr>
							<td><b>Điện thoại:</b></td>
							<td style="margin-left: 10px;"><%=gs.getDienThoai() %></td>
						</tr>
						<tr>
							<td><b>Nghề nghiệp:</b></td>
							<td style="margin-left: 10px;"><%=gs.getNgheNghiep() %></td>
						</tr>
						
						<tr>
							<td><b>Lớp dạy:</b></td>
							<td style="margin-left: 10px;"><%=gs.getLopDay() %></td>
						</tr>
						<tr>
							<td><b>Môn dạy:</b></td>
							<td style="margin-left: 10px;"><%=gs.getMonDay() %></td>
						</tr>
						<tr >
							<td><b>Ưu điểm:</b></td>
							<td style="margin-left: 10px;"><%=gs.getUuDiem() %></td>
						</tr>
						<tr>
							<td><b>Yêu cầu lương:</b></td>
							<td style="margin-left: 10px;"><%=gs.getLuongYauCauToiThieu() %>VNĐ</td>
						</tr>
						
					</table>
				</div>
				<div class="col-lg-2">
					<img src="./ImageServlet?maGS=<%=request.getParameter("maGS") %>" style="width: 100%">

				</div>
				<br>
				<br>
			</div>
			<%
				ArrayList<Lop> dsLopDaDay = new GiaSuDAOImpl().getLopDaDay(request.getParameter("maGS"));
			%>
			<h3 style="text-align: center">DANH SÁCH CÁC LỚP ĐÃ ĐĂNG KÝ DẠY</h3>
			<table border="1" width="100%">
				<tr style="height: 30px;">
					<td style="text-align: center;"><b>Mã lớp</b></td>
					<td style="text-align: center;"><b>Lớp</b></td>
					<td style="text-align: center;"><b>Môn</b></td>
					<td style="text-align: center;"><b>Thời gian</b></td>
					<td style="text-align: center;"><b>Địa chỉ</b></td>
				</tr>
				<%
					for(int i=0; i<dsLopDaDay.size();i++)
					{
				%>
				<tr style="height: 30px;">
					<td><p style="margin-left: 10px;"><%=dsLopDaDay.get(i).getMaLop() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopDaDay.get(i).getLopDay() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopDaDay.get(i).getMonDay() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopDaDay.get(i).getThoiGianDay() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopDaDay.get(i).getDiaChi() %></p></td>
				</tr>
				<%
					}
				%>
			</table>
			<br>
		<br>
		</div>
		
	</div>




</body>

</html>