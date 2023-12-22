<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Debit and Credit Page</title>
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
		h2 {
            margin-bottom: 10px;
        }
        input {
            padding: 5px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .transaction-result {
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
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <p>Enter amount to credit or debit</p>
        <form method="post" action="transaction">
            <input type="number" name="amount" placeholder="Enter amount" required>
            <select name="type">
                <option value="debit">Debit</option>
                <option value="credit">Credit</option>
            </select>
            <button type="submit">Go</button>
        </form>
        <% String errorMessage = (String) request.getAttribute("errorMessage");
                   if (errorMessage != null) { %>
                    <p class="error-message"><%= errorMessage %></p>
                <% } %>
    </div>
    
</body>
</html>