package com.servlet;
import com.dao.*;
import com.DB.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteJobServlet
 * 
 */
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			JobDAO dao=new JobDAO(DBConnect.getConn());
			boolean f=dao.deleteJobs(id);
			HttpSession session=req.getSession();
			
			
			
			if(f) {
				
				session.setAttribute("succMsg","Job Delete Successfully");
				res.sendRedirect("view_jobs.jsp");
			}
			else {
				session.setAttribute("succMsg","Something wrong on server");
				res.sendRedirect("view_jobs.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
