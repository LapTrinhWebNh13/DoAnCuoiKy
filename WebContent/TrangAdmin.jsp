<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ page import = "model.TaiLieu" %>
	<%@ page import = "dao.TaiLieuDAOImpl" %>
	<%@ page import = "model.TinTuc" %>
	<%@ page import = "dao.TinTucDAOImpl" %>
	<%@ page import = "model.LopDK" %>
	<%@ page import = "dao.HoaDonDAOImpl" %>
	<%@ page import = "model.HoaDon" %>
	<%@ page import = "dao.LopDAOImpl" %>
	<%@ page import = "model.Lop" %>
	<%@ page import = "dao.GiaSuDAOImpl" %>
	<%@ page import = "model.GiaSu" %>
	<%@ page import = "dao.PhuHuynhDAOImpl" %>
	<%@ page import = "model.PhuHuynh" %>
	<%@ page import = "java.util.*" %>
<title>Trang Admin</title>
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
	<a href="DangNhap.jsp" style="margin-left: 1050px;color: white">Thoát</a>
	<a href="DoiMK.jsp" style="margin-left: 20px;color: white" >Đổi mật khẩu</a>
	<div id="menu" style=" margin-left: 50px;margin-top: 10px">
		
		<div class="tab" >
		  
		  <button class="tablinks" onclick="openCity(event, 'Phụ Huynh')" id="defaultOpen">PHỤ HUYNH</button>
		  <button class="tablinks" onclick="openCity(event, 'Gia Sư')">GIA SƯ</button>
		  <button class="tablinks" onclick="openCity(event, 'Lớp Học')">LỚP HỌC</button>
		  <button class="tablinks" onclick="openCity(event, 'Hóa đơn')">HÓA ĐƠN</button>
		  <button class="tablinks" onclick="openCity(event, 'Phê duyệt lớp')">PHÊ DUYỆT LỚP</button>
		  <button class="tablinks" onclick="openCity(event, 'Đăng Tin')">ĐĂNG TIN</button>
		
		</div>
		<div id ="main" style="background-color: white">

			<div id="Phụ Huynh" class="tabcontent">
				<h2 class="text-center">DANH SÁCH PHỤ HUYNH</h2>
				
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-7">
							<form action="PhuHuynhServlet?command=search" method="post">
								<div class="input-group">
									<!-- <input type="text" list="dsTen" class="form-control" name="ten" placeholder="Nhập tên phụ huynh cần tìm">  -->
									<input type="text" id="txtTimPH"  class="form-control" name="ten" placeholder="Tìm kiếm..."> 
									<div class="input-group-btn">
											<button class="btn btn-default" type="submit" style="font-size: 20px" >
												<i class="glyphicon glyphicon-search"></i>
											</button>
									</div>
								</div>
							</form>
							
							
							<%-- <%
								Set<String> dsTen =new PhuHuynhDAOImpl().getDanhSachTheoTen();
							%>
							
							<datalist id="dsTen">
								<%
									for(String a: dsTen)
									{
								%>
								<option value="<%=a %>"><%=a %></option>
								<%
									}
								%>
							</datalist> --%>
						</div>
						<div class="col-sm-2">
							<a href="PhuHuynhServlet?command=new"><input type="submit" name="submit" value="Thêm PH" /></a>
						</div>
						<div class="col-sm-1"></div>
					</div>
				</div>
				<br>
				<%
					ArrayList<PhuHuynh> dsPH = new PhuHuynhDAOImpl().getListPhuHuynh();
					
				%>
				<table>
					<tr>
						<th>Mã PH</th>
						<th>Họ tên</th>
						<th>Địa chỉ</th>
						<th>Số ĐT</th>
						<th>Email</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>

					<%
						for(int i=0;i<dsPH.size();i++)
						{
					%>
					<tbody id="tablePhuHuynh">
					<tr>
						<td><%=dsPH.get(i).getMaPH() %></td>
						<td><%=dsPH.get(i).getHoTen() %></td>
						<td><%=dsPH.get(i).getDiaChi() %></td>
						<td><%=dsPH.get(i).getDienThoai() %></td>
						<td><%=dsPH.get(i).getEmail() %></td>				
						<td><a href="PhuHuynhServlet?command=edit&maPH=<%=dsPH.get(i).getMaPH() %>"><input type="submit" name="btnSua" value="Sửa" style="width: 100%" /></a></td>
						<td><a href="PhuHuynhServlet?command=delete&maPH=<%=dsPH.get(i).getMaPH() %>"><input type="submit" name="btnXoa" value="Xóa" style="width: 100%" /></a></td>
					</tr>
					<% 
							}
					%>
					</tbody>
				</table>
				
			</div>



		<div id="Gia Sư" class="tabcontent">
		  <h2 class="text-center">DANH SÁCH GIA SƯ</h2>
			<div class="container-fluid">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-7">

							<form action="GiaSuServlet?command=search" method="post">
								<div class="input-group">
									<!-- <input type="text" list="dsTen" class="form-control" name="ten" placeholder="Nhập tên gia sư cần tìm">  -->
									<input type="text" id="txtTimGS" list="dsTen" class="form-control" name="ten" placeholder="Tìm kiếm..."> 
									<div class="input-group-btn">
											<button class="btn btn-default" type="submit" style="font-size: 20px" >
												<i class="glyphicon glyphicon-search"></i>
											</button>
									</div>
								</div>
							</form>
							
							
							<%-- <%
								Set<String> dsTenGS =new GiaSuDAOImpl().getDanhSachTheoTen();
							%>
							
							<datalist id="dsTen">
								<%
									for(String a: dsTenGS)
									{
								%>
								<option value="<%=a %>"><%=a %></option>
								<%
									}
								%>
							</datalist> --%>

						</div>
						<div class="col-sm-2">
							<a href="GiaSuServlet?command=new"><input type="submit" name="submit" value="Thêm GS" /></a>
						</div>
						<div class="col-sm-1"></div>
					</div>
				</div>
		  		<br>
		  		<%
			  		ArrayList<GiaSu> dsGS = new GiaSuDAOImpl().getListGiaSu();
					/* ArrayList<GiaSu> dsLocGS = (ArrayList<GiaSu>) session.getAttribute("dsLocGS");
					
					if(session.getAttribute("dsLocGS") != null)
					{
						dsGS = dsLocGS;
					} */
		  		%>
				<table>
					<tr>
					    <th>Mã GS</th>
					    <th>Họ tên</th>
					    <th>Ngày sinh</th>
					    <th>Giới tính</th>
					    <th>Địa chỉ</th>
					    <th>Số ĐT</th>
					    <th>Nghề nghiệp</th>
					    <th>Sửa </th>
					    <th>Xóa</th>
					    <th>Chi tiết</th>
					  </tr>
					  
					  <%
					  		for(int i=0;i<dsGS.size();i++)
							{
						%>
					  <tbody id="tableGiaSu">
					  <tr>
					    <td><%=dsGS.get(i).getMaGS() %></td>
					    <td><%=dsGS.get(i).getHoTen() %></td>
					    <td><%=dsGS.get(i).getNgaySinh() %></td>
					    <td><%=dsGS.get(i).getGioiTinh() %></td>
					    <td><%=dsGS.get(i).getDiaChi() %></td>
					    <td><%=dsGS.get(i).getDienThoai() %></td>
					    <td><%=dsGS.get(i).getNgheNghiep() %></td>
					    <td><a href="GiaSuServlet?command=edit&maGS=<%=dsGS.get(i).getMaGS() %>"><input type="submit" name="btnSua" value="Sửa" style="width: 100%" /></a></td>
						<td><a href="GiaSuServlet?command=delete&maGS=<%=dsGS.get(i).getMaGS() %>"><input type="submit" name="btnXoa" value="Xóa" style="width: 100%" /></a></td>
						<td><a href="GiaSuServlet?command=detail&maGS=<%=dsGS.get(i).getMaGS() %>"><input type="submit" name="btnChiTiet" value="Xem" style="width: 100%" /></a></td>
					  </tr>
					  <%
							}
					  %>
					  </tbody>
				</table>
		</div>

		<div id="Lớp Học" class="tabcontent">
		  <h2 class="text-center">DANH SÁCH LỚP</h2>
		  <div class="container-fluid">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
						<form action="LopServlet?command=search" method="post">
							<div class="input-group">
								<!-- <input type="text" list="dsMaLop" class="form-control" name="ma" placeholder="Nhập mã lớp cần tìm"> -->
								<input type="text" id="txtTimLop" class="form-control" name="ma" placeholder="Tìm kiếm...">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit" style="font-size: 20px">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>

							<%-- <%
								Set<String> dsMaLop = new LopDAOImpl().getDanhSachTheoMaLop();
							%>
							<%
							 
							%>

							<datalist id="dsMaLop">
							 <%
							 	for (String a : dsMaLop) {
							 %>
							<option value="<%=a%>"><%=a%></option>
							<%
								}
							%>
							 </datalist>  --%>

						</div>
					<div class="col-sm-2">
						<a href="LopServlet?command=new">
							<input type="submit" name="submit" value="Thêm Lớp" />
						</a>
					</div>
					<div class="col-sm-1"></div>
				</div>
		</div>
				<%
					ArrayList<Lop> dsLop = new LopDAOImpl().getListLop();
					/* ArrayList<Lop> dsLocLop = (ArrayList<Lop>) session.getAttribute("dsLocLop");
					
					if(session.getAttribute("dsLocLop") != null)
					{
						dsLop = dsLocLop;
					} */
				%>
		  		<br>
				<table>
					<tr>
					    <th>Mã lớp</th>
					    <th>Mã PH</th>
					    <th>Lớp dạy</th>
					    <th>Thời gian</th>
					    <th>Địa chỉ</th>
					    <th>Lương</th>
					    <th>Mức phí</th>
					    <th>Trạng thái</th>
					    <th>Sửa </th>
					    <th>Xóa </th>
					    
					  </tr>
					  
					  <%
					  		for(int i=0; i<dsLop.size();i++)
					  		{
					  %>
					  <tbody id="tableLop">
					  <tr>
					    <td><%=dsLop.get(i).getMaLop() %></td>
					    <td><%=dsLop.get(i).getMaPH() %></td>
					    <td><%=dsLop.get(i).getLopDay() %></td>
					    <td><%=dsLop.get(i).getThoiGianDay() %></td>
					    <td><%=dsLop.get(i).getDiaChi() %></td>
					    <td><%=dsLop.get(i).getLuong() %></td>
					    <td><%=dsLop.get(i).getMucPhi() %> %</td>
					    <%
					    	if(dsLop.get(i).getTrangThai()==1)
					    	{
					    %>
					    <td>Lớp mới</td>
					    <%
					    	}
					    	else if(dsLop.get(i).getTrangThai()==2)
					    	{
					    %>
					    <td>Đã giao</td>
					    <%
					    	}
					    %>
					    <td><a href="LopServlet?command=edit&maLop=<%=dsLop.get(i).getMaLop() %>"><input type="submit" name="btnSua" value="Sửa" style="width: 100%" /></a></td>
						<td><a href="LopServlet?command=delete&maLop=<%=dsLop.get(i).getMaLop() %>"><input type="submit" name="btnXoa" value="Xóa" style="width: 100%" /></a></td>
					  </tr>
					 <%
					  		}
					 %>
						</tbody>
				</table>
		</div>
		<div id="Hóa đơn" class="tabcontent">
		  	<h2 class="text-center">DANH SÁCH HÓA ĐƠN</h2>
		  <div class="container-fluid">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
						<form action="HoaDonServlet?command=search" method="post">
							<div class="input-group">
								<!-- <input type="date"  class="form-control" name="txtTimKiem" placeholder="Nhập ngày lập hóa đơn cần tìm"> -->
								<input type="text" id="txtTimHD"  class="form-control" name="txtTimKiem" placeholder="Tìm kiếm...">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit"
										style="font-size: 20px">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
						</div>
					<div class="col-sm-2">
						
					</div>
					<div class="col-sm-1"></div>
				</div>
		</div>
				<%
						ArrayList<HoaDon> dsHD = new HoaDonDAOImpl().getListHoaDon();	
						
						/* ArrayList<HoaDon> dsLocHD = (ArrayList<HoaDon>) session.getAttribute("dsLocHD");
						if(session.getAttribute("dsLocHD") != null)
						{
							dsHD = dsLocHD;
						} */
				%>
		  		<br>
				<table>
					<tr>
					    <th>Mã hóa đơn</th>
					    <th>Mã lớp</th>
					    <th>Mã gia sư</th>
					    <th>Tiền lệ phí</th>
					    <th>Thời gian</th>
					    <th>Xóa</th>
					  </tr>
					  <%
					  		for(int i=0; i<dsHD.size();i++)
					  		{  			
					  %>
					  <tbody id="tableHoaDon">
					  <tr>
					    <td><%=dsHD.get(i).getMaHD() %></td>
					    <td><%=dsHD.get(i).getMaLop() %></td>
					    <td><%=dsHD.get(i).getMaGS() %></td>
					    <td><%=dsHD.get(i).getTienLePhi() %></td>
					    <td><%=dsHD.get(i).getThoiGian() %></td>
						<td><a href="HoaDonServlet?command=delete&maHD=<%=dsHD.get(i).getMaHD() %>"><input type="submit" name="btnXoa" value="Xóa" style="width: 100%" /></a></td>
					  </tr>
					 <%
					  		}
					 %>
					 </tbody>
				</table>
		</div>
		
		<div id="Phê duyệt lớp" class="tabcontent">
		  	<h2 class="text-center">DANH SÁCH LỚP CẦN PHÊ DUYỆT</h2>
		  	<table>
		  	<%
		  		ArrayList<LopDK> dsLopDK = new HoaDonDAOImpl().getListDangKy();
		  	%>
					<tr>
					    <th>Mã lớp</th>
					    <th>Lớp dạy</th>
					    <th>Yêu cầu</th>
					    <th>Mã gia sư</th>
					    <th>Họ tên GS</th>
					    <th>Trình độ</th>
					    <th>Phê duyệt</th>
					  </tr>
					  <%
					  		for(LopDK ds : dsLopDK)
					  		{
					  %>
					  <tr>
					    <td><%=ds.getLop().getMaLop() %></td>
					    <td><%=ds.getLop().getLopDay() %></td>
					    <td><%=ds.getLop().getYeuCau() %></td>
					    <td><%=ds.getGs().getMaGS() %></td>
					    <td><%=ds.getGs().getHoTen() %></td>
					    <td><%=ds.getGs().getTrinhDo() %></td>
						<td><a href="HoaDonServlet?command=insert&maLop=<%=ds.getLop().getMaLop() %>&maGS=<%=ds.getGs().getMaGS() %>"><input type="submit" name="btnPheDuyet" value="OK" style="width: 100%" /></a></td>
					  </tr>
					 <%
					  		}
					 %>
				</table>
				
				
		</div>
		<div id="Đăng Tin" class="tabcontent" style="text-align: center;">
		  <h2 style="color:  #4CAF50;">DANH SÁCH CÁC TIN TỨC VÀ TÀI LIỆU</h2>
		  <div class="container-fluid">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
						<form action="HoaDonServlet?command=search" method="post">
							<div class="input-group">
								<input type="text" id="txtTinTuc"  class="form-control" name="txtTimKiem" placeholder="Tìm kiếm...">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit" style="font-size: 20px">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
						</div>
					<div class="col-sm-2">
						<a href="#ThemTaiLieu"><input class="btn-success" type="submit" name="submit" value="Thêm tài liệu" /></a>
					</div>
					<div class="col-sm-1">
						<a href="#ThemTinTuc"><input class="btn-danger" type="submit" name="submit" value="Thêm tin tức" /></a>
					</div>
				</div>
		  </div>
		  		<br>
		  		<%
		  			ArrayList<TinTuc> dsTinTuc = new TinTucDAOImpl().getListTinTuc();
		  			ArrayList<TaiLieu> dsTaiLieu = new TaiLieuDAOImpl().getListTaiLieu();
		  		%>
				<table>
					<tr>
					    <th>Tên tiêu đề</th>
					    <th>Loại</th>
					    <th>Xóa</th>
					  </tr>
					  
					  <tbody id="tableTinTuc">
					  <%
					  	for(TinTuc tin: dsTinTuc)
					  	{
					  %>
					  <tr>
					    <td><%=tin.getTieuDe() %></td>
					    <%
					    	if(tin.getLoai()==1){
					    %>
					    <td>Tin tức</td>
					    <%
					    	}
					    	else if (tin.getLoai()==2)
					    	{
					    %>
					    <td>Tuyển dụng</td>
					    <%
					    	}
					    %>
						<td><a href="TaiLieuServlet?command=deleteTinTuc&maSo=<%=tin.getMaSo() %>"><input type="submit" name="btnXoa" value="Xóa" style="width: 100%" /></a></td>
					  </tr>
					<%
					  	}
					  	for(TaiLieu tl : dsTaiLieu)
					  	{
					%>
					<tr>
						<td><%=tl.getTieuDe() %></td>
						<td>Tài liệu</td>
						<td><a href="TaiLieuServlet?command=deleteTaiLieu&maSo=<%=tl.getMaSo() %>"><input type="submit" name="btnXoa" value="Xóa" style="width: 100%" /></a></td>
					<%
					  	}
					%>
					</tr>
					 </tbody>
				</table>
		  
			<br><br><br>
			<div class="container-fluid">
			  
			  <div class="row">
			  	<div class="col-sm-12" id=ThemTaiLieu>
			      <form action="UploadServlet" name="DKTGS" id="FormDKTGS" method="post" style="text-align: left" enctype="multipart/form-data">
		  				<center><h3>THÊM TÀI LIỆU</h3></center>
		  				<div class="row">
								<label for="hoten" style="display: inline;padding-left: 0px;">Tiêu đề (<span class="red">*</span>)</label> 
								<input type="text" name="txtTieuDeTL" placeholder="Tiêu đề..." required style="width: 100%;"/>
							</div>
							<div class="row">
								<label for="hoten" style="display: inline;padding-left: 0px;">Nội dung (<span class="red">*</span>)</label> 
								<input type="file" name="file" id="myFile" required style="width: 80%;"><br>
							</div>
							<div class="submit">
								<input type="submit" value="UPLOAD">
							</div>
							<br><br><br>
					</form>
			    </div>
			    <div class="col-sm-12"  id="ThemTinTuc">
			      <form action="TaiLieuServlet?command=insertTinTuc" name="DKTGS" id="FormDKTGS" method="post" style="text-align: left" enctype="multipart/form-data">
		  				<center><h3>THÊM TIN TỨC</h3></center>
		  					<div class="row" >
		  						<label for="hoten" style="display: inline;padding-left: 0px;">Loại tin tức (<span class="red">*</span>)</label>
		  						<select name="txtLoai" style="width: 100%;">
		  							<option value="1">Tin tức</option>
		  							<option value="2">Thông báo tuyển dụng</option>
		  						</select>
		  					</div>
		  					<div class="row" >	
								<label for="hoten" style="display: inline;padding-left: 0px;">Tiêu đề (<span class="red">*</span>)</label> 
								<input type="text" name="txtTieuDeTT" placeholder="Tiêu đề..." required style="width: 100%;"/>
							</div>
							<div class="row">
								<label for="diachi" style="display: inline;padding-left: 0px;">Nội dung (<span class="red">*</span>)</label> 
								<textarea  name="txtNDTinTuc" placeholder="Nội dung..." style="height:300px; width: 100%;"></textarea>
								<!-- <input type="text" name="txtNDTinTuc" placeholder="Nội dung..." required style="width: 100%;"/> -->
							</div>
							<div class="row">
								<label for="anhthe">Hình ảnh(<span class="red">*</span>)</label> 
								<input type="file" name="picHinhAnh" id="image" required="required">					
							</div>
							<div class="submit">
								<input type="submit" value="LƯU">
							</div>
							<br><br><br>
					</form>
					<br><br><br>
			    </div>
			    
			    
			  </div>
			</div>
			
		</div>
		
	</div>
		</div>
		
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

<script>
$(document).ready(function(){
  $("#txtTimPH").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tablePhuHuynh tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  $("#txtTimGS").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tableGiaSu tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
  $("#txtTimLop").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tableLop tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
  $("#txtTimHD").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tableHoaDon tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
  $("#txtTinTuc").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tableTinTuc tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
});
</script>
</html>