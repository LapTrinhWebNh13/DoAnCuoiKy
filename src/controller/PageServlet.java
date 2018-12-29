package controller;

import java.io.IOException;

import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GiaSuDAOImpl;
import dao.LopDAOImpl;
import dao.TaiLieuDAOImpl;
import dao.TinTucDAOImpl;
import model.GiaSu;
import model.Lop;
import model.TaiLieu;
import model.TinTuc;


@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		System.out.println(command);
		
		try {
			switch(command)
			{
			case "LopMoi":			
				phanTrangLopMoi(request, response);
				break;
			case "TuyenDung":			
				phanTrangTuyenDung(request, response);
				break;
			case "TaiLieu":
				phanTrangTaiLieu(request, response);
				break;
			case "GiaSu":
				phanTrangGiaSu(request, response);
				break;
			case "ThongKe":
				break;
			default:
				break;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void phanTrangLopMoi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pageIDStr = request.getParameter("pageID");
		int pageID = Integer.parseInt(pageIDStr);
		int count =20;
		if(pageID==1)	//ko phan trang
		{
			
		}
		else	//phan trang
		{
			pageID = pageID - 1;
			pageID = pageID * count + 1;
		}
		
		List<Lop> list = LopDAOImpl.DisplayLop(pageID-1, count);
		int sumRow = LopDAOImpl.CountRow();
		int maxpageid= (sumRow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("listLop", list);
		request.setAttribute("numberpage", Integer.parseInt(pageIDStr));
		
		RequestDispatcher rd = request.getRequestDispatcher("LopMoiChuaGiao.jsp");
		rd.forward(request, response);
	}
	public void phanTrangTuyenDung(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pageIDStr = request.getParameter("pageID");
		int pageID = Integer.parseInt(pageIDStr);
		int count =20;
		if(pageID==1)	//ko phan trang
		{
			
		}
		else	//phan trang
		{
			pageID = pageID - 1;
			pageID = pageID * count + 1;
		}
		
		List<TinTuc> list = TinTucDAOImpl.DisplayTinTuc(pageID-1, count);
		int sumRow = TinTucDAOImpl.CountRow();
		int maxpageid= (sumRow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("listTuyenDung", list);
		request.setAttribute("numberpage", Integer.parseInt(pageIDStr));
		
		RequestDispatcher rd = request.getRequestDispatcher("TuyenDung.jsp");
		rd.forward(request, response);
	}

	public void phanTrangTaiLieu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pageIDStr = request.getParameter("pageID");
		int pageID = Integer.parseInt(pageIDStr);
		int count =20;
		if(pageID==1)	//ko phan trang
		{
			
		}
		else	//phan trang
		{
			pageID = pageID - 1;
			pageID = pageID * count + 1;
		}
		
		List<TaiLieu> list = TaiLieuDAOImpl.DisplayTaiLieu(pageID-1, count);
		int sumRow = TaiLieuDAOImpl.CountRow();
		int maxpageid= (sumRow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("listTaiLieu", list);
		request.setAttribute("numberpage", Integer.parseInt(pageIDStr));
		
		RequestDispatcher rd = request.getRequestDispatcher("DownloadTaiLieu.jsp");
		rd.forward(request, response);
	}
	public void phanTrangGiaSu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pageIDStr = request.getParameter("pageID");
		int pageID = Integer.parseInt(pageIDStr);
		int count =12;
		if(pageID==1)	//ko phan trang
		{
			
		}
		else	//phan trang
		{
			pageID = pageID - 1;
			pageID = pageID * count + 1;
		}
		
		List<GiaSu> list = GiaSuDAOImpl.DisplayGiaSu(pageID-1, count);
		int sumRow = GiaSuDAOImpl.CountRow();
		int maxpageid= (sumRow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("listGiaSu", list);
		request.setAttribute("numberpage", Integer.parseInt(pageIDStr));
		
		RequestDispatcher rd = request.getRequestDispatcher("GiaSu.jsp");
		rd.forward(request, response);
	}

}
