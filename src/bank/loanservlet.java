package bank;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/loan")
public class loanservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bankproject";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Srk2004$";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Bank b2 = new Bank();
        clerk c2 = new clerk(b2);
        Thread clerk2Thread = new Thread(c2);
        clerk2Thread.start();

        String loanType = request.getParameter("loan-type");
        int loanAmount = Integer.parseInt(request.getParameter("loan-amount"));
        HttpSession session = request.getSession();
        Acc user = (Acc) session.getAttribute("user");
        int accountNumber = user.getAccountNumber();

        int totalCredits=0;
		try {
			totalCredits = accountdao.readtcamt(accountNumber);
		} catch (SQLException e) {

			e.printStackTrace();
		}
        int balance = getBalanceFromTransactionTable(accountNumber);
        System.out.println(totalCredits);
        boolean Approved = false;
        String reason = "";

        if (totalCredits >= 50000 && loanType.equals("personal-loan")) {
            Approved = true;
            
        } else if (totalCredits >= 75000 && loanType.equals("two-wheeler-loan")) {
            Approved = true;
        } else if (totalCredits >= 100000 && loanType.equals("four-wheeler-loan")) {
          Approved = true;
        } else if (totalCredits >= 25000 && loanType.equals("educational-loan")) {
            Approved = true;
        } else if (totalCredits >= 200000 && loanType.equals("house-loan")) {
            Approved = true;
        }    
        if(Approved==true)
        {
        	Loan  l1= new Loan(user,loanType,loanAmount,balance);
            c2.dotransaction(l1);
            storeLoanInDatabase(l1);
            response.sendRedirect("approved.jsp");
            clerk2Thread.interrupt();
        }
        else
        {
        	response.sendRedirect("notapproved.jsp");
        }
        }

    private int getBalanceFromTransactionTable(int accountNumber) {
        int balance = 0;

        try {
            balance = accountdao.readaccbal(accountNumber);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return balance;
    }

    private void storeLoanInDatabase(Loan l1) {
        try {
            loandao.createloan(l1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}