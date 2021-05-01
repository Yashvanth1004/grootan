package grootan1;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/registrationFormServlet")
public class registrationFormServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		 registrationForm rf = new registrationForm();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String age = request.getParameter("age");
		String dob = request.getParameter("dob");
	    String address = request.getParameter("address");
	    String phone = request.getParameter("phoneno");
	   
	    System.out.println(firstname);
	    
	    String result= rf.checkWheatherSameUser(username);
	    System.out.println(result+"on servlet");
	    if(result.equals("Valid")){
	    	String result2 = rf.addUser(username,password,firstname,lastname, age,dob,address, phone);
	    	System.out.println(result2);
	    		if(result2.equals("Inserted Sucessfully")){
	    			System.out.println("Done");
	    			RequestDispatcher rd = request.getRequestDispatcher("/userSignupSucess.html");
	    			rd.forward(request,response);
	    		}
	    		else{
	    			System.out.println("No");
	    			RequestDispatcher rd = request.getRequestDispatcher("/userSignupUnsucess.html");
	    			rd.forward(request,response);
	    		}
	  }
	  else{
		  System.out.println("else part");
		  RequestDispatcher rd =request.getRequestDispatcher("/userExist.html");
		  rd.forward(request,response);
	  }
	
		
	}
}

