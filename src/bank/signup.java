package bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;


/**
 * Servlet implementation class signupservlet
 */
@WebServlet("/registration")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("name");
		String email = request.getParameter("email"); 
		String phonenumber = request.getParameter("phone"); 
		String aadharnumber=request.getParameter("aadhar");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String gender=request.getParameter("gender");
		Acc account1=new Acc(username,password,gender,aadharnumber,address,phonenumber,email);
	//	RequestDispatcher dispatcher = null;
		Connection con = null;
		try {
			int c= accountdao.createaccount(account1);
			response.sendRedirect("signup.jsp");
			//dispatcher = request.getRequestDispatcher("/signin.jsp");
			if(c>0)
			{
				request.setAttribute("status","success");
				
			}
			else
			{
				request.setAttribute("status","failed");
			}
			}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}


}