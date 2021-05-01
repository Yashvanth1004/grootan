<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User display</title>
<link rel="stylesheet" href="tabulationPage.css">
<style>
    /* Style to center grid column */
    .col-centered{
        float: none;
        margin: 0 auto;
    }

    /* Some custom styles to beautify this example */
    .row{
        background: #dbdfe5;
    }
    .demo-content{
        padding: 25px;
        font-size: 18px;
        background: #abb1b8;
    }


    * {box-sizing: border-box;}

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  background-image: url("blur_logo.jpg");
}

.header {
  overflow: hidden;
  background-color: rgb(0, 172, 230);
  padding: 20px 10px;
}

.header a {
  float: left;
  font-size: 30px;
  color: #fff;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-weight: bold;
  text-align: left;
  margin-left: 10px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  font-size: 30px;
  color: #fff;
  margin-top: 50px;
background: transparent;
  text-decoration: none;
  text-transform: uppercase;
}


.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }

  .header-right {
    float: none;
  }
}

</style>
</head>
<body>
<!--  <div id="content">
    <img src="logo.png" />
</div>-->
<div class="container my-3">
        <div class="col-md-12 text-center">
			<a href="loginForm.html"><button type="button" onclick="display_logout()" class="btn btn-danger btn-lg">Logout</button></a>
</div>
</div>
<script>
function display_logout()
{
  alert("Confirm Logout");
}
</script>
<%
response.setContentType("text/html");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/registrationform","root","");
	con.setAutoCommit(true);

	Statement st=con.createStatement();
	
	String query="SELECT * FROM regisform";
	
	ResultSet resultOne=st.executeQuery(query);
   %>
<div class="filter">
</div>
    <table>
    <tr>
    <th>USER ID</th>
    <th>USERNAME</th>
    
   
    <!-- <th>#</th> -->
    </tr>
    <%
    while(resultOne.next())
    {
    %>
        <tr>
        <%
        out.println("<td align='center'>"+"<a href='details.jsp?id="+resultOne.getInt("userId")+"'>"+resultOne.getInt("userId")+"</a>"+"</td>");
        out.println("<td>"+resultOne.getString("username")+"</td>");
      //  out.println("<td>"+"<button type='button' onclick='loginForm.html'>View</button>"+"</td>");
       // out.println("<td>"+resultOne.getInt("userId")+"</td>");
        
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