<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NeoBank</title>
<link rel="stylesheet" href="registration.css"></style>
</head>
<body>

 <div class="wrapper">
        <div class="title">
          Neo Bank

          <form action= "<%=request.getContextPath()%>/loginDataCollection" method="POST" id="login-from">
        </div>
        <div class="form">
           
           <div class="inputfield">
            <label>Account Number</label>
            <input type="text" class="input" name="customerID">
         </div>
         
          
           <div class="inputfield">
              <label>Password</label>
              <input type="password" class="input" name="password">
           </div>    
          
          <div class="inputfield">
            <input type="submit" value="Login" class="btn" >
          </div>
        </div>
        <div class="signup">
        <span class="signup">Don't have an account?
         <label for="register"></label>
         <a href="./registration.jsp" id="register">Register</a>
        </span>
      </div>
    </div>
  </form>


<script>

  function warning(){
    var con = confirm("Do you want to submit?");
  if(con){
    window.location.assign("./HomePage.html");
  }else{
    window.location.assign("./login.html");
  }
  }

</script>










</body>
</html>