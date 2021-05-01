<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>details</title>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />

<link rel="stylesheet" href="details.css">
</head>
<body>
<div class="filter">
<a href="tabulationPage.html"><button class="py-3">back</button></a>
</div>
<%! int userId;%>
<!--  <div id="content">
    <img src="logo.png" />
</div>-->
<%
userId=Integer.parseInt(request.getParameter("id"));
//System.out.println(userId);
//userid=Integer.parseInt(request.getParameter("userId"));
//ServletContext context=getServletContext();  
//context.setAttribute("issueid",issueid); 
//ServiceDBProcess serv=new ServiceDBProcess();
//String issuedetails=serv.displayissue(issueid);
//out.println(issuedetails);
%>

<%
response.setContentType("text/html");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/registrationform","root","");
	con.setAutoCommit(true);
	int userid = userId;
	System.out.println(userid);
	Statement st=con.createStatement();
	
	String query="SELECT * FROM `regisform` WHERE userId='userId'";
	
	ResultSet resultOne=st.executeQuery(query);
   %>
<div class="filter">
</div>
    <table>
    <tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Age</th>
    <th>DOB</th>
    <th>Address</th>
    <th>Phone No.</th>
    
   
    <!-- <th>#</th> -->
    </tr>
    <%
    while(resultOne.next())
    {
    %>
        <tr>
        <%
        out.println("<td>"+resultOne.getString("firstName")+"</td>");
        out.println("<td>"+resultOne.getString("lastName")+"</td>");
        out.println("<td>"+resultOne.getString("age")+"</td>");
        out.println("<td>"+resultOne.getDate("dob")+"</td>");
        out.println("<td>"+resultOne.getString("address")+"</td>");
        out.println("<td>"+resultOne.getString("phoneNo")+"</td>");
        
        %>
        </tr>
        <%
    }
    %>
    </table>
    <%
    con.close();
    }
    catch(Exception e)
    {
    	System.out.println(e.getMessage());
    }
    out.close();
%>
</body>
</html>