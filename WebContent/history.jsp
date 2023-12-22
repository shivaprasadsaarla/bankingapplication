
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page import="bank.Acc" %>
<%@ page import="bank.Db" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction and Loan History</title>
    <style>
        <style>
      table{
             border-collapse: collapse;
            width: 100%;
            height : 100%;
            margin:0-auto;
        }
      
        body {
            background-color: #ddebed;
            
           
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
           a{
display: block;
  color:grey;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
  h2{
  text-align:center;
  }
    </style>
       
    </style>
</head>
<body>
    <h3>Transaction History</h3>

    <table class="transaction">
        <!-- Transaction history table header -->
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Account Number</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance</th>
                <th>Transaction Time</th>
            </tr>
        </thead>
        <tbody>
            <%  
            try {
                Acc user = (Acc) session.getAttribute("user");
                int accountNumber = user.getAccountNumber();
                Connection con =Db.connect();
                String sql = "SELECT * FROM transactions WHERE accn = ? ORDER BY date DESC";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setInt(1, accountNumber);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    String transactionId = rs.getString("t_id");
                    String acc = rs.getString("accn");
                    String type = rs.getString("transactiontype");
                    int amount = rs.getInt("amount");
                    int balance = rs.getInt("balance");
                    String transactionTimestamp = rs.getTimestamp("date").toString();

                    %>
                    <!-- Transaction history table rows -->
                    <tr>
                        <td><%= transactionId %></td>
                        <td><%= acc %></td>
                        <td><%= type %></td>
                        <td><%= amount %></td>
                        <td><%= balance %></td>
                        <td><%= transactionTimestamp %></td>
                    </tr>
                    <% 
                }
                rs.close();
                statement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table><br><br>
    
    <h3>Loan History</h3>

    <table class="loan">
        <thead>
            <tr>
                <th>Loan ID</th>
                <th>Account Number</th>
                <th>Loan Type</th>
                <th>Loan Amount</th>
                <th>Loan Time</th>
            </tr>
        </thead>
        <tbody>
            <%  
            try {
                Acc user = (Acc) session.getAttribute("user");
                int accountNumber = user.getAccountNumber();
                Connection con =Db.connect();
                String sql = "SELECT * FROM loans WHERE accn = ? ORDER BY date DESC";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setInt(1, accountNumber);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    String loanId = rs.getString("L_id");
                    String acc = rs.getString("accn");
                    String loanType = rs.getString("Loantype");
                    int loanAmount = rs.getInt("amount");
                    String loanTime = rs.getTimestamp("date").toString();

                    %>
                    <tr>
                        <td><%= loanId %></td>
                        <td><%= acc %></td>
                        <td><%= loanType %></td>
                        <td><%= loanAmount %></td>
                        <td><%= loanTime %></td>
                    </tr>
                    <% 
                }
                rs.close();
                statement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
    
    <a href="home.jsp">Home</a>
</body>
</html>