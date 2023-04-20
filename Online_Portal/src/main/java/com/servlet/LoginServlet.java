package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String em=req.getParameter("email");
			String ps=req.getParameter("password");
			User u=new User();
			HttpSession session=req.getSession();
			if("admin@gmail.com".equals(em) && "admin@123".equals(ps)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				res.sendRedirect("admin.jsp");
			}
			else {
				UserDAO dao=new UserDAO(DBConnect.getConn());
				
				User user=dao.login(em, ps);
				if(user!=null) {
					session.setAttribute("userobj", user);
					res.sendRedirect("home.jsp");
				}
				else {
					session.setAttribute("succMsg","Invalid Email and Password");
					res.sendRedirect("login.jsp");
					
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
