<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<%@ page import = "model.Lop" %>
	<%@ page import = "model.PhuHuynh" %>
	<%@ page import = "dao.GiaSuTieuBieu1DAO" %>
	<%@ page import = "dao.DSTheoLopDAO" %>
	<%@ page import = "model.GiaSu" %>
	<%@ page import = "java.util.*" %>
	<title>DanhSachLop</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/CSS_LMCG.css">

</head>
<body>
	<%	
		ArrayList<GiaSu> dsGS = new GiaSuTieuBieu1DAO().getListGiaSu();
		ArrayList<Lop> dsLop = new DSTheoLopDAO().getDSLop(request.getParameter("lopDay"));
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
							<li ><a href="TrangChu.jsp">TRANG CHỦ</a></li>
							<li class="hover"><a href="LopMoiChuaGiao.jsp">LỚP MỚI</a></li>
							<li><a href="DangKyTimGiaSu.jsp" >PHỤ HUYNH</a></li>
							<li><a href="DangKyLamGiaSu.jsp" >GIA SƯ</a></li>
							<li><a href="TuyenDung.jsp" >TUYỂN DỤNG</a></li>
							<li><a href="LienHe.jsp" >LIÊN HỆ</a></li>
							<li><a href="DangNhap.jsp" >ĐĂNG NHẬP</a></li>
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


				<div class="col-sm-4" ">  	
					<a href="#"><img src="image/DKLGS.png"></a>				
				</div>
			</div>
		</div>
		<div class="row" id="main">
			<div class="col-lg-2" style="width: 240px;margin-left: -10px;">
				<div id="left">
					<div class="list-group">
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">PHỤ HUYNH</a>
						<a href="DangKyTimGiaSu.jsp" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Đăng kí tìm gia sư</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Phụ huynh cần biết</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Học phí gia sư</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Dịch vụ gia sư</a>
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">GIA SƯ</a>
						<a href="DangKyLamGiaSu.jsp" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Đăng kí làm gia sư</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Quy trình nhận lớp</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Gia sư cần biết</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Mức phí gia sư</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Dịch vụ gia sư</a>
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">GIA SƯ TIÊU BIỂU</a>
					</div>
					<div id="anhgstieubieu">
				
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(0).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(0).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: -10px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(1).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(1).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5x;margin-top: -10px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(2).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(2).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(3).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(3).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(4).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(4).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
						<a href="/QuanLyGiaSu/GiaSuTieuBieu1.jsp?maGS=<%=dsGS.get(5).getMaGS() %>"><img src="./HinhAnhServlet?maGS=<%=dsGS.get(5).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: 5px"></a>
				</div>	
				<a href="/QuanLyGiaSu/DSGiaSuTieuBieu.jsp?" style="text-decoration: none;margin-left: 50px;font-size: 18px;">Xem thêm gia sư</a>

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
					<a href="PageServlet?command=LopMoi&pageID=1" style="margin-left: 80px; text-decoration: none;font-size: 18px;margin-top: -10px;">Xem Thêm</a>
					<div class="list-group">
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">BẢN ĐỒ CHỈ ĐƯỜNG</a>
						<img src="image/dodo.jpg" style="width: 210px">
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p style="margin-left: 50px;color: white;font-weight: bold;font-size: 16px">DANH SÁCH LỚP</p>
					</div>
					<div class="panel-body">
						<div class="row">
							<h4 style="text-align: center; font-weight: 400;">TÌM GIA SƯ LỚP <%= request.getParameter("lopDay") %></h4>
						</div>
						<br>
						<!-- <div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3"></div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<input type="text" name="timkiem" placeholder="Nhập mã lớp">
								<input type="submit" name="tim" value="Tìm kiếm">
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3"></div>
						</div> -->
						<br>
						<div class="row">
							<div class="col-lg-2 col-md-2 col-sm-2"></div>
							
							<div class="col-lg-2 col-md-2 col-sm-2"></div>
							
						</div>
						<br>
						<div class="row">
							<table class="danhsach" style=" font-family: arial, sans-serif;border-collapse: collapse;width: 100%;">
					<tr>
					    <th>Mã lớp</th>
					   <!--  <th>Mã PH</th> -->
					    <th>Lớp dạy</th>
					    <th>Môn dạy</th>
					    <th>Số buổi</th>
					    <th>Số lượng HS</th>
					    <th>Học lực</th>
					    <th>Thời gian dạy</th>
					    <th>Địa chỉ</th>
					    <th>Lương</th>
					    <th>Mức phí</th>
					    <th>Yêu cầu</th>
					     <th>Đăng ký</th>
					  </tr>
					  <%
					  		for(int i=0;i<dsLop.size();i++)
							{
					%>
					  <tr>
					  
					    <td><%=dsLop.get(i).getMaLop() %></td>
					    <td><%=dsLop.get(i).getLopDay() %></td>
					    <td><%=dsLop.get(i).getMonDay() %></td>
					    <td><%=dsLop.get(i).getSoBuoi() %></td>
					    <td><%=dsLop.get(i).getSoLuongHS() %></td>
					    <td><%=dsLop.get(i).getHocLucHienTai() %></td>
					    <td><%=dsLop.get(i).getThoiGianDay() %></td>
					    <td><%=dsLop.get(i).getDiaChi() %></td>
					    <td><%=dsLop.get(i).getLuong() %></td>
					    <td><%=dsLop.get(i).getMucPhi() %></td>
					     <td><%=dsLop.get(i).getYeuCau() %></td>
					    <td><a href="#"> <img src="image/icon-dang-ky.png"></a></td>
					  
					  </tr>
					  <%
							}
					  %>

				</table>
						</div>
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
				<table class="table">
					<tbody>
						<tr >
							<th><span class="glyphicon glyphicon-stop" style="color: red"></span> TPHCM: Số 01, Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, TP Hồ Chí Minh<br> SĐT: 0987.654.321</th>
							<th><span class="glyphicon glyphicon-stop" style="color: red"></span> HÀ NỘI: Số 4, Ngõ 3 Tô Hiệu, Phường Nguyễn Trãi, Quận Hà Đông, Hà Nội<br> SĐT: 0987.654.321</th>				
						</tr >
						<tr >
							<td><span class="glyphicon glyphicon-stop" style="color: red"></span> Cần Thơ: 51/1G Đường 3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ<br> SĐT: 0987.654.321</td>
							<td><span class="glyphicon glyphicon-stop " style="color: red"></span> Đà Nẵng: 169 Lê Lợi, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng<br> SĐT: 0987.654.321</td>
						</tr>
						<tr >
							<td><span class="glyphicon glyphicon-stop " style="color: red"></span> Bình Dương: 207/5A Phạm Ngũ Lão, Phường Hiệp Thành, TDM, Bình Dương<br> SĐT: 0987.654.321</td>
							<td><span class="glyphicon glyphicon-stop " style="color: red"></span> Hải Phòng:  264 Đồng Hòa, Phường Đồng Hòa, Quận Kiến An, Hải Phòng<br> SĐT: 0987.654.321</td>
						</tr>
						<tr >
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
