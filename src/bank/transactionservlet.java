package bank;
import java.util.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/transaction")
public class transactionservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Bank b1=new Bank();
        clerk c1=new clerk(b1);
        Thread clerk1Thread = new Thread(c1);
        clerk1Thread.start();
        String type = request.getParameter("type");
        int amount = Integer.parseInt(request.getParameter("amount"));
        //long transactionId = generateTransactionId();
        HttpSession session = request.getSession();
        Acc user = (Acc) session.getAttribute("user");
        int accountNumber = user.getAccountNumber();
        int balance = getBalanceFromTransactionTable(accountNumber);
        
        if (type.equals("debit")) {
            if (balance < amount) {
                request.setAttribute("errorMessage", "Insufficient balance!");
                request.getRequestDispatcher("transaction.jsp").forward(request, response);
                return;
            }
            balance=balance-amount;
            Transaction t1= new Transaction(user,0,amount,balance);
            c1.doTransaction(t1);
           
            storeTransactionInDatabase(t1);
            
            
        } else if (type.equals("credit")) {
        	balance=balance+amount;
        	Transaction t2= new Transaction(user,1,amount,balance);
            c1.doTransaction(t2);
            storeTransactionInDatabase(t2);
            
        }

        

        if (type.equals("debit")) {
        	
        	/*String Message = "Debit Transaction successful.";
        	PrintWriter out = response.getWriter();
            out.println("<h3>"+Message+"</h3>");
         request.getRequestDispatcher("/transaction.jsp").include(request, response);*/
            response.sendRedirect("debit.jsp?amount=" + amount);
        } else if (type.equals("credit")) {
            response.sendRedirect("credit.jsp?amount=" + amount);
        	/*String Message = "credit Transaction successful.";
        	PrintWriter out = response.getWriter();
            out.println("<h3>"+Message+"</h3>");
         request.getRequestDispatcher("/transaction.jsp").include(request, response);*/
        }
        clerk1Thread.interrupt();
    }

    /*private long generateTransactionId() {
        Random random = new Random();
        return 1000000000000000L + random.nextInt(900000000);
    }*/

    private int getBalanceFromTransactionTable(int accountNumber) {
        int balance = 0;
        

        try {
        balance = accountdao.readaccbal(accountNumber);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return balance;
    }

    private void storeTransactionInDatabase(Transaction t) {
        try {
            /*Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = conn.prepareStatement("INSERT INTO transaction (transaction_id, acc, type, amount, balance, transaction_timestamp) VALUES (?, ?, ?, ?, ?, ?)");
            statement.setLong(1, transactionId);
            statement.setString(2, accountNumber);
            statement.setString(3, type);
            statement.setDouble(4, amount);
            statement.setDouble(5, balance);
            statement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            statement.executeUpdate();
            statement.close();
            conn.close();
            */
        	transactiondao.createtransaction(t);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}