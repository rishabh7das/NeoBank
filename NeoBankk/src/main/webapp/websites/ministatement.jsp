<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NeoBank</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./homepage.css">
</head>
<body style="background-color: #fec107;">


  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <h2>NeoBank</h2>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav me-auto mb-2 mb-lg-1">
          <li class="nav-item">
            <button class="btn btn-outline-success" type="submit">Home</button>
          </li>




        </ul>
        <form class="d-flex" action="<%=request.getContextPath()%>/logOut" onclick="Logout()"  id="log-from" method="post">
          <button type="submit" class="btn btn-outline-danger" >Log out</button>
        </form>
      </div>
    </div>
  </nav>

  <div class="col-4">
    <div class="container">

      <div class="row align-items-center vh-100">
        <div class="col-5 mx-auto">

          <div class="card shadow border">


            <div class="card" style="width: 15rem; height: 25rem;">



              <div class="card-body">

                <div class="list-group">
                <from action="Homepage.jsp">
                  <a href="./Homepage.jsp" class="list-group-item list-group-item-action active" aria-current="true">
                    Home
                  </a>
                  </from>
                  <from action="ministatement.jsp">
                  <a href="./ministatement.jsp" class="list-group-item list-group-item-action" name="">mini statement</a>
                  </from>
                  <from action="fundtransfer.jsp">
                  <a href="./fundtransfer.jsp" class="list-group-item list-group-item-action">Fund Transfer</a>
                  </from>
                </div>


              </div>
            </div>
          </div>
        </div>


        <div class="col-5">
          <div class="container">

            <div class="row align-items-center vh-101">
              <div class="col-5 mx-auto">

                <div class="card shadow border">


                  <div class="card" style="width: 55rem; height: 25rem;">



                    <div class="card-body">
                      <!-- write form code here  -->



                      <h2>Mini statement</h2>
                      <form  id="statement-from" method="POST">
                        From <input type="text" id="start_date" name="startDate">
                        To <input type="text" id="end_date" name="endDate">
                        <input type="submit"  name="button_ok">
                      </form>
                      
                      <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">To Account </th>
                            <th scope="col">credit </th>
                            <th scope="col">status</th>
                            <th scope="col">Date</th>
                          </tr>
                        </thead>
                        </table>
                        <div class="scroller">
                      
                      <%
                      String custid = session.getAttribute("custId").toString();
                      String start = request.getParameter("startDate");
                      String end = request.getParameter("endDate");
                      if(request.getParameter("button_ok") != null){
                    	  try{
                    		  Class.forName("com.mysql.jdbc.Driver");
                    		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnabank","root","");
                    		  Statement st = con.createStatement();
                    		  ResultSet rs = st.executeQuery("select * from transactions where customerId = " + custid + " and  txndate between " + "'" + start + "' and '" + end + "'");
                    		  while(rs.next()){
                      
                      %>
                      
                      <table class="table">
                        
                        <tbody class="table-group-divider">
                          <tr>
                            <th scope="row"><%=rs.getString(2) %></th>
                            <td><%=rs.getString(4) %></td>
                            <td><%=rs.getString(5) %></td>
                            <td><%=rs.getString(6) %></td>
                          </tr>

                        </tbody>
                      </table>
                      


<% 
}
}catch(Exception e){
	e.printStackTrace();
}
                      }                    



%>
                      
      </div>                
                      


                      <!-- write form code here  -->
                    </div>


                  </div>
                </div>
              </div>
            </div>

            <script>
              function warning() {
                var start = document.getElementById("start_date").value;
                var end = document.getElementById("end_date").value;
                if (start > end) {
                  var get = confirm("Enter correct date");
                  if (get) {
                   // window.location.assign("./miniStatement.html");
                  } else {
                  //  window.location.assign("./miniStatement.html");
                  }

                } else {
                  document.forms['statement-from'].submit();
                }

              }
              function Logout() {
                var get = confirm("Log Out?");
                if (get) {
                  //window.location.assign("./login.html");
                 // document.forms['log-from'].submit();
                } else {
                  //window.location.assign("./miniStatement.html");
                }
              }
            </script>








</body>
</html>