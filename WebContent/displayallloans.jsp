<%@ page import="java.sql.*" %>
<%@ page import="bank.Db" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Loan History</title>
    <!-- Your styles -->
    <style>
     	a {
            display: block;
            color: purple;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        body {
            background-color: #ddebed;
            padding: 50px;
        }
        h3 {
            text-align: center;
        }
        th, td {
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <h3>Loan History</h3>
    <br><br>
    <table>
        <thead>
            <tr>
                <th>Loan ID</th>
                <th>Account Number</th> 
                <th>Loan Type</th>
                <th>Loan Amount</th>
                <th>Loan Time</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <%  
            Connection con = null;
            PreparedStatement statement = null;
            ResultSet rs = null;

            try {
                con = Db.connect();
                String sql = "SELECT L_id, accn, Loantype, amount, date, balance FROM loans ORDER BY date DESC";
                statement = con.prepareStatement(sql);
                rs = statement.executeQuery();

                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("L_id") %></td>
                <td><%= rs.getInt("accn") %></td>
                <td><%= rs.getString("Loantype") %></td>
                <td><%= rs.getInt("amount") %></td>
                <td><%= rs.getTimestamp("date") %></td>
                <td><%= rs.getInt("balance") %></td>
            </tr>
            <%  
                } 
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources in the reverse order of opening
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            }
            %>
        </tbody>
    </table>
    <br><br><br>
    <a href="home2.jsp">Home</a>
</body>
</html>
