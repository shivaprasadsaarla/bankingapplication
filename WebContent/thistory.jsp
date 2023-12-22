<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page import="bank.Acc" %>
<%@ page import="bank.Db" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <style>
     	a{
display: block;
  color:purple;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
   body
        {
            background-color:#ddebed;
            padding:50px;
        }
  h3{
  text-align:center;}
    }

        th, td {
            
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
       table{
             border-collapse: collapse;
            width: 100%;
            height : 100%;
            margin:0-auto;
        }  a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
      
    </style>
</head>
<body>
    <h3>Transaction History</h3><br><br>

    <form method="post">
        Enter Account Number: <input type="text" name="accNumber">
        <input type="submit" value="Get Transaction History">
    </form><br><br><br>
	<a href="displayalltrans.jsp">display all transactions</a>
    <%  
    String accountNumber = request.getParameter("accNumber");
    if (accountNumber != null && !accountNumber.isEmpty()) {
        try {
        	Connection con =Db.connect();
        	String sql = "SELECT * FROM transactions WHERE accn = ? ORDER BY `date` DESC";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();
            int c = 0;
            int d = 0;
            %>
            <table >
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
                 <% while (rs.next()) {
                        String type = rs.getString("transactiontype");
                        if (type.equalsIgnoreCase("credit")) {
                            c++;
                        } else if (type.equalsIgnoreCase("debit")) {
                            d++;
                        }
                    %>
                  
                    <tr>
                        <td><%= rs.getString("t_id") %></td>
                        <td><%= rs.getInt("accn") %></td>
                        <td><%= rs.getString("transactiontype") %></td>
                        <td><%= rs.getInt("amount") %></td>
                        <td><%= rs.getInt("balance") %></td>
                        <td><%= rs.getTimestamp("date") %></td>
                    </tr>
                    <% } %>
                    
                </tbody>
            </table><br><br><br>
            <!-- Display the number of credits and debits -->
            <p>Number of Credits: <%= c %></p>
            <p>Number of Debits: <%= d %></p>
            <%  
            rs.close();
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 
    %>
     <a href="home2.jsp">Home</a>
</body>
</html>