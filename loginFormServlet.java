package grootan1;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/loginFormServlet")
public class loginFormServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		userLogin cl = new userLogin();
		
		String username = request.getParameter("username");
		String password =request.getParameter("password");
		
		String result=cl.validateClient(username, password);
		int userid= cl.userIdUser(username, password);
		System.out.println(userid);
		if(result.equals("Sucess")){
			HttpSession se = request.getSession(true);
			se.setAttribute("userId",userid); 
			
			System.out.println("Done");
			RequestDispatcher rd = request.getRequestDispatcher("/userLoginSucess.html");
			rd.forward(request,response);
		}
		else{
			System.out.println("No");
			RequestDispatcher rd = request.getRequestDispatcher("/userLoginUnsucess.html");
			rd.forward(request,response);
		}
	}
}


