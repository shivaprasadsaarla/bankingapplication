<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Feedback Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 20px;
    }
    
    h1 {
      text-align: center;
	  color:black;
    }
    
    .container {
      max-width: 500px;
      margin: 0 auto;
      background-color: rgba(255, 255, 255, 0.4); 
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    
    input[type="text"],
    textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      resize: vertical;
    }
    
    .submit-button {
      display: block;
      width: 100%;
      padding: 10px;
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    
    .submit-button:hover {
      background-color: #45a049;
    }
    
    .success-message {
      background-color: #dff0d8;
      color: #3c763d;
      padding: 10px;
      margin-top: 20px;
      border-radius: 4px;
    }
	body{
  background-color:#d8e5f3 ;
}
a{
display: block;
  color:grey;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
  </style>
</head>
<body>
  <h1>Query Form</h1>
  <div class="container">
    <form id="feedbackForm">
      <div class="form-group">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" required></textarea>
      </div>
      <button type="submit" class="submit-button">Submit</button>
    </form>
    <div id="successMessage" class="success-message" style="display: none;"></div>
  </div>

  <script>
    document.getElementById("feedbackForm").addEventListener("submit", function(event) {
      event.preventDefault();
      document.getElementById("successMessage").innerText = "Query Submitted";
      document.getElementById("successMessage").style.display = "block";
    });
  </script>
  <a href="home.jsp">Home</a>
</body>
</html>
