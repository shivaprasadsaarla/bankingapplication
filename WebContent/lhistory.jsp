<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page import="bank.Acc" %>
<%@ page import="bank.Db" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Loan History</title>
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
    <h3>Loan History</h3><br><br>

    <form method="post">
        Enter Account Number: <input type="text" name="accNumber">
        <input type="submit" value="loan History">
    </form><br><br><br>
	<a href="displayallloans.jsp">display all loans</a>
    <%  
    String accountNumber = request.getParameter("accNumber");
    if (accountNumber != null && !accountNumber.isEmpty()) {
        try {
        	Connection con =Db.connect();
        	String sql = "SELECT * FROM loans WHERE accn = ? ORDER BY `date` DESC";

            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();

            %>
            <table >
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Account Number</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Loan Time</th>
                        <th>balance</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("L_id") %></td>
                        <td><%= rs.getInt("accn") %></td>
                        <td><%= rs.getString("Loantype") %></td>
                        <td><%= rs.getInt("amount") %></td>
                        <td><%= rs.getTimestamp("date") %></td>
                        <td><%= rs.getInt("balance") %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
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