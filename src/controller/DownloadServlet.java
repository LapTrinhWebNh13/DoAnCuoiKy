package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static int BUFFER_SIZE = 1024 * 100;
	public static final String UPLOAD_DIR = "fileTaiLieu";
	public static String fileName = null;
	
    public DownloadServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		fileName = request.getParameter("fileName");
		if(fileName!=null)
		{
			String applicationPath = getServletContext().getRealPath("");
			String downloadPath = applicationPath+File.separator+UPLOAD_DIR;
			String filePath = downloadPath + File.separator + fileName;
			File file = new File(filePath);
			OutputStream outStream = null;
			InputStream inputStream = null;
			if(file.exists())
			{
				String mimeType = "application/octec-stream";
				response.setContentType(mimeType);
				
				String headerKey = "Content-Disposition";
				String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
				response.setHeader(headerKey, headerValue);
				try
				{
					outStream = response.getOutputStream();
					inputStream = new FileInputStream(file);
					byte[] buffer = new byte[BUFFER_SIZE];
					int byteRead = -1;
					while((byteRead=inputStream.read(buffer)) != -1)
					{
						outStream.write(buffer, 0, byteRead);
					}
				}
				catch (IOException ioe)
				{
					System.out.println(ioe);
				}
				finally
				{
					if(inputStream != null)
					{
						inputStream.close();
					}
					outStream.flush();
					if(outStream != null)
					{
						outStream.close();
					}
				}
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
