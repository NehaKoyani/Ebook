package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			String bookname= req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories =req.getParameter("categories");
			String tcategories =req.getParameter("tcategories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			BookDtls b= new BookDtls(bookname,author,price,categories,tcategories,status,fileName,"admin");
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			
			
			boolean f = dao.addBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				String path = getServletContext().getRealPath("")+"book";
				
				File file =new File(path);
				
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Book Add Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
