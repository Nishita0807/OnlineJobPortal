package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.entity.User;
import com.DB.DBConnect;

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String qua=req.getParameter("qua");
			String email=req.getParameter("email");
			String ps=req.getParameter("ps");
			UserDAO dao=new UserDAO(DBConnect.getConn());
			User u=new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qua);
			u.setPassword(ps);
			u.setEmail(email);
			boolean f=dao.updateUser(u);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg","Profile Update Successfully");
				res.sendRedirect("home.jsp");
			}
			else {
				session.setAttribute("succMsg","Something Wrong on Server");
				res.sendRedirect("home.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();		}
	}

}
