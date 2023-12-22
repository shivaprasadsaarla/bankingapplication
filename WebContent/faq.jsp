<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <h2>FAQ's</h2>
    <style>
        body
        {
            background-color:#d8e5f3;
        }
        .accordion {
          background-color: #eee;
          color: #444;
          cursor: pointer;
          padding: 35px;
          width: 100%;
          border: none;
          text-align: left;
          outline: none;
          font-size: 20px;
          transition: 0.5s;
        }
        
        .active, .accordion:hover {
          background-color: #ccc; 
        }
        
        .panel {
          padding: 0 18px;
          display: none;
          background-color: white;
          overflow: hidden;
        }
        p{
            font-size: 20px;
        }
        h2{
            font-size: 30px;
            text-align: center;
        }
		a{
display: block;
  color:purple;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
        </style>
</head>
<body>
   
    <button class="accordion">How to access all account details?</button>
<div class="panel">
  <p>Click on the accounts tab on the home page to get all details regarding that respective account.</p>
</div>
<button class="accordion">How long will it take to process the account creation?</button>
<div class="panel">
  <p>Generally it takes 5-6 days for the account creation if all the documents are submitted properly.</p>
</div>
<button class="accordion">What services do this bank provide?</button>
<div class="panel">
  <p>We basically provide account creation , transactions and loan grant permission.</p>
</div>
<button class="accordion">What are the basic prerequisites required for loan application?</button>
<div class="panel">
  <p> Proof of residence – house registration certificate, sales deed, Aadhaar card, Voter ID card, etc. 
    Proof of Income – Form 16, Salary slips, Bank statements, Income Tax Certificate, etc. Passport-size photographs..</a></p>
</div>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;
    
    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
          panel.style.display = "none";
        } else {
          panel.style.display = "block";
        }
      });
    }
    </script>
	<a href="home.jsp">Home</a>
</body>
</html>