<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page import="bank.Acc" %>
<%@ page import="bank.Db" %>
<%@ page import="bank.accountdao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Credit Result</title>
    <!-- Your styles -->
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
            // Assuming you have already retrieved the user object from the session
            Acc user = (Acc) session.getAttribute("user");
            int accountNumber = user.getAccountNumber();

            // Retrieve the account balance from the database using the accountdao class
            int b = accountdao.readaccbal(accountNumber);
    %>
        <p>Balance: <%= b %></p> <!-- Display the value of 'b' here -->
    <% 
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
        <a href="home.jsp">Home</a>
    </div>
</body>
</html>
