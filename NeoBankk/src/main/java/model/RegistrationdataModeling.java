package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class RegistrationdataModeling {

	
	 static final String jdbc_driver="com.mysql.jdbc.Driver";
     static  final String db_url = "jdbc:mysql://localhost:3306/apnabank";
     static final String user="root";
     static final String pass="";
     public void insertFeedbackData(Registr f) {
   	  Connection conn = null;
   	  Statement stmt = null;
     
     try {
   	  Class.forName(jdbc_driver);
   	  conn = DriverManager.getConnection(db_url,user,pass);
   	  stmt = conn.createStatement();
  Statement stmt1 = conn.createStatement();
   	  String custid = f.getPhNo();
   	  custid = custid.substring(0, 5); 
   	  String sql = "insert into customers values(" + custid + ",'" + f.getFirstName() + "','" + f.getMiddleName() + "','" + f.getLastName()  + "','" + f.getPhNo() + "','" + f.getEmailId() + "','" + f.getdob() + "','" + f.getGender() + "','" + f.getFatherName() + "','" +  f.getMotherName() + "','" + f.getaadhar() + "','" + f.getPanCard() + "','" + f.getMaritalststus() + "','" + f.getoccupation() + "'," + f.getannualIncome () +",'" + f.getPwd () + "')";
           
   	  stmt.executeUpdate(sql);
   	  stmt1.executeUpdate("insert into newpass values(" + custid + ",'" + f.getpassWord() + "')");
   	  stmt1.close();
   	  stmt.close();
   	  conn.close();
   	  
     }

     catch(SQLException e) {
   	  e.printStackTrace();
     }catch(Exception e) {
   	  e.printStackTrace();
     }
   	  finally {
     }
   	  
     }
}
