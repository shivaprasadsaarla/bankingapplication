<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page import="bank.Acc" %>
<%@ page import="bank.Db" %>
<%@ page import="bank.accountdao" %><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
            background-color: #ddebed;
        }

        .container {
            text-align: center;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 10px;
        }

        p {
            margin-top: 20px;
            font-weight: bold;
        }

        a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
 <%  
            try {
                Acc user = (Acc) session.getAttribute("user");
                int accountNumber = user.getAccountNumber();
                Connection con =Db.connect();
                String sql = "SELECT * FROM accounts WHERE accn = ?";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setInt(1, accountNumber);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("username");
                    int accn = rs.getInt("accn");
                    int balance = rs.getInt("balance");
                    String gender = rs.getString("gender");
                    String aadharnumber = rs.getString("aadharnumber");
                    String address = rs.getString("address");
                    String phonenumber = rs.getString("phonenumber");
                    String email = rs.getString("email");

                    %>
                    
                        <p>username : <%= username %></p>
                        <p>account number: <%= accn %></p>
                        <p>balance: <%= balance %></p>
                        <p>gender: <%= gender %></p>
                        <p>aadharnumber: <%= aadharnumber %></p>
                    	<p>address: <%= address %></p>
                    	<p>phonenumber: <%= phonenumber %></p>
                    	<p>email: <%= email %></p>
                    	
                    <% 
                }
                rs.close();
                statement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
            <a href="home.jsp">Home</a>
            </div>
</body>
</html>