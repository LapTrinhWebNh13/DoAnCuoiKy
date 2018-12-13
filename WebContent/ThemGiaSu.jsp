<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Trang Thêm Phụ Huynh</title>
	<%@ page import="dao.GiaSuDAOImpl"%>
	<%@ page import="model.GiaSu"%>
	<%@ page import="java.util.Date"%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/CSS_ThemPH.css">
</head>
<body>
	<%
		GiaSuDAOImpl giaSuDAO = new GiaSuDAOImpl();
	%>

	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-2">
			<a href="#" title="Trung tâm gia sư Trí Việt"><img
				src="image/logo.jpg" style="width: 140px; margin-top: 15px;"></a>
		</div>
		<div class="col-sm-8">
			<div id="header_right">
				<h2 class="text">BAN QUẢN TRỊ TRUNG TÂM TƯ VẤN VÀ DỊCH VỤ</h2>
				<h1 class="text">GIA SƯ TRÍ VIỆT</h1>
				<p class="text">Sự hài lòng của quý phụ huynh, học sinh, thầy cô
					và tất cả sinh viên - Là thành công của chúng tôi</p>
				<div class="hearder_icon">
					Hỗ trợ: 0987654321 <a href="#"><img
						src="image/icon-facebook.png"></a> <a href="#"><img
						src="image/icon-yahoo.png"></a> <a href="#"><img
						src="image/icon-sky.png"></a>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>

	</div>
	<h3 style="text-align: right; color: white">Xin chào Admin!!!!</h3>
	<a href="#" style="margin-left: 1050px; color: white">Thoát</a>
	<a href="#" style="margin-left: 20px; color: white">Đổi mật khẩu</a>
	<div id="menu" style="background-color: white">
		<br><br>
		<h3 style="text-align: center">THÔNG TIN GIA SƯ</h3>
		<div class="panel-body" style="margin-left: 100px">
		<%
			String maGS = request.getParameter("maGS");
			GiaSu gs = giaSuDAO.getGiaSu(maGS);
			if(maGS == null)
			{
		%>		
			<form action="GiaSuServlet?command=insert" id="FormDKTGS" method="post" enctype="multipart/form-data">
				<div class="row">
					<label for="hoten">Họ tên (<span class="red">*</span>)
					</label> <input type="text" name="txtHoTen" id="name"
						placeholder="Nguyễn Văn A" required>
				</div>
				<div class="row">
					<label for="hoten">Ngày sinh (<span class="red">*</span>)
					</label> <select name="txtNgay" style="width: 150px;">
						<option value="0">Ngày</option>
						<%
							for(int i=1;i<=31;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%
							}
						%>
					</select> 
					<select name="txtThang" style="width: 150px;">
						<option value="0">Tháng</option>
						<%
							for(int i=1;i<=12;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%
							}
						%>
					</select> <select name="txtNam" id="cbYear" style="width: 150px;">
						<option value="">Năm</option>
						<%
							for(int i=1950;i<=2018;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="row">
					<label for="diachi">Giới tính (<span class="red">*</span>)
					</label> <select name="txtGioiTinh">
						<option value="Nữ">Nữ</option>
						<option value="Nam">Nam</option>

					</select>
				</div>
				<div class="row">
					<label for="diachi">Địa chỉ (<span class="red">*</span>)
					</label> <input type="text" name="txtDiaChi" id="diachi"
						placeholder="Phường 13, Q.Tân Bình, TP.HCM" required>
				</div>
				<div class="row">
					<label for="dienthoai">Điện thoại (<span class="red">*</span>)
					</label> <input type="text" name="txtDienThoai" id="dienthoai"
						placeholder="0923456723" required maxlength="11"> <label
						for="email">Email (<span class="red">*</span>)
					</label> <input type="text" name="txtEmail" id="email"
						placeholder="abc@gmail.com" required>
				</div>

				<div class="row">
					<label for="">Giọng nói (<span class="red">*</span>)
					</label> <select name="txtGiongNoi">
						<option value="Miền Bắc">Miền Bắc</option>
						<option value="Miền Trung">Miền Trung</option>
						<option value="Miền Nam">Miền Nam</option>
					</select>
				</div>
				<div class="row">
					<label for="anhthe">Hình ảnh(<span class="red">*</span>)</label> 
					<input type="file" name="picHinhAnh" id="image" required="required">					
				</div>

				<div class="row">
					<label for="diachi">Nghề nghiệp (<span class="red">*</span>)</label> 
					<input name="txtNgheNghiep" type="text" required>
				</div>
				<div class="row">
					<label for="diachi">Ngành học (<span class="red">*</span>)</label> 
					<input name="txtNganhHoc" type="text" required>
				</div>
				<div class="row">
					<label for="diachi">Trình độ (<span class="red">*</span>)
					</label> <select name="txtTrinhDo">
						<option value='Cử nhân sư phạm'> Cử nhân sư phạm</option>
						<option value='svsp'> Sinh viên sư phạm</option>
						<option value='gv'> Giáo Viên</option>
						<option value='Sinh viên'> Sinh Viên</option>
						<option value='Cử nhân'> Cử Nhân</option>
						<option value='Thạc sỹ'> Thạc Sỹ</option>
						<option value='Tiến sỹ'> Tiến Sỹ</option>
						<option value='Kỹ sư'> Kỹ Sư</option>
						<option value='Bằng khác'> Bằng Khác</option>

					</select>
				</div>

				<div class="row">
					<label for="diachi">Lớp dạy (<span class="red">*</span>)
					</label> <input name="txtLopDay" type="text" required>
				</div>
				<div class="row">
					<label for="diachi">Môn dạy (<span class="red">*</span>)
					</label> <input name="txtMonDay" type="text" required>
				</div>
				<div class="row">
					<label for="diachi">Ưu điểm (<span class="red">*</span>)
					</label> <input name="txtUuDiem" type="text" required>
				</div>
				<div class="row">
					<label for="luongtt">Yêu cầu lương tối thiểu (<span
						class="red">*</span>)
					</label> <select name="txtLuongToiThieu">
						<option value="80">80</option>
						<option value="90">90</option>
						<option value="100">100</option>
						<option value="110">110</option>
						<option value="120">120</option>
						<option value="150">150</option>
						<option value="180">180</option>
						<option value="200">200</option>
						<option value="220">220</option>
						<option value="250">250</option>
					</select> <label for="ngandong">VNĐ/1 buổi</label>
				</div>
				<h4 style="text-align: center">TẠO TÀI KHOẢN LOGIN</h4>
				<div class="row">
					<label for="diachi">Tên đăng nhập (<span class="red">*</span>)</label> 
					<input name="txtTenDangNhap" type="text" required >
				</div>
				<div class="row">
					<label for="diachi">Mật khẩu (<span class="red">*</span>)</label> 
					<input name="txtMatKhau" type="text" required >
				</div>

				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<div class="submit">
								<input type="submit" value="LƯU">
							</div>
					</div>
				</div>
			</form>
			<%
				}
				else if(maGS != null)
				{
			%>
				<form action="GiaSuServlet?command=update&maGS=<%=maGS %>" name="DKTGS" id="FormDKTGS" method="post" enctype="multipart/form-data">
				<div class="row">
					<label for="hoten">Họ tên (<span class="red">*</span>)
					</label> <input type="text" name="txtHoTen" id="name"
						placeholder="Nguyễn Văn A" required value="<%=gs.getHoTen() %>">
				</div>
				<div class="row">
					<label for="hoten">Ngày sinh (<span class="red">*</span>)</label> 
					<select name="txtNgay" style="width: 150px;">
						<option>Ngày</option>
						<%
							for(int i=1;i<=31;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%
							}
						%>
					</select> 
					<select name="txtThang" style="width: 150px;">
						<option value="0">Tháng</option>
						<%
							for(int i=1;i<=12;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%
							}
						%>
					</select> <select name="txtNam" id="cbYear" style="width: 150px;">
						<option value="">Năm</option>
						<%
							for(int i=1950;i<=2018;i++){
						%>
						
						<option value="<%=i %>"><%=i %></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="row">
					<label for="diachi">Giới tính (<span class="red">*</span>)
					</label> <select name="txtGioiTinh">
						<option value="<%=gs.getGioiTinh() %>"><%=gs.getGioiTinh() %></option>						
						<option value="Nữ">Nữ</option>						
						<option value="Nam">Nam</option>
					</select>
				</div>
				<div class="row">
					<label for="diachi">Địa chỉ (<span class="red">*</span>)</label>
					<input type="text" name="txtDiaChi" id="diachi" placeholder="Phường 13, Q.Tân Bình, TP.HCM" required value="<%=gs.getDiaChi() %>">
				</div>
				<div class="row">
					<label for="dienthoai">Điện thoại (<span class="red">*</span>)</label> 
					<input type="text" name="txtDienThoai" id="dienthoai" placeholder="0923456723" required maxlength="11" value="<%=gs.getDienThoai() %>">
					<label for="email">Email (<span class="red">*</span>)</label> 
					<input type="text" name="txtEmail" id="email" placeholder="abc@gmail.com" required value="<%=gs.getEmail() %>">
				</div>

				<div class="row">
					<label for="">Giọng nói (<span class="red">*</span>)</label>
					<select name="txtGiongNoi">
						<option value="<%=gs.getGiongNoi() %>"><%=gs.getGiongNoi() %></option>
						<option value="Miền Bắc">Miền Bắc</option>
						<option value="Miền Trung">Miền Trung</option>
						<option value="Miền Nam">Miền Nam</option>			
					</select>
				</div>
				<div class="row">
					<label for="anhthe">Hình ảnh</label> 
					<input type="file" name="picHinhAnh" id="image" >
				</div>

				<div class="row">
					<label for="diachi">Nghề nghiệp (<span class="red">*</span>)</label> 
					<input name="txtNgheNghiep" type="text" required value="<%=gs.getNgheNghiep() %>">
				</div>
				<div class="row">
					<label for="diachi">Trình độ (<span class="red">*</span>)
					</label> <select name="txtTrinhDo">
						<option value="<%=gs.getTrinhDo() %>"> <%=gs.getTrinhDo() %></option>
						<option value="Cử nhân sư phạm"> Cử nhân sư phạm</option>
						<option value="Sinh viên sư phạm"> Sinh viên sư phạm</option>
						<option value="Giáo Viên"> Giáo Viên</option>
						<option value="Sinh Viên"> Sinh Viên</option>
						<option value="Cử nhân"> Cử Nhân</option>
						<option value="Thạc Sỹ"> Thạc Sỹ</option>
						<option value="Tiến Sỹ"> Tiến Sỹ</option>
						<option value="Kỹ Sư"> Kỹ Sư</option>
						<option value="Bằng Khác"> Bằng Khác</option>

					</select>
				</div>

				<div class="row">
					<label for="diachi">Lớp dạy (<span class="red">*</span>)</label> 
					<input name="txtLopDay" type="text" required value="<%=gs.getLopDay() %>">
				</div>
				<div class="row">
					<label for="diachi">Môn dạy (<span class="red">*</span>)</label> 
					<input name="txtMonDay" type="text" required value="<%=gs.getMonDay() %>">
				</div>
				<div class="row">
					<label for="diachi">Ưu điểm (<span class="red">*</span>)</label> 
					<input name="txtUuDiem" type="text" required value="<%=gs.getUuDiem() %>">
				</div>
				<div class="row">
					<label for="luongtt">Yêu cầu lương tối thiểu (<span class="red">*</span>)</label> 
					<select name="txtLuongToiThieu">
						<option value="<%=gs.getLuongYauCauToiThieu() %>"><%=gs.getLuongYauCauToiThieu() %></option>
						<option value="80">80</option>
						<option value="90">90</option>
						<option value="100">100</option>
						<option value="110">110</option>
						<option value="120">120</option>
						<option value="150">150</option>
						<option value="180">180</option>
						<option value="200">200</option>
						<option value="220">220</option>
						<option value="250">250</option>
					</select> <label for="ngandong">VNĐ/1 buổi</label>
				</div>
				

				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<div class="submit">
								<input type="submit" value="LƯU">
							</div>
					</div>
				</div>
			</form>
				
			<%
				}
			%>
		</div>

	</div>

	<script>
			function myFunction() {
			    var x = document.getElementById("myFile").form.id;
			    document.getElementById("demo").innerHTML = x;
			}
			</script>
	

</body>
<script type="text/javascript">
    function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

	document.getElementById("defaultOpen").click();
</script>
</html>