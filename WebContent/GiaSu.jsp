<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<%@ page import = "dao.GiaSuDAOImpl" %>
	<%@ page import = "model.GiaSu" %>
	<%@ page import = "dao.LopDAOImpl" %>
	<%@ page import = "model.Lop" %>
	<%@ page import = "java.util.*" %>
	<title>GiaSu</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/CSS_LMCG.css">

</head>
<body>
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
							<li class="hover"><a href="PageServlet?command=LopMoi&pageID=1">LỚP MỚI</a></li>
							<li><a href="DangKyTimGiaSu.jsp" >PHỤ HUYNH</a></li>
							<li><a href="DangKyLamGiaSu.jsp" >GIA SƯ</a></li>
							<li><a href="PageServlet?command=TuyenDung&pageID=1" >TUYỂN DỤNG</a></li>
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
						<%
  						ArrayList<GiaSu> dsGiaSu = new GiaSuDAOImpl().getListGiaSu();
  						for(int i=0;i<6;i++)
  						{
  					%>
						<a href="GiaSuTieuBieu.jsp?maGS=<%=dsGiaSu.get(i).getMaGS() %>"><img src="./ImageServlet?command=GiaSu&maGS=<%=dsGiaSu.get(i).getMaGS() %>" style="width: 90px;height: 130px;float: left;margin-right: 5px;margin-top: -10px"></a>
					<%
  						}
					%>
					</div>	
					<a href="#" style="text-decoration: none;margin-left: 50px;font-size: 18px;">Xem thêm gia sư</a>

					<div class="list-group" style="height: 320px">
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">GIA SƯ THEO LỚP</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 1</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 2</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 3</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 4</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 5</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 6</a>
						<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Tìm gia sư lớp 7</a>

					</div>
					<a href="#" style="margin-left: 80px; text-decoration: none;font-size: 18px;margin-top: -10px;">Xem Thêm</a>
					<div class="list-group">
						<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">BẢN ĐỒ CHỈ ĐƯỜNG</a>
						<img src="image/dodo.jpg" style="width: 210px">
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p style="margin-left: 50px;color: white;font-weight: bold;font-size: 16px">DANH SÁCH CÁC GIA SƯ</p>
					</div>
					<div class="panel-body">
					<c:forEach items="${listGiaSu }" var="list">
					
						<div class="col-sm-6">
								<ul class="list-group">
								  <li class="list-group-item active" >MÃ GS: ${list.maGS }</li>
								  <li class="list-group-item">
								  	<img src="./ImageServlet?command=GiaSu&maGS=${list.maGS }" style="width: 100px; float: left">
								    <h5><b>Họ và tên:</b> ${list.hoTen }</h5>
								    <h5><b>Ngày sinh:</b> ${list.ngaySinh }</h5>
								    <h5><b>Giới tính:</b> ${list.gioiTinh } </h5>
								    <h5><b>Giọng nói:</b> ${list.giongNoi } </h5>
								    <h5><b>Nghề nghiệp:</b> ${list.ngheNghiep }</h5>
								    <h5><b>Trình độ:</b> ${list.trinhDo }</h5>
								    <h5><b>Ngành học:</b> ${list.nganhHoc }</h5>
								    <h5><b>Lớp dạy:</b> ${list.lopDay }</h5>
								    <h5><b>Môn dạy:</b> ${list.monDay }</h5>
								    <h5><b>Lương yêu cầu tối thiểu:</b> ${list.luongYauCauToiThieu }</h5>
								    <br>
								  </li>
								</ul>
							</div>
					</c:forEach>
						
					</div>
				<center>
					<ul class="pagination">
						<%
							int count =12;
							int sumRow = GiaSuDAOImpl.CountRow();
							int maxpageid= (sumRow/count)+1;
							for(int i=1;i<=maxpageid;i++)
							{
						%>
							<li><a href="PageServlet?command=GiaSu&pageID=<%=i %>"><%=i %></a></li>
						<%
							}
						%>
					  </ul>
				</center>
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
  
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#txtTimLop").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tableLop tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
  });
  </script>

  </html>
