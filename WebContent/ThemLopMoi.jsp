<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Trang Thêm Lớp</title>
	<%@ page import="dao.PhuHuynhDAOImpl"%>
	<%@ page import="model.PhuHuynh"%>
	<%@ page import="dao.LopDAOImpl"%>
	<%@ page import="model.Lop"%>
	<%@ page import="java.util.Date"%>
	<%@ page import = "java.util.*" %>
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
		<br>
		<br>
		<h3 style="text-align: center">THÔNG TIN LỚP MỚI </h3>
		<div class="panel-body" style="margin-left: 100px">
		<%
			String maLop = request.getParameter("maLop");
	  		Lop lop = new LopDAOImpl().getLop(maLop);
	  		if(maLop == null)
	  		{	
		%>
			<form action="LopServlet?command=insert&maLop=<%=request.getParameter("maLop") %>" id="FormDKTGS" method="post" >
				<div class="row">
					<label for="monhoc">Mã phụ huynh (<span class="red">*</span>)</label> 
					<input type="text" list="dsMaPH" name="txtMaPH" id="monhoc" required>
				</div>
				<%
					Set<String> dsMaPH = new PhuHuynhDAOImpl().getDanhSachTheoMaPH();
				%>
				<datalist id="dsMaPH">
				<%
					 for (String a : dsMaPH) {
				%>
					<option value="<%=a%>"><%=a%></option>
				<%
					}
				%>
				</datalist>
				
				<div class="row">
					<label for="lop">Lớp dạy(<span class="red">*</span>)</label> 
					<select name="txtLopDay">
						<option value="Lớp 1">Lớp 1</option>
						<option value="Lớp 2">Lớp 2</option>
						<option value="Lớp 3">Lớp 3</option>
						<option value="Lớp 4">Lớp 4</option>
						<option value="Lớp 5">Lớp 5</option>
						<option value="Lớp 6">Lớp 6</option>
						<option value="Lớp 7">Lớp 7</option>
						<option value="Lớp 8">Lớp 8</option>
						<option value="Lớp 9">Lớp 9</option>
						<option value="Lớp 10">Lớp 10</option>
						<option value="Lớp 11">Lớp 11</option>
						<option value="Lớp 12">Lớp 12</option>
						<option value="Lớp ngoại ngữ">Lớp ngoại ngữ</option>
						<option value="Lớp tin học">Lớp ngoại ngữ</option>
						<option value="Ôn đại học">Ôn đại học</option>
						<option value="Lớp năng khiếu">Lớp năng khiếu</option>
					</select>
				</div>
				<div class="row">
					<label for="monhoc">Môn dạy (<span class="red">*</span>)</label> 
					<input type="text" name="txtMonDay" id="monhoc"placeholder="Ví dụ: toán, lý, hóa..." required>
				</div>
				<div class="row">
					<label for="soluonghs">Số lượng học sinh (<span class="red">*</span>)</label> 
					<input type="text" name="txtSoLuongHS" id="soluonghs" required>
				</div>
				<div class="row">
					<label for="hocluchientai">Học lực hiện tại (<span
						class="red">*</span>)
					</label> <input type="text" name="txtHocLucHienTai" id="hocluchientai" required>
				</div>
				<div class="row">
					<label for="sobuoi">Số buổi (<span class="red">*</span>) </label> 
					<select name="txtSoBuoi" required>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select> 
					<label for="tuan" class="tuan">buổi/tuần</label>
				</div>
				<div class="row">
					<label for="thoigianhoc">Thời gian (<span class="red">*</span>)</label> 
					<input type="text" name="txtThoiGian" id="thoigianhoc" placeholder="Ví dụ: T2-T4-T6; 17h-19h" required>
				</div>
				<div class="row">
					<label for="thoigianhoc">Địa chỉ (<span class="red">*</span>)</label> 
					<input type="text" name="txtDiaChi" id="thoigianhoc" placeholder="Ví dụ: T2-T4-T6; 17h-19h" required>
				</div>
				<div class="row">
					<label for="yeucau">Yêu cầu (<span class="red">*</span>)</label> 
					<select name="txtYeuCau" class="yeucau" required>
						<option value="Sinh viên nam">Sinh viên nam</option>
						<option value="Sinh viên nữ">Sinh viên nữ</option>
						<option value="Giáo viên nam">Giáo viên nam</option>
						<option value="Giáo viên nữ">Giáo viên nữ</option>
						<option value="Cử nhân nữ">Cử nhân nữ</option>
						<option value="Cử nhân nam">Cử nhân nam</option>
						<option value="Thạc sĩ nam">Thạc sĩ nam</option>
						<option value="Thạc sĩ nữ">Thạc sĩ nữ</option>
						<option value="Tiến sĩ nam">Tiến sĩ nam</option>
						<option value="Tiến sĩ nữ">Tiến sĩ nữ</option>
					</select>
				</div>
				<div class="row">
					<label for="luong">Lương(<span class="red">*</span>)</label> 
					<input type="text" name="txtLuong" id="luong" required>
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
		  		else if(maLop != null)
		  		{
			%>
	
				<form action="LopServlet?command=update&maLop=<%=request.getParameter("maLop") %>" id="FormDKTGS" method="post" >
				<div class="row">
					<label for="monhoc">Mã phụ huynh (<span class="red">*</span>)</label> 
					<input type="text" list="dsMaPH" name="txtMaPH" id="monhoc" required value="<%=lop.getMaPH() %>">
				</div>
				<%
					Set<String> dsMaPH = new PhuHuynhDAOImpl().getDanhSachTheoMaPH();
				%>
				<datalist id="dsMaPH">
				<%
					 for (String a : dsMaPH) {
				%>
					<option value="<%=a%>"><%=a%></option>
				<%
					}
				%>
				</datalist>
				
				<div class="row">
					<label for="lop">Lớp dạy(<span class="red">*</span>)</label> 
					<select name="txtLopDay">
						<option value="<%=lop.getLopDay() %>"><%=lop.getLopDay() %></option>
						<option value="Lớp 1">Lớp 1</option>
						<option value="Lớp 2">Lớp 2</option>
						<option value="Lớp 3">Lớp 3</option>
						<option value="Lớp 4">Lớp 4</option>
						<option value="Lớp 5">Lớp 5</option>
						<option value="Lớp 6">Lớp 6</option>
						<option value="Lớp 7">Lớp 7</option>
						<option value="Lớp 8">Lớp 8</option>
						<option value="Lớp 9">Lớp 9</option>
						<option value="Lớp 10">Lớp 10</option>
						<option value="Lớp 11">Lớp 11</option>
						<option value="Lớp 12">Lớp 12</option>
						<option value="Lớp ngoại ngữ">Lớp ngoại ngữ</option>
						<option value="Lớp tin học">Lớp ngoại ngữ</option>
						<option value="Ôn đại học">Ôn đại học</option>
						<option value="Lớp năng khiếu">Lớp năng khiếu</option>
					</select>
				</div>
				<div class="row">
					<label for="monhoc">Môn dạy (<span class="red">*</span>)</label> 
					<input type="text" name="txtMonDay" id="monhoc"placeholder="Ví dụ: toán, lý, hóa..." required value="<%=lop.getMonDay() %>" >
				</div>
				<div class="row">
					<label for="soluonghs">Số lượng học sinh (<span class="red">*</span>)</label> 
					<input type="text" name="txtSoLuongHS" id="soluonghs" required value="<%=lop.getSoLuongHS() %>">
				</div>
				<div class="row">
					<label for="hocluchientai">Học lực hiện tại (<span
						class="red">*</span>)
					</label> <input type="text" name="txtHocLucHienTai" id="hocluchientai" required value="<%=lop.getHocLucHienTai() %>">
				</div>
				<div class="row">
					<label for="sobuoi">Số buổi (<span class="red">*</span>) </label> 
					<select name="txtSoBuoi" required>
						<option value="<%=lop.getSoBuoi() %>"><%=lop.getSoBuoi() %></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select> 
					<label for="tuan" class="tuan">buổi/tuần</label>
				</div>
				<div class="row">
					<label for="thoigianhoc">Thời gian (<span class="red">*</span>)</label> 
					<input type="text" name="txtThoiGian" id="thoigianhoc" placeholder="Ví dụ: T2-T4-T6; 17h-19h" required value="<%=lop.getThoiGianDay() %>">
				</div>
				<div class="row">
					<label for="thoigianhoc">Địa chỉ (<span class="red">*</span>)</label> 
					<input type="text" name="txtDiaChi" id="thoigianhoc" placeholder="Ví dụ: 01-Võ Văn Ngân- Thủ Đức- TPHCM" required value="<%=lop.getDiaChi() %>">
				</div>
				<div class="row">
					<label for="yeucau">Yêu cầu (<span class="red">*</span>)</label> 
					<select name="txtYeuCau" class="yeucau" required>
						<option value="<%=lop.getYeuCau() %>"><%=lop.getYeuCau() %></option>
						<option value="Sinh viên nam">Sinh viên nam</option>
						<option value="Sinh viên nữ">Sinh viên nữ</option>
						<option value="Giáo viên nam">Giáo viên nam</option>
						<option value="Giáo viên nữ">Giáo viên nữ</option>
						<option value="Cử nhân nữ">Cử nhân nữ</option>
						<option value="Cử nhân nam">Cử nhân nam</option>
						<option value="Thạc sĩ nam">Thạc sĩ nam</option>
						<option value="Thạc sĩ nữ">Thạc sĩ nữ</option>
						<option value="Tiến sĩ nam">Tiến sĩ nam</option>
						<option value="Tiến sĩ nữ">Tiến sĩ nữ</option>
					</select>
				</div>
				<div class="row">
					<label for="luong">Lương(<span class="red">*</span>)</label> 
					<input type="text" name="txtLuong" id="luong" required value="<%=lop.getLuong() %>">
				</div>

				<div class="row">
					<label for="luong">Mức phí(<span class="red">*</span>)</label> 
					<input type="text" name="txtMucPhi" id="luong" required value="<%=lop.getMucPhi() %>">
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

</html>