<%@ page import="java.sql.*" %>
<%@ page import="bank.Db" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transactions</title>
    <!-- Your styles -->
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
    <style>
        /* Your styles here */
    </style>
</head>
<body>
    <h3>Transaction </h3>
    <br><br>

    <%  
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet rs = null;

    try {
        con = Db.connect();
        String sql = "SELECT * FROM transactions ORDER BY date DESC";
        statement = con.prepareStatement(sql);
        rs = statement.executeQuery();

        %>
        <table>
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
                <% while (rs.next()) { %>
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
        </table>
        <%  
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the reverse order of opening
        if (rs != null) rs.close();
        if (statement != null) statement.close();
        if (con != null) con.close();
    }
    %>
    <br><br><br>
    <a href="home2.jsp">Home</a>
</body>
</html>
