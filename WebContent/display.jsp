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
    <form method="post">
        Enter Account Number: <input type="text" name="accNumber">
        <input type="submit" value="Get account details">
    </form>
    <br><br><br>
    <a href="displayallacc.jsp">Display all accounts</a>

    <%  
    String accountNumber = request.getParameter("accNumber");
    if (accountNumber != null && !accountNumber.isEmpty()) {
        // Validate input to ensure it is a number (you can add more validations)
        if (accountNumber.matches("\\d+")) {
            try {
                int accNumber = Integer.parseInt(accountNumber);

                Connection con = null;
                PreparedStatement statement = null;
                ResultSet rs = null;

                try {
                    con = Db.connect();
                    String sql = "SELECT username, accn, balance, gender, aadharnumber, address, phonenumber, email FROM accounts WHERE accn = ?";
                    statement = con.prepareStatement(sql);
                    statement.setInt(1, accNumber);
                    rs = statement.executeQuery();

                    if (rs.next()) {
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
                            </tbody>
                        </table>
                        <% 
                    } else {
                        out.println("<p>No account found with the given account number.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close resources in the reverse order of opening
                    if (rs != null) rs.close();
                    if (statement != null) statement.close();
                    if (con != null) con.close();
                }
            } catch (NumberFormatException e) {
                out.println("<p>Invalid account number. Please enter a valid number.</p>");
            }
        } else {
            out.println("<p>Invalid account number format. Please enter a valid number.</p>");
        }
    } 
    %>
     <a href="home2.jsp">Home</a>
</body>
</html>
