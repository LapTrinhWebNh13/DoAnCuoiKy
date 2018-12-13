<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/CSS.css">
<title>QuenMatKhau</title>
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
				  <li class="hover"><a href="#">TRANG CHỦ</a></li>
				  <li><a href="LopMoiChuaGiao.jsp">LỚP MỚI</a></li>
				  <li><a href="DangKyTimTimGiaSu.jsp" >PHỤ HUYNH</a></li>
				  <li><a href="DangKyLamSu.jsp" >GIA SƯ</a></li>
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

			  
		  	<div class="col-sm-4" style="margin-top: -20px;">  	
		  			<a href="#"><img src="image/DKLGS.png"></a>				
		  	</div>
		  </div>
	  </div>
	  <div class="row" id="main">
	  		<div class="col-sm-12" style="margin-bottom:30px;">
	  			<br>
	  			<p><a href="DangNhap.jsp" style="color:red"> Quay lại trang đăng nhập</a></p>
	  			<h3 style="text-align: center;font-weight: bold;">QUÊN MẬT KHẨU?</h3>
	  			<h5 style="text-align: center">Vui lòng nhập email của bạn vào đây! Sau đó bạn sẽ nhận được liên kết để đặt lại mật khẩu mới.</h5>
	  			<div class="col-sm-3"></div>
	  			<div class="col-sm-6">
	  				<form>			
		  				<br><p style="text-align: center">*Địa chỉ Email:</p>
			  			<input class="form-control input-lg" id="email" type="email" required><br>
			  			<button type="submit" class="btn btn-primary btn-block">Submit</button>
		  			</form>
	  			</div>
	  			<div class="col-sm-3"></div>
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
      
      var slideIndex;
      
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
          
          slideIndex++;
          
          if (slideIndex > slides.length - 1) {
            slideIndex = 0
          }    
          
          setTimeout(showSlides, 8000);
      }
      
      showSlides(slideIndex = 0);


      function currentSlide(n) {
        showSlides(slideIndex = n);
      }
    </script>
</html>
>>>>>>> 94a11b0aa95e90198199b9f3668c897a6c0a0afe:WebContent/WebContent/QuenMatKhau.jsp
