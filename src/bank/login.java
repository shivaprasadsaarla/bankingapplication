package bank;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        String loginType = request.getParameter("loginType");
        if (loginType != null && loginType.equals("employee")) {
        	if( email.equals("manager@gmail.com") && password.equals("manager123"))
        	{
        		            response.sendRedirect("home2.jsp");
            return;
        	}
            else {
            	request.setAttribute("status", "failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);  
        
        }
        }
       
        
       //.email connn = null;
        if (loginType != null && loginType.equals("customer")){
        try {
        	Connection connn=Db.connect();
            PreparedStatement pst = connn.prepareStatement("select * from accounts where email=? and password=?");
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
            	String name = rs.getString("username");
                String phone = rs.getString("phonenumber");
                String aadhaar = rs.getString("aadharnumber");
                String address = rs.getString("address");
                int accn = rs.getInt("accn");
                String gender = rs.getString("gender");
                Acc account1=new Acc(accn,name,password,gender, address, aadhaar,phone, email);
                HttpSession session = request.getSession();
                session.setAttribute("user", account1);
                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("status", "failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
         catch (Exception e) {
            e.printStackTrace();
        }
        }
    }
}
