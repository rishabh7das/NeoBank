package controller;

import model.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginDataCollection
 */
@WebServlet("/loginDataCollection")
public class loginDataCollection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginDataCollection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String customerId = request.getParameter("customerID");
		String Password = request.getParameter("password");
		logindataModeling m = new logindataModeling();
		m.setcustId(customerId);
		m.setpassWord(Password);
		System.out.println("Login Data model");
		System.out.println(m.getcustId());
		System.out.println(m.getpassWord());
		
		HttpSession session = request.getSession();
		session.setAttribute("custId", customerId);
		//session.setAttribute("password", Password);
		loginModel f = new loginModel ();
		
		if(f.insertFeedbackDataIn(m) == 1) {
			response.sendRedirect(request.getContextPath() + "/websites/Homepage.jsp");
		}else {
		System.out.println("Failed");
		response.sendRedirect(request.getContextPath() + "/websites/login.jsp");
		}
		
		
		
	}

}
