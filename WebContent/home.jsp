<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bank Website</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .navbar {
      background-color:white;
      color:black;
      display: flex;
    }
 
    .navbar ul {
      list-style-type: none;
      margin: 0;
      padding:0;
      display: flex;
    }

    .navbar li {
      padding: 20px;
      position: relative;
    }

    .navbar li a {
      color: black;
      text-decoration: none;
    }

    .navbar li:hover {
      background-color:lightgrey ;
    }

    .subnav {
      display: none;
      position: absolute;
      background-color: #f0f0f5;
      width: 100%;
      top: 100%;
      left: 0;
      z-index: 1;
    }

    .navbar li:hover .subnav {
      display: block;
    }

    .subnav a {
      color:  #c6d9ec;
      padding: 10px;
      display: block;
    }

    .subnav a:hover {
      background-color: grey;
    }
	body
	{
	  background-color:#ddebed; 
	}
	p{
	color:grey;font-size:17px;
	padding-left:5 px;
	text-align:center;
	}
	img{
height:200px;
display:block;
margin-left:auto;
margin-right:auto;
padding-top:100px;
}
p{
padding-left:300px;
padding-right:300px;
}
h1 {
  color: #333;
  font-family: tahoma;
  font-size: 3rem;
  font-weight: 100;
  line-height: 1.5;
  text-transform: uppercase;
  white-space: nowrap;
  overflow: hidden;
  position: relative;
  width: 550px;
}

h1 span {
  font-size: 40px;
  margin-left: 40px;
}

.message {
  background-color: yellow;
  color: #333;
  display: block;
  font-weight: 900;
  overflow: hidden;
  position: absolute;
  padding-left: 0.5rem;
  top: 0.2rem;
  left: 270px;
  animation: openclose 5s ease-in-out infinite;
}

.word1, .word2, .word3 {
  font-family: tahoma;
}

@keyframes openclose {
  0% {
    top: 0.2rem;
    width: 0;
  }
  5% {
    width: 0;
  }
  15% {
    width: 230px;
  }
  30% {
    top: 0.2rem;
    width: 230px;
  }
  33% {
    top: 0.2rem;
    width: 0;
  }
  35% {
    top: 0.2rem;
    width: 0;
  }
  38% {
    top: -4.5rem;
    
  }
  48% {
    top: -4.5rem;
    width: 190px;
  }
  62% {
    top: -4.5rem;
    width: 190px;
  }
  66% {
    top: -4.5rem;
    width: 0;
    text-indent: 0;
  }
  71% {
    top: -9rem;
    width: 0;
    text-indent: 5px;
  }
  86% {
    top: -9rem;
    width: 285px;
  }
  95% {
    top: -9rem;
    width: 285px;
  }
  98% {
    top: -9rem;
    width: 0;
    text-indent: 5px;
  }
  100% {
    top: 0;
    width: 0;
    text-indent: 0;
  }
}


 </style>
</head>
<body >
  <div class="navbar">
    <ul>
      <li><a>Home</a></li>
      <li class="dropdown">
        <a>Services</a>
        <div class="subnav">
          <a href="transaction.jsp">Transactions</a>
          <a href="loan.jsp">Loan</a>
        </div>
      </li>
      <li class="dropdown">
        <a>Accounts</a>
        <div class="subnav">
    
          <a href="history.jsp">History</a>
          <a href="balance.jsp">Balance</a>
        </div>
      </li>
	  <li><a href="reachus.jsp">Reach Us</a></li>
      <li><a href="query.jsp">Queries</a></li>
	  <li><a href="faq.jsp">FAQ</a></li>
	  <li><a href="profile.jsp">Profile</a></li>
      <li><a href="login.jsp">Logout</a></li>
    </ul>
  </div>
  <br><br><br><br><br><br>
  <div class="r">
 <div class="p">
<p style=><i>Our Bank is a pioneer in the banking sector in India by being the first bank to digitalize all its branches in the country.</i> </p><br>
<p style=><i> With our Bank digital personal loans, you can get the funds you need anywhere and anytime with no manual documentation.
Our bank offers different type of accounts to meet your financial goals and secure your future. Choose from our wide range of deposit products that are specifically designed to keep your unique requirements in mind.</i></p>
</div>
<br><br>
<h1>
  <span>Banking </span>
  <div class="message">
    <div class="word1">simple</div>
    <div class="word2">safe</div>
    <div class="word3">smooth</div>
  </div>
</h1>

<!--<img src="download.jpg">  -->
 </div>
</body>
</html>