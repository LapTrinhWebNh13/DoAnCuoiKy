<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ page import = "dao.DangKyLamGiaSuDAO" %>
	<%@ page import = "dao.DNDKLamGiaSuDAO" %>
	<%@ page import = "dao.GiaSuTieuBieu1DAO" %>
	<%@ page import = "model.GiaSu" %>
	<%@ page import = "model.Lop" %>
	<%@ page import = "java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DNDangKyLamGiaSu</title>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/CSS_DKLGS.css">
	
	
	
	<!-- kiem tra dinh dang mat khau -->
	<script type="text/javascript">
	function checkPassword(str)
	{

	//cach 1:	var usernameRegex =/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/;
	//cach 2:
		
		var message ="";
		var passwordRegex = /[a-z]/g; //chua ky tu thuong
		if(!str.match(passwordRegex))
			{
			message = message + "chữ thường. ";
			}
		
		//
		var passwordRegex2 = /[A-Z]/g;//chua ky tu hoa
		if(!str.match(passwordRegex2))
			{
			message = message + "chữ hoa. ";
			}
		
		//
		var passwordRegex3 = /[0-9]/g;//chua so
		if(!str.match(passwordRegex3))
		{
		message = message + "số. ";
		}
	
		//
		if(str.length < 6)//chu it nhat 6 ky tu
		{
		message = message + "có ít nhất 6 ký tự.";
		}
		
		var span = document.getElementById("statusmatkhau");
		if(message=="")
		{
			span.textContent = "";
		}
		else
		{
			span.textContent = "Mật khẩu phải có chứa " + message;
		}
		
	}
	</script>
	
	<!-- kiem tra dinh dang SDT -->
	<script type="text/javascript">
		function checkSDT(str)
		{
			var phonenumberRegex = /^[0-9]+$/;
			
   			 if(!phonenumberRegex.test(str))
   			 {
   				var span = document.getElementById("statusdienthoai");
   				span.textContent = "Số điện thoại không hợp lệ!";
   				return true;
   			 }
   			 if(str.length!=10)
   			{
   				var span = document.getElementById("statusdienthoai");
   				span.textContent = "Yêu cầu số điện thoại là 10 số!";
   				return true;
   			}
		}
	</script>

	<!--kiem tra dinh dang email  -->
	<script type="text/javascript">
		function checkEmail(str)
		{
   			 var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   			/*  if(!re.test(str))
   			 	alert("Please enter a valid email address"); */
   			 if(!re.test(str))
   			 {
   				var span = document.getElementById("statusemail");
   				span.textContent = "Email không đúng định dạng!";
   				return true;
   			 }
   			 
		}
	</script>
	<script type="text/javascript">
	function suaThongTin(str) {
		
		    	var change = document.getElementById("btnsua1");
                if (change.innerHTML == "Sửa")
                {
                    change.innerHTML = "Hủy";
                    /* document.getElementById("anhthe").style.visibility = "visible";  */
                    document.getElementById("name").readOnly = false;
                    document.getElementById("ngaysinh").readOnly = false;
                    document.getElementById("gioitinh").readOnly = false;
    	  			document.getElementById("diachi").readOnly = false;
    	  			document.getElementById("dienthoai").readOnly = false;
    	  			document.getElementById("email").readOnly = false;
    	  			document.getElementById("giongnoi").readOnly = false;
    	  			/* document.getElementById("anhthe").readOnly = false; */
    	  			document.getElementById("nganhhoc").readOnly = false;
    	  			document.getElementById("trinhdo").readOnly = false;
    	  			document.getElementById("nghenghiep").readOnly = false;
    	  			document.getElementById("monday").readOnly = false;
    	  			document.getElementById("lopday").readOnly = false;
    	  			document.getElementById("luong").readOnly = false;
    	  			document.getElementById("uudiem").readOnly = false;
    	  			
    	  			document.getElementById("name").style.borderColor = "red";
    	  			document.getElementById("ngaysinh").style.borderColor = "red";
                    document.getElementById("gioitinh").style.borderColor = "red";
    	  			document.getElementById("diachi").style.borderColor = "red";
    	  			document.getElementById("dienthoai").style.borderColor = "red";
    	  			document.getElementById("email").style.borderColor = "red";
    	  			document.getElementById("giongnoi").style.borderColor = "red";
    	  			/* document.getElementById("anhthe").style.borderColor = "red"; */
    	  			document.getElementById("nganhhoc").style.borderColor = "red";
    	  			document.getElementById("trinhdo").style.borderColor = "red";
    	  			document.getElementById("nghenghiep").style.borderColor = "red";
    	  			document.getElementById("monday").style.borderColor = "red";
    	  			document.getElementById("lopday").style.borderColor = "red";
    	  			document.getElementById("luong").style.borderColor = "red";
    	  			document.getElementById("uudiem").style.borderColor = "red";
    	  			
                }
                else
                {
                	/*  document.getElementById("anhthe").style.visibility = "hidden"; */
                	change.innerHTML = "Sửa";
                	document.getElementById("name").readOnly = true;
                    document.getElementById("ngaysinh").readOnly = true;
                    document.getElementById("gioitinh").readOnly = true;
    	  			document.getElementById("diachi").readOnly = true;
    	  			document.getElementById("dienthoai").readOnly = true;
    	  			document.getElementById("email").readOnly = true;
    	  			document.getElementById("giongnoi").readOnly = true;
    	  			/* document.getElementById("anhthe").readOnly = true; */
    	  			document.getElementById("nganhhoc").readOnly = true;
    	  			document.getElementById("trinhdo").readOnly = true;
    	  			document.getElementById("nghenghiep").readOnly = true;
    	  			document.getElementById("monday").readOnly = true;
    	  			document.getElementById("lopday").readOnly = true;
    	  			document.getElementById("luong").readOnly = true;
    	  			document.getElementById("uudiem").readOnly = true;
    	  			
    	  			document.getElementById("name").style.borderColor = "#ccc";
    	  		   	document.getElementById("ngaysinh").style.borderColor = "#ccc";
                    document.getElementById("gioitinh").style.borderColor = "#ccc";
    	  			document.getElementById("diachi").style.borderColor = "#ccc";
    	  			document.getElementById("dienthoai").style.borderColor = "#ccc";
    	  			document.getElementById("email").style.borderColor = "#ccc";
    	  			document.getElementById("giongnoi").style.borderColor = "#ccc";
    	  			/* document.getElementById("anhthe").style.borderColor = "#ccc"; */
    	  			document.getElementById("nganhhoc").style.borderColor = "#ccc";
    	  			document.getElementById("trinhdo").style.borderColor = "#ccc";
    	  			document.getElementById("nghenghiep").style.borderColor = "#ccc";
    	  			document.getElementById("monday").style.borderColor = "#ccc";
    	  			document.getElementById("lopday").style.borderColor = "#ccc";
    	  			document.getElementById("luong").style.borderColor = "#ccc";
    	  			document.getElementById("uudiem").style.borderColor = "#ccc";
    	  			
                }
	  
	}
</script>

</head>

<body >
	<%
		String username=(String)session.getAttribute("username");
		System.out.println("username ben trang dndklamgs: " + username);
		String password = (String)session.getAttribute("password");
		System.out.println("password ben trang dndklamgs: " + password);
		DNDKLamGiaSuDAO dndklgsDAO = new DNDKLamGiaSuDAO();
		ArrayList<GiaSu> dsGS = new GiaSuTieuBieu1DAO().getListGiaSu();
		
	%>
	<div class="container">
		<div class="row">
			<div class="col-sm-1">

			</div>
			<div class="col-sm-2">
				<a href="#" title="Trung tâm gia sư Trí Việt"><img src="image/logo.jpg" style="width: 140px;margin-top: 15px; "></a>
			</div>
			<div class="col-sm-8">
				<div id="header_right">
					<h2 class="text">TRUNG TÂM TƯ VẤN VÀ DỊCH VỤ</h2>
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
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-8">
				<nav class="nav">
					<div id="menu">
						<ul class="nav navbar-nav" style="background-color:#F7CD20;">
							<li ><a href="#">TRANG CHỦ</a></li>
							<li><a href="LopMoiChuaGiao.jsp">LỚP MỚI</a></li>
							<li><a href="DangKyTimGiaSu.jsp" >PHỤ HUYNH</a></li>
							<li class="hover"><a href="DangKyLamGiaSu.jsp" >GIA SƯ</a></li>
							<li><a href="TuyenDung.jsp" >TUYỂN DỤNG</a></li>
							<li><a href="LienHe.jsp" >LIÊN HỆ</a></li>
							<li><a href="DangXuatServlet" >ĐĂNG XUẤT</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" id="banner">
				<div class="col-sm-4" >
					<a href="#"><img src="image/DKTGS.png"></a>	
				</div>

				<div class="col-sm-4" >
					<div class="mySlides fade">
						<img src="image/sli.jpg">         
					</div>
					<div class="mySlides fade">
						<img src="image/slide.JPG">						         
					</div>
					<div class="mySlides fade">
						<img src="image/slide3.jpg">
					</div>
				</div>

				<div style="text-align:center">
					<span class="dot" onclick="currentSlide(0)"></span> 
					<span class="dot" onclick="currentSlide(1)"></span> 
					<span class="dot" onclick="currentSlide(2)"></span> 
				</div> 


				<div class="col-sm-4">  	
					<a href="#"><img src="image/DKLGS.png"></a>				
				</div>
			</div>
		</div>
		<div class="row" id="main">
			<div class="col-lg-2" style="width: 240px;margin-left: -10px;">
				<div id="left">
					<div class="list-group">
						
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">GIA SƯ</a>
						<a href="DNDKLamGiaSu.jsp" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Thông tin gia sư</a>
						<a href="/QuanLyGiaSu/DoiMatKhau.jsp?username=<%=username %>" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Đổi mật khẩu</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Quy trình nhận lớp</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Gia sư cần biết</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Mức phí gia sư</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Dịch vụ gia sư</a>
						<a href="DSGiaSuTieuBieu.jsp" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">GIA SƯ TIÊU BIỂU</a>
					</div>
					<div id="anhgstieubieu">
				
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(0).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(0).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: -10px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(1).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(1).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5x;margin-top: -10px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(2).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(2).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(3).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(3).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(4).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(4).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(5).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(5).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
					</div>	
					<a href="/QuanLyGiaSu/DSGiaSuTieuBieu.jsp" style="text-decoration: none;margin-left: 50px;font-size: 18px;">Xem thêm gia sư</a>

					<div class="list-group" style="height: 320px">
						<a href="" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">CÁC LỚP CẦN GIA SƯ</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=1" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư dạy lớp 1</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=2" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 2</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=3" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 3</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=4" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 4</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=5" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 5</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=6" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 6</a>
						<a href="/QuanLyGiaSu/DSLop.jsp?lopDay=7" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 7</a>

					</div>
					<a href="LopMoiChuaGiao.jsp" style="margin-left: 80px; text-decoration: none;font-size: 18px;margin-top: -10px;">Xem Thêm</a>
					<div class="list-group">
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">BẢN ĐỒ CHỈ ĐƯỜNG</a>
						<img src="image/dodo.jpg" style="width: 210px">
					</div>
				</div>
			</div>
			<div class="col-lg-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p style="margin-left: 50px;color: white;font-weight: bold;font-size: 16px;">THÔNG TIN GIA SƯ</p>
					</div>
					<div class="panel-body">
					
					<form action="DNDKLamGiaSuServlet" name="DKTGS" id="FormDKTGS" method="post" >
						<button type="button" id = "btnsua1" onclick="suaThongTin(this.value)" class="btn btn-primary">Sửa</button><br>
							<%
								GiaSu gs = new DNDKLamGiaSuDAO().getGiaSu(username);
								System.out.println("ten pass la: " + password);
							
						%>
						
						<div class="col-lg-4">
						</div>
						<div class="col-lg-4">
						<img src="./HinhAnhServlet?maGS=<%=gs.getMaGS()%>" style="width:80%">
						
						</div>
						<div class="col-lg-4">
						</div>
						
						<br><br>
						
							<div class="row">
								<label for="tendangnhap">Tên đăng nhập (<span class="red">*</span>)</label>
								<input type="text" name="tendangnhap" id="tendangnhap" value="<%=username %>" required><br/>
							</div>
							
							<div class="row">
								<span style="color: red; margin-left: 40px;" id="statustendn"></span>
							</div>
							<div class="row">
								<label for="matkhau">Mật khẩu (<span class="red">*</span>)</label>
								<input type="password" name="matkhau" id="matkhau" value="<%=password %>" required readonly>
							</div>
							<div class="row">
								<span style="color: red; margin-left: 40px;" id="statusmatkhau"></span>
							</div>
							<div class="row" >
								<label for="hoten">Họ tên (<span class="red">*</span>)</label>
								<input type="text" name="name" id="name" value="<%=gs.getHoTen() %>" required readonly>
							</div>
							
						 	<div class="row">
								<label for="ngaysinh">Ngày sinh (<span class="red">*</span>)</label> 
								<input type="text" name="ngaysinh" id="ngaysinh" value="<%=gs.getNgaySinh() %>" required readonly>
								
							</div>
						 	<div class="row">
								<label for="gt">Giới tính (<span class="red">*</span>)</label>
								
								<input type="text" name="gioitinh" id="gioitinh" value="<%=gs.getGioiTinh() %>" required readonly>
								
							</div>
							<div class="row">
								<label for="diachi">Địa chỉ(<span class="red">*</span>)</label>
								<input type="text" name="diachi" id="diachi" value="<%=gs.getDiaChi() %>" required readonly>
							</div>
							<div class="row">
								<label for="dienthoai">Điện thoại (<span class="red">*</span>)</label>
								<input type="text" name="dienthoai" id="dienthoai" value="<%=gs.getDienThoai() %>"  required readonly onblur="checkSDT(this.value)">
							</div> 
							<div class="row">
								<span style="color: red; margin-left: 40px;" id="statusdienthoai"></span>
							</div>
							<div class="row">
						 		<label for="email">Email (<span class="red">*</span>)</label>
						 		<input type="text" name="email" id="email" value="<%=gs.getEmail() %>" readonly onblur="checkEmail(this.value)" required>
						 	</div>
						 	<div class="row">
						 		<span style="color:red; margin-left: 40px;" id="statusemail"></span>
						 	</div>
							<div class="row">
								<label for="nguyenquan">Giọng nói(<span class="red">*</span>)</label>
								
								<input type="text" name="giongnoi" id="giongnoi" value="<%=gs.getGiongNoi() %>" required readonly>
							</div>
							<div class="row">
								<label for="nganh">Ngành học(<span class="red">*</span>)</label>
								<input type="text" name="nganhhoc" id="nganhhoc" value="<%=gs.getNganhHoc() %>" readonly required>
							</div>
							<div class="row">
								<label for="td">Trình độ (<span class="red">*</span>)</label>
								<input type="text" name="trinhdo" id="trinhdo" value="<%=gs.getTrinhDo() %>" readonly required>
							</div>
							<div class="row">
								<label for="nn">Nghề nghiệp (<span class="red">*</span>)</label>
								<input type="text" name="nghenghiep" id="nghenghiep" value="<%=gs.getNgheNghiep() %>" required readonly>
							</div>

							<div class="row">
								<label for="monday">Môn dạy (<span class="red">*</span>)</label>
								<input type="text" name="monday" id="monday" value="<%=gs.getMonDay() %>" readonly required>

							</div>
							<div class="row">
								<label for="lopday">Lớp dạy (<span class="red">*</span>)</label>
								<input type="text" name="lopday" id="lopday" value="<%=gs.getLopDay() %>" readonly required>

							</div>
							<div class="row">
								<label for="luongtt">Yêu cầu lương tối thiểu (<span class="red">*</span>)</label>
								<input type="text" name="luong" id="luong" value="<%=gs.getLuongYauCauToiThieu() %>" readonly required>
								<label for="ngandong" style="margin-left:160px;">ngàn đồng/buổi</label>
								<br>
								<i style="padding-left: 220px;">1 buổi của Giáo viên là: 90 phút, 1 buổi Sinh Viên là: 120 phút</i>
							</div>
														<div class="row">
								<label for="uudiem">Ưu điểm (<span class="red">*</span>)</label>
								<textarea name="uudiem" id="uudiem" rows="5" textareaObject.value="text" readonly required ><%=gs.getUuDiem() %>
								</textarea>
							</div>
							
							<div class="submit">
								<input type="submit" value="Cập nhật">
							</div>
						</form>
						
						<br/>
						 
						 <br/>
						<div class="panel-body"> 
						
						<%
				ArrayList<Lop> dsLopCuaGiaSu = new DNDKLamGiaSuDAO().getListLopCuaGiaSu(username);
				%>
				<h3 style="text-align: center">DANH SÁCH CÁC LỚP ĐÃ ĐĂNG KÝ DẠY</h3>
				<table border="1" width="100%">
					<tr style="height:30px;">
						<td style="text-align: center;"><b>Mã số</b></td>
						<td style="text-align: center;"><b>Lớp</b></td>
						<td style="text-align: center;"><b>Môn</b></td>
						<td style="text-align: center;"><b>Thời gian</b></td>
						<td style="text-align: center;"><b>Địa chỉ</b></td>
					</tr>
					
					<%
						for(int i=0; i<dsLopCuaGiaSu.size();i++)
					{
					%>
					<tr style="height: 30px;">
					<td><p style="margin-left: 10px;"><%=dsLopCuaGiaSu.get(i).getMaLop() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopCuaGiaSu.get(i).getLopDay() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopCuaGiaSu.get(i).getMonDay() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopCuaGiaSu.get(i).getThoiGianDay() %></p></td>
					<td><p style="margin-left: 10px;"><%=dsLopCuaGiaSu.get(i).getDiaChi() %></p></td>
					</tr>
				<%
					}
				%>
					
				</table>
				</div>
					</div>
					
				</div>
			</div>
			<div class="col-lg-2" style="width: 240px;">
				<div id="right">
					<div class="list-group">
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">THỐNG KÊ</a>
						<a href="ThongKeNhanLop.jsp" class="list-group-item" style="text-align: center">THỐNG KÊ NHẬN LỚP<img src="image/new.gif"></a>
						<a href="LopMoiChuaGiao.jsp" class="list-group-item" style="text-align: center">LỚP MỚI CHƯA GIAO<img src="image/hot.gif"></a>
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">DOWNLOAD TÀI LIỆU</a>
						<a href="DownloadTaiLieuMonToan.jsp" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Toán</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Lý</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Hóa</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Anh</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Văn</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Sử</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Sinh</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu môn Địa</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu ôn thi TOEIC</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tài liệu ôn thi IELTS</a>
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">THÔNG TIN TUYỂN DỤNG</a>
						<a href="#" class="list-group-item">
							<p style="font-weight: 200;font-size: 14px;">Trung tâm gia sư Trí Việt cần tuyển 20 sinh viên nữ trực điện thoại, có giọng nói dễ nghe</p>
						</a>
						<a href="#" class="list-group-item">
							<p style="font-weight: 200;font-size: 14px;">Trung tâm gia sư Trí Việt cần tuyển nhân viên tư vấn giáo dục, yêu tiên sinh viên mới ra trường, có bằng cấp</p>
						</a>
						<a href="#" class="list-group-item">
							<p style="font-weight: 200;font-size: 14px;">Trung tâm gia sư Trí Việt cần tuyển nhân viên bảo vệ, làm việc theo giờ hành chính</p>
						</a>

						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">TIN TỨC</a>

						<a href="#" class="list-group-item">
							<img src="image/tt1.jpg" style="float: left; width: 100px;margin-left: -15px;margin-right: 5px;">
							<p style="font-weight: 200;font-size: 12px;">Cô giáo trẻ dạy Tiếng Anh bằng trải nghiệm sáng tạo</p>
						</a>

						<a href="#" class="list-group-item">
							<img src="image/slide.JPG" style="float: left; width: 100px;margin-left: -15px;margin-right: 5px;">
							<p style="font-weight: 200;font-size: 12px;">Kinh nghiệm chọn gia sư dành cho phụ huynh</p>
						</a>

						<a href="#" class="list-group-item">
							<img src="image/slide1.jpg" style="float: left; width: 100px;margin-left: -15px;margin-right: 5px;">
							<p style="font-weight: 200;font-size: 12px;">Gia sư nên làm gì khi học sinh không nghe lời</p>
						</a>

						<a href="#" class="list-group-item">
							<img src="image/slide3.jpg" style="float: left; width: 100px;margin-left: -15px;margin-right: 5px;">
							<p style="font-weight: 200;font-size: 12px;">Cô giáo trẻ dạy Tiếng Anh bằng trải nghiệm sáng tạo</p>
						</a>

						<a href="#" class="list-group-item">
							<img src="image/phan_lan.jpg" style="float: left; width: 100px;margin-left: -15px;margin-right: 5px;">
							<p style="font-weight: 200;font-size: 12px;">Tạo không khí học tập vui vẻ để truyền cảm hứng cho trẻ</p>
						</a>

						<a href="#" class="list-group-item">
							<img src="image/tt1.jpg" style="float: left; width: 100px;margin-left: -15px;margin-right: 5px;">
							<p style="font-weight: 200;font-size: 12px;">Cô giáo trẻ dạy Tiếng Anh bằng trải nghiệm sáng tạo</p>
						</a>

						<br>


						<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FGia-S%25C6%25B0-Tr%25C3%25AD-Vi%25E1%25BB%2587t-613051568814323%2F&tabs=timeline&width=240&height=240&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="240" height="250" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

					</div>

				</div>

			</div>
		</div>
		<div class="row">
			<div id="footer">
				<div id="footer_tt">

					<div class="col-sm-6" style="margin-top: 30px">
						
						<br>
						<img src="image/footer.png" style="width: 180px;float: left;margin-top: -30px">
						<h5>CÔNG TY TƯ VẤN VÀ DỊCH VỤ GIA SƯ TRÍ VIỆT</h5>
						<h5>Trụ sở chính: Số 01, Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, TP Hồ Chí Minh</h5>
						<h5>Số điện thoại: 0987654321 -- Fax: 028.39733234</h5>
						<h5>Email: GiaSuTriViet@gmail.com</h5>
					</div>
					<div class="col-sm-5" style="margin-left: 75px">
						<br>
						<h4 style="text-align: center"><b>CHẤP NHẬN THANH TOÁN</b></h4>
						<img src="image/acb.jpg" style="width: 70px;margin-right: 10px;margin-left: 20px">
						<img src="image/bidv.jpg" style="width: 70px;margin-right: 10px;">
						<img src="image/agribank.jpg" style="width: 70px;margin-right: 10px">
						<img src="image/vietinbank.jpg" style="width: 70px;margin-right: 10px;">
						<img src="image/vpbank.jpg" style="width: 70px;margin-right: 10px;">
						<br><br>
						<h4 style="text-align: center"><b>LIÊN HỆ VỚI CHÚNG TÔI</b></h4>
						<input type="email" class="form-control" placeholder="Your Email" style="float: left; width: 360px">
						<button type="button" class="btn" style="">Submit</button><br><br>

					</div>
				</div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th><span class="glyphicon glyphicon-stop" style="color: red"></span> TPHCM: Số 01, Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, TP Hồ Chí Minh<br> SĐT: 0987.654.321</th>
							<th><span class="glyphicon glyphicon-stop" style="color: red"></span> HÀ NỘI: Số 4, Ngõ 3 Tô Hiệu, Phường Nguyễn Trãi, Quận Hà Đông, Hà Nội<br> SĐT: 0987.654.321</th>				
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-stop" style="color: red"></span> Cần Thơ: 51/1G Đường 3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ<br> SĐT: 0987.654.321</td>
							<td><span class="glyphicon glyphicon-stop " style="color: red"></span> Đà Nẵng: 169 Lê Lợi, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng<br> SĐT: 0987.654.321</td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-stop " style="color: red"></span> Bình Dương: 207/5A Phạm Ngũ Lão, Phường Hiệp Thành, TDM, Bình Dương<br> SĐT: 0987.654.321</td>
							<td><span class="glyphicon glyphicon-stop " style="color: red"></span> Hải Phòng:  264 Đồng Hòa, Phường Đồng Hòa, Quận Kiến An, Hải Phòng<br> SĐT: 0987.654.321</td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-stop" style="color: red"></span> Đồng Nai: E10 Khu Phố 1, Phường Tân hiệp, TP. Biên Hòa,  Đồng Nai<br> SĐT: 0987.654.321</td>
							<td><span class="glyphicon glyphicon-stop" style="color: red"></span> Vũng Tàu: 207 Lê Hồng Phong, Phường 8, TP Vũng Tàu, Bà Rịa<br> SĐT: 0987.654.321</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</body>
<script>
      //khai báo biến slideIndex đại diện cho slide hiện tại
      var slideIndex;
      // KHai bào hàm hiển thị slide
      function showSlides() {
      	var i;
      	var slides = document.getElementsByClassName("mySlides");
      	var dots = document.getElementsByClassName("dot");
      	for (i = 0; i < slides.length; i++) {
      		slides[i].style.display = "none";  
      	}
      	for (i = 0; i < dots.length; i++) {
      		dots[i].className = dots[i].className.replace(" active", "");
      	}

      	slides[slideIndex].style.display = "block";  
      	dots[slideIndex].className += " active";
          //chuyển đến slide tiếp theo
          slideIndex++;
          //nếu đang ở slide cuối cùng thì chuyển về slide đầu
          if (slideIndex > slides.length - 1) {
          	slideIndex = 0
          }    
          //tự động chuyển đổi slide sau 8s
          setTimeout(showSlides, 8000);
      }
      //mặc định hiển thị slide đầu tiên 
      showSlides(slideIndex = 0);


      function currentSlide(n) {
      	showSlides(slideIndex = n);
      }
  </script>
  
  
    
     
	
	
</html>
