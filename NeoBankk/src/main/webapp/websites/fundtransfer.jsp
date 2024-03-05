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
</head>
<body style="background-color: #fec107;">

<nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <h2>NeoBank</h2>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
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

                        <div class="row align-items-center vh-100">
                            <div class="col-5 mx-auto">

                                <div class="card shadow border">


                                    <div class="card" style="width: 55rem; height: 25rem;">



                                        <div class="card-body">

                                            <h2>Fund Transfer</h2>


                                            <!-- write form code here  -->
                                            
                                            


                                            <form  method="post"  id="transfer" >
                                                <div class="mb-3" >
                                                  <label for="account_name" class="form-label">Amount</label>
                                                  <input type="text" class="form-control" id="account_name" aria-describedby="emailHelp" name="amount">
                                                
                                                </div>
                                                
                                                <div class="mb-3">
                                                    <label for="ifsc" class="form-label">To Account</label>
                                                    <input type="text" class="form-control" id="ifsc" name="to_account">
                                                  </div>
                                                <button type="submit" class="btn btn-primary" name="button_ok">Transfer</button>
                                              </form>

<%


                      String amnt = request.getParameter("amount");
                     // String from_ac = request.getParameter("from_account");
                      String to_ac = request.getParameter("to_account");
                      String custid = session.getAttribute("custId").toString();
                      if(request.getParameter("button_ok") != null){
                    	  try{
                    		  Class.forName("com.mysql.jdbc.Driver");
                    		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnabank","root","123456");
                    		  Statement  stmt1 = con.createStatement();
                    		  Statement  stmt2 = con.createStatement();
                    		  Statement  stmt3 = con.createStatement();
                    		 // ResultSet rs = stmt3.executeQuery("select accno from accounts where customerId = " + custid);
                    		 // rs.next();
                    		 // from_ac = rs.getString("accno");
                    		  //ResultSet rs1 = 	stmt1.executeQuery("update accounts set balance = balance + " + amnt + " where accno = " + to_ac  );
                    		 // ResultSet rs2 =  stmt1.executeQuery("update accounts set balance = balance - " + amnt + " where accno = " + from_ac);
                    	   	
                    	   	stmt1.executeUpdate("update accounts set balance = balance + " + amnt + " where accno = " + to_ac  );
                    	   	stmt2.executeUpdate("update accounts set balance = balance - " + amnt + " where accno = " + custid);
                    	   	stmt3.executeUpdate("insert into transactions values(" + 3 + ", " + to_ac + ", " + custid + ", " + amnt + ",'sucessfull',CURDATE(),'19:30:00'," + custid + ")");
                    	   	System.out.println(custid);
                    	    System.out.println("SucessFull");
                    	   	}catch(Exception e){
                    	   		e.printStackTrace();
                    	   	}
                    	   	                      }                    



                    	   	
                      
                      %>















                                            <!-- write form code here -->

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                function Logout() {
                                    var get = confirm("Log Out?");
                                    if (get) {
                                        window.location.assign("./login.html");
                                        //document.forms['log-from'].submit();
                                    } else {
                                        window.location.assign("./FundTransfer.html");
                                    }
                                }
                                function warning(){

                                    var acname = document.getElementById('account_name').value;
                                    var acno = document.getElementById("account_no").value;
                                    var Ifsc = document.getElementById('ifsc').value;
                                    if(acname.length == 0 || acno.length == 0 || Ifsc.length == 0){
                                        alert("Fields can not be empty");
                                       // window.location.assign("./FundTransfer.html");
                                    }
                                    else{
                                    var get = confirm("Do you want to submit?");
                                    if (get) {
                                      document.forms['transfer'].submit();
                                    } else {
                                      //  window.location.assign("./FundTransfer.html");
                                    }
                                }
                                }

                            </script>




</body>
</html>