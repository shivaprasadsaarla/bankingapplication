<%@ page import="java.sql.*" %>
<%@ page import="bank.Db" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
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
    
</head>
<body>
    <h3>ACCOUNT DETAILS</h3>
    <br><br>
    
    <%  
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet rs = null;

    try {
        con = Db.connect();
        String sql = "SELECT username, accn, balance, gender, aadharnumber, address, phonenumber, email FROM accounts ";
        statement = con.prepareStatement(sql);
        rs = statement.executeQuery();

        %>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Account Number</th> 
                    <th>Balance</th>
                    <th>Gender</th>
                    <th>Aadhaar Number</th>
                    <th>Address</th>
                    <th>Phone Number</th>   
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getInt("accn") %></td>
                        <td><%= rs.getInt("balance") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("aadharnumber") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("phonenumber") %></td>
                        <td><%= rs.getString("email") %></td>
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
    <a href="home2.jsp">Home</a>
</body>
</html>
