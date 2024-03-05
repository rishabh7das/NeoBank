package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class loginModel {
	static final String jdbc_driver="com.mysql.jdbc.Driver";
    static  final String db_url = "jdbc:mysql://localhost:3306/apnabank";
    static final String user="root";
    static final String pass="";
    public int insertFeedbackDataIn(logindataModeling f) {
  	  Connection conn = null;
  	  Statement stmt = null;
    
    try {
  	  Class.forName(jdbc_driver);
  	  conn = DriverManager.getConnection(db_url,user,pass);
  	  stmt = conn.createStatement();
 Statement stmt1 = conn.createStatement();
  	  String custid = f.getcustId();
  	 // String sql = "insert into customers values(" + custid + ",'" + f.getFirstName() + "','" + f.getMiddleName() + "','" + f.getLastName()  + "','" + f.getPhNo() + "','" + f.getEmailId() + "','" + f.getdob() + "','" + f.getGender() + "','" + f.getFatherName() + "','" +  f.getMotherName() + "','" + f.getaadhar() + "','" + f.getPanCard() + "','" + f.getMaritalststus() + "','" + f.getoccupation() + "'," + f.getannualIncome () +",'" + f.getPwd () + "')";
  	ResultSet rs = stmt.executeQuery("select pass from newpass where customerId = " + custid);
  	rs.next();
  	boolean get = false;
  	String output = rs.getString("pass");
  	System.out.println("Users");
		System.out.println(f.getpassWord());
		System.out.println(output);
  	if(   output.equals(f.getpassWord())) {
  		
  		stmt1.close();
    	  stmt.close();
    	  conn.close();
  		return 1;
  	}
  	 // stmt.executeUpdate(sql);
  	 // stmt1.executeUpdate("insert into password values(" + custid + ",' " + f.getpassWord() + "')");
  	  stmt1.close();
  	  stmt.close();
  	  conn.close();
  	  return 0;
  	  
  	  
    }

    catch(SQLException e) {
  	  e.printStackTrace();
    }catch(Exception e) {
  	  e.printStackTrace();
    }
  	  finally {
    }
    return 0;
  	  
    }
}
