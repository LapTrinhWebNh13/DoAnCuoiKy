<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ page import = "dao.GiaSuDAOImpl" %>
	<%@ page import = "model.GiaSu" %>
	<%@ page import = "dao.TaiLieuDAOImpl" %>
	<%@ page import = "model.TaiLieu" %>
	<%@ page import = "dao.TinTucDAOImpl" %>
	<%@ page import = "model.TinTuc" %>
	<%@ page import = "dao.LopDAOImpl" %>
	<%@ page import = "model.Lop" %>
	<%@ page import = "java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/CSS.css">
<title>TrangChu</title>
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
				  <li><a href="PageServlet?command=LopMoi&pageID=1">LỚP MỚI</a></li>
				  <li><a href="DangKyTimGiaSu.jsp" >PHỤ HUYNH</a></li>
				  <li><a href="DangKyLamGiaSu.jsp" >GIA SƯ</a></li>
				  <li><a href="PageServlet?command=TuyenDung&pageID=1">TUYỂN DỤNG</a></li>
				  <li><a href="LienHe.jsp">LIÊN HỆ</a></li>
				  <li><a href="DangNhap.jsp">ĐĂNG NHẬP</a></li>
				</ul>
			  </div>
			</nav>
	  	</div>
	  </div>
	  <div class="row">
		  <div class="col-sm-12" id="banner">
		  	<div class="col-sm-4" >
				<a href="DangKyTimGiaSu.jsp"><img src="image/DKTGS.png"></a>	
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
		  			<a href="DangKyLamGiaSu"><img src="image/DKLGS.png"></a>				
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

					<a href="DangKyLamGiaSu" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span>Đăng kí làm gia sư</a>
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
					<a href="PageServlet?command=GiaSu&pageID=1" style="text-decoration: none;margin-left: 50px;font-size: 18px;">Xem thêm gia sư</a>

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
	  	<div class="col-lg-7" style="">
	  		<div class="panel panel-default">
				<div class="panel-heading">
					<p style="margin-left: 50px;color: white;font-weight: bold;font-size: 16px;">GIỚI THIỆU</p>
				</div>
				<div class="panel-body">
					  <img src="image/sli.jpg" style="width: 300px;float: left;margin-right: 15px;">
							<b style="margin-left: 15px">Gia sư Trí Việt<br><br></b>
							<h7 style="margin-left: 15px">Gia sư Trí Việt thành lập với sự trăn trở của những người là phụ huynh - học viên, đã rất gian nan trong việc tìm gia sư về dạy kèm tại nhà.<br></h7>
							<h7 style="margin-left: 15px" >Nhằm đáp ứng gia sư cho các em học viên để có thành tích cao trong học tập và đạt kết quả cao nhất trong các kỳ thi quan trọng. Với đội ngũ......</h7><br><br>
					  <button type="button" class="btn btn-danger" style="margin-left: 330px">Chi tiết</button>
				</div>
					<br>
				<div class="panel-heading">
					<p style="margin-left: 50px;color: white;font-weight: bold;font-size: 16px;">BẢNG GIÁ THAM KHẢO</p>
				</div>
				<div class="panel-body">
						<img src="image/bangGia.PNG">
				</div>
					<br>
				<div class="panel-heading">
					<p style="margin-left: 50px;color: white;font-weight: bold;font-size: 16px;">LỚP DẠY KÈM MỚI</p>
				</div>
				<div class="panel-body">
					<input id="txtTimLop" class="form" style="width: 70%;height:30px;float:left; margin-left:10px;" placeholder="Tìm kiếm..." type="text">
					<!-- <div style="float: left; margin-right: 20px;" class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" >---Tất cả tỉnh/thành---
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" >
							  <li><a href="#">TP Hồ Chí Minh</a></li>
							  <li><a href="#">Hà Nội</a></li>
							  <li><a href="#">Lâm Đồng</a></li>
							  <li><a href="#">Đồng Nai</a></li>
						</ul>
					</div> -->
					<div>
						 <button type="button" class="btn btn-danger">Tìm kiếm nhanh</button>
					</div>
				</div>
				<div class="panel-body">
					
						<%
							ArrayList<Lop> dsLop =new LopDAOImpl().getListLopMoi();
							for(int i=0;i<4;i++)
								{
								
							%>
							
								<div id="tableLop" class="col-sm-6">
									<ul  class="list-group">
									  <li class="list-group-item active" >MÃ LỚP: <%=dsLop.get(i).getMaLop() %></li>
									  <li class="list-group-item">
									    <h5><b>Lớp dạy:</b> <%=dsLop.get(i).getLopDay() %></h5>
									    <h5><b>Môn dạy:</b> <%=dsLop.get(i).getMonDay() %></h5>
									    <h5><b>Địa chỉ:</b> <%=dsLop.get(i).getDiaChi() %></h5>
									    <h5><b>Mức lương:</b> <%=dsLop.get(i).getLuong() %> đ/tháng</h5>
									    <h5><b>Số buổi:</b><%=dsLop.get(i).getLuong() %> buổi/tuần</h5>
									    <h5><b>Thời gian:</b><%=dsLop.get(i).getThoiGianDay() %></h5>
									    <h5><b>Yêu cầu:</b><%=dsLop.get(i).getYeuCau() %></h5>
									    <h5><b>Liên hệ:</b>0987.654.321- 0123.456.789</h5>
									    <br>
									    <a href="DangKyNhanLop.jsp?maLop=<%=dsLop.get(i).getMaLop() %>"><button type="button" class="btn btn-danger" style="margin-top: -10px;">ĐĂNG KÝ DẠY</button></a>
									  </li>
									</ul>
								</div>
							<%
								}
							%>

							
					</div>
					<a href="#" style="margin-left: 500px;"><b>XEM THÊM</b></a>
				</div>
			</div>
		
	  	<div class="col-lg-2" style="width: 240px;">
	  		<div id="right">
				<div class="list-group">
					<a href="#" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">THỐNG KÊ</a>
					<a href="ThongKeNhanLop.jsp" class="list-group-item" style="text-align: center">THỐNG KÊ NHẬN LỚP<img src="image/new.gif"></a>
					<a href="PageServlet?command=LopMoi&pageID=1" class="list-group-item" style="text-align: center">LỚP MỚI CHƯA GIAO<img src="image/hot.gif"></a>
					<a href="PageServlet?command=TaiLieu&pageID=1" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">DOWNLOAD TÀI LIỆU</a>
					<%
						ArrayList<TaiLieu> dsTaiLieu = new TaiLieuDAOImpl().getListTaiLieu();
						for(TaiLieu tl : dsTaiLieu)
						{
					%>
					<a href="#" class="list-group-item"><span class="glyphicon glyphicon-triangle-right" style="color: #F28E11;"></span><%=tl.getTieuDe() %></a>
					<%
						}
					%>
					<a href="PageServlet?command=TuyenDung&pageID=1" class="list-group-item active" style="background-color: #FF8000; text-align: center;color: darkred;font-weight: bold">THÔNG TIN TUYỂN DỤNG</a>
					<%
						ArrayList<TinTuc> dsTuyenDung = new TinTucDAOImpl().getTuyenDung();
						for(TinTuc tin : dsTuyenDung)
						{
					%>
					<a href="#" class="list-group-item">
						<p style="font-weight: 200;font-size: 14px;"><%=tin.getTieuDe() %></p>
					</a>
					<%
						}
					%>
					
					<a href="#" class="list-group-item active" style="background-color: #FF8000;; text-align: center;color: darkred;font-weight: bold">TIN TỨC</a>
					<%
						ArrayList<TinTuc> dsTinTuc = new TinTucDAOImpl().getTinTuc();
						for(TinTuc tin : dsTinTuc )
						{
					%>
					
					<a href="#" class="list-group-item">
						<img src="./ImageServlet?command=TinTuc&maSo=<%=tin.getMaSo()  %>" style="float: left; width: 100px;height:65px;margin-left: -15px;margin-right: 5px;">
						<p style="font-weight: 200;font-size: 12px;"><%=tin.getTieuDe() %></p>
					</a>
					<%
						}
					%>
			  	
				  	

					<br>
					
					 <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FGia-S%25C6%25B0-Tr%25C3%25AD-Vi%25E1%25BB%2587t-613051568814323%2F&tabs=timeline&width=240&height=240&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="240" height="250" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>
					
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
    
    <script type="text/javascript">
  $(document).ready(function(){
	  $("#txtTimLop").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tableLop ul").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
  });
  </script>
</html>
