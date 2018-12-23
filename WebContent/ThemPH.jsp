<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Trang Thêm Phụ Huynh</title>
	<%@ page import = "dao.PhuHuynhDAOImpl" %>
	<%@ page import = "model.PhuHuynh" %>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	<link rel="stylesheet" type="text/css" href="css/CSS_ThemPH.css">
 	
 	<script>
		$(document).ready(function()
		{
			function validateEmail(sEmail)
			{
	   			 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	   			
	   			 if(filter.test(sEmail))
	   			 {
	   				return true;
	   			 }
	   			 return false;
			}
			
			function validateSDT(sdt)
			{
				var filter = /^[0-9]+$/;
				
	   			 if(filter.test(sdt) && sdt.length>=10 && sdt.length<12)
	   			 {
	   				return true;
	   			 }
	   			 return false;
	   			 
			}
			
			function validatePassword(str)
			{
				var message ="";
				var passwordRegex = /[a-z]/g; //chua ky tu thuong
				var passwordRegex2 = /[A-Z]/g;//chua ky tu hoa
				var passwordRegex3 = /[0-9]/g;//chua so
				if(str.match(passwordRegex) && str.match(passwordRegex2) && str.match(passwordRegex3) && str.length >6)
				{
					return true;
				}
				return false;
			}
			
			$('#FormDKTGS').bind({
				'submit':function()
				{
					if(!validateEmail($('#email').val())){
						$('#error_mail').html('Email bạn nhập không hợp lệ. Vui lòng nhập lại!!');
						return false;
					}
					if(!validatePassword($('#password').val())){
						$('#error_pass').html('Mật khẩu phải ít nhất 6 ký tự, bao gồm chữ hoa và chữ thường!!');
						return false;
					} 
					
					if(!validateSDT($('#sodienthoai').val())){
						$('#error_sdt').html('Số điện thoại bạn nhập không hợp lệ. Vui lòng nhập lại!!');
						return false;
					} 
					if(!validatePassword($('#tendangnhap').val())){
						$('#error_tendn').html('Tên đăng nhập phải có ít nhất 6 ký tự, bao gồm chữ hoa, chữ thường và số. Vui lòng nhập lại!!');
						return false;
					} 
					return true;
				},
				'change':function()
				{
					$('#password').change(function() {
						if(!validatePassword($('#password').val())){
							$('#error_pass').html('Mật khẩu phải ít nhất 6 ký tự, bao gồm chữ hoa và chữ thường!!');
						}
						else{
							$('#error_pass').html('');
						}
					});
					
					$('#email').change(function() {
						if(!validateEmail($('#email').val())){
							$('#error_mail').html('Email bạn nhập không hợp lệ. Vui lòng nhập lại!!');
						}
						else{
							$('#error_mail').html('');
						}
					});
					
					$('#sodienthoai').change(function() {
						if(!validateSDT($('#sodienthoai').val())){
							$('#error_sdt').html('Số điện thoại bạn nhập không hợp lệ. Vui lòng nhập lại!!');
						}
						else{
							$('#error_sdt').html('');
						}
					});
					$('#tendangnhap').change(function() {
						if(!validatePassword($('#tendangnhap').val())){
							$('#error_tendn').html('Tên đăng nhập phải có ít nhất 6 ký tự, bao gồm chữ hoa, chữ thường và số. Vui lòng nhập lại!!');
						} 
						else{
							$('#error_tendn').html('');
						}
					});
				}
			});
		});

</script>

<script language="Javascript" type="text/javascript">
            function createRequestObject() {
                var tmpXmlHttpObject;

                if (window.XMLHttpRequest) {
                    tmpXmlHttpObject = new XMLHttpRequest();

                } else if (window.ActiveXObject) {
                    tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }

                return tmpXmlHttpObject;
            }
            var http = createRequestObject();
            function makeGetRequest(wordId) {
                var wordId = document.forms["DKTGS"]["txtTenDangNhap"].value;
                http.open('get', 'existTenDangNhap.jsp?command=new&txtTenDangNhap=' + wordId);
                http.onreadystatechange = processResponse;
                http.send(null);
            }

            function processResponse() {
                if (http.readyState == 4 && http.status == 200) {
                    var response = http.responseText;
                    document.getElementById("description").style.color = "red";
                    
                    document.getElementById('description').innerHTML = '<center><strong><span>'+response+'</span></strong></center>';
                }

            }
        </script>
</head>
<body>

		<%
			PhuHuynhDAOImpl phuHuynhDAO =new PhuHuynhDAOImpl();
			
		%>
		
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
	<div id="menu" style="  background-color: #dddddd;margin-left: 50px;margin-top: 10px">
		<div id ="main" style="background-color: white">
		<br>
		<h3 style="margin-left: 300px;font-size: 30px;">Thêm thông tin phụ huynh</h3>
		<div>
			
			
		  
		  <div class="panel-body" style="margin-left: 100px">
		  <%
		  		String maPH = request.getParameter("maPH");
		  		PhuHuynh ph = phuHuynhDAO.getPhuHuynh(maPH);
		  		if(maPH == null)
		  		{		  			
		   %>
		  			<!-- <form action="PhuHuynhServlet/Them>" name="DKTGS" id="FormDKTGS" method="post"> -->
		  			<form action="PhuHuynhServlet?command=insert&maPH=<%=maPH %>" name="DKTGS" id="FormDKTGS" method="post">
		  				<div class="row">
								<label for="hoten">Họ tên (<span class="red">*</span>)
								</label> <input type="text" name="txtHoTen" id="name"placeholder="Nguyễn Văn A" required >
							</div>
							<div class="row">
								<label for="diachi">Địa chỉ (<span class="red">*</span>)
								</label> <input type="text" name="txtDiaChi" id="diachi"
									placeholder="Phường 13, Q.Tân Bình, TP.HCM" required >
							</div>
							<div class="row">
								<label for="dienthoai">Điện thoại (<span class="red">*</span>)</label>							
								<input type="text" name="txtDienThoai" id="sodienthoai" placeholder="0923456723" required maxlength="11">
								<center><strong><span class="red" id="error_sdt"></span></strong></center>
								
							</div>
							<div class="row">
								<label for="email">Email (<span class="red">*</span>)</label> 
								<input type="text" name="txtEmail" id="email" placeholder="abc@gmail.com" required >
								<center><strong><span class="red" id="error_mail"></span></strong></center>
								
							</div>
							<h4 style="text-align: center">TẠO TÀI KHOẢN LOGIN</h4>
							<div class="row">
								<label for="diachi">Tên đăng nhập (<span class="red">*</span>)</label>
								<input type="text" name="txtTenDangNhap" id="tendangnhap" onblur="makeGetRequest()" required/><br>
								<div id="description"></div>
								<center><strong><span class="red" id="error_tendn"></span></strong></center>
							</div>
							<div class="row">
								<label for="diachi">Mật khẩu (<span class="red">*</span>)</label> 
								<input name="txtMatKhau" type="password" required  id="password">
								<center><strong><span class="red" id="error_pass"></span></strong></center>
								
							</div>
							<div class="submit">
								<input type="submit" value="LƯU">
							</div>
					</form>
		  	<%
		  		}
		  		else if(maPH != null)
		  		{
		  	%>
						<form action="PhuHuynhServlet?command=update&maPH=<%=maPH %>" name="DKTGS" id="FormDKTGS" method="post">
						<!-- <form action="PhuHuynhServlet/Them>" name="DKTGS" id="FormDKTGS" method="post"> -->
							<div class="row">
								<label for="hoten">Họ tên (<span class="red">*</span>)
								</label> <input type="text" name="txtHoTen" id="name"
									placeholder="Nguyễn Văn A" required value="<%=ph.getHoTen() %>">
							</div>
							<div class="row">
								<label for="diachi">Địa chỉ (<span class="red">*</span>)
								</label> <input type="text" name="txtDiaChi" id="diachi" placeholder="Phường 13, Q.Tân Bình, TP.HCM" required value="<%=ph.getDiaChi() %>">
							</div>
							<div class="row">
								<label for="dienthoai">Điện thoại (<span class="red">*</span>)</label> 
								<input type="text" name="txtDienThoai" id="sodienthoai" placeholder="0923456723" required maxlength="11" value="<%=ph.getDienThoai() %>">
								<center><strong><span class="red" id="error_sdt"></span></strong></center>
							</div>
							<div class="row">
								<label for="email">Email (<span class="red">*</span>)</label> 
								<input type="text" name="txtEmail" id="email" placeholder="abc@gmail.com" required value="<%=ph.getEmail() %>">
								<center><strong><span class="red" id="error_mail"></span></strong></center>
							</div>
							<div class="submit">
								<input type="submit" value="LƯU">
							</div>
							</form>
						
			<%
		  		}
  			%>						
						
		</div>
		
	</div>
</div>
</div>


</body>

</html>