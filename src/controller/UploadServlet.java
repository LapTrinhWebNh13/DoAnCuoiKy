package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import connect.DBConnect;


@WebServlet("/UploadServlet")

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10,
maxRequestSize = 1024 * 1024 * 50)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	PrintWriter out = null;
	Connection conn = null;
	PreparedStatement ps = null;
	HttpSession session = null;
   
    public UploadServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
		try
		{
			out = response.getWriter();
			session = request.getSession(false);
			String folderName = "fileTaiLieu";
			//String uploadPath = request.getServletContext().getRealPath("")+folderName;
			String uploadPath = "D:/LapTrinhWeb/Project_DoAnCuoiKy/WebContent/"+folderName;
			System.out.println(uploadPath);
			File dir = new File(uploadPath);
			if(!dir.exists())
			{
				dir.mkdirs();
			}
			Part filePart = request.getPart("file");
			String tieuDe = request.getParameter("txtTieuDeTL");
			/*String fileName = filePart.getSubmittedFileName();
			System.out.println(fileName);*/
			String fileName = extractFileName(filePart);
           
			String path = folderName + File.separator +fileName;
			/*Timestamp added_date = new Timestamp(System.currentTimeMillis());*/
			
			InputStream is = filePart.getInputStream();
			Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
			try
			{
				conn = DBConnect.getConnection();
				String sql = "insert into TAILIEU(TieuDe, FileName, Path) values(?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, tieuDe);
				ps.setString(2, fileName);
				ps.setString(3, path);
				int status = ps.executeUpdate();
				if(status > 0)
				{
					session.setAttribute("fileName", fileName);
					String msg = ""+ fileName + "File uploaded successfully...";
					request.setAttribute("msg", msg);
					RequestDispatcher rd = request.getRequestDispatcher("/TrangAdmin.jsp");
					rd.forward(request, response);
				}
			}
			catch (SQLException e)
			{
				System.out.println(e);
			}
			finally
			{
				try
				{
					if(ps!=null)
					{
						ps.close();
					}
					if(conn!= null)
					{
						conn.close();
					}
				}
				catch (SQLException e)
				{
					System.out.println(e);
				}
			}
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private String extractFileName(Part part) {
	       // form-data; name="file"; filename="C:\file1.zip"
	       // form-data; name="file"; filename="C:\Note\file2.zip"
	       String contentDisp = part.getHeader("content-disposition");
	       String[] items = contentDisp.split(";");
	       for (String s : items) {
	           if (s.trim().startsWith("filename")) {
	               // C:\file1.zip
	               // C:\Note\file2.zip
	               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
	               clientFileName = clientFileName.replace("\\", "/");
	               int i = clientFileName.lastIndexOf('/');
	               // file1.zip
	               // file2.zip
	               return clientFileName.substring(i + 1);
	           }
	       }
	       return null;
	   }

}
