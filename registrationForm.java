package grootan1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class registrationForm{
	
	
	public String addUser(String username,String password,String firstname,String lastname,String age ,String dob,String address,String phoneNo){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/registrationform","root","");
		con.setAutoCommit(true);

		Statement st=con.createStatement();
		
		String query="insert into regisform values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, 0);
		ps.setString(2, username);
		ps.setString(3, password);
		ps.setString(4, firstname);
		ps.setString(5, lastname);
		ps.setString(6, age);
		ps.setString(7, dob);
		ps.setString(8, address);
		ps.setString(9, phoneNo);
		ps.executeUpdate();
		
		con.close();
		System.out.println("inserted2");
		return "Inserted Sucessfully";
		
		
		}
		catch(Exception e){
			System.out.println("Exception2"+e.getMessage());
			return "Exception-------->"+e;
		}
	
	}
	
	public String checkWheatherSameUser(String usname){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/registrationform","root","");
			con.setAutoCommit(true);

			Statement st=con.createStatement();
			int flag=0;
			String query="select * from regisform";
			ResultSet resultOne=st.executeQuery(query);
			
			while(resultOne.next()){
				if(resultOne.getString("username").equals(usname)){
					System.out.println(resultOne.getString("username"));
					System.out.println("Inside Flag0");
					flag=0;
					break;
				}
				else{
					flag=1;
				}
			}
			
			con.close();
			if(flag==1){
				System.out.println("Valid");
				return "Valid";
			}
			else{
				System.out.println("Invalid");
				return "Invalid";
			}
			
		}
			catch(Exception e){
				System.out.println("Exception3"+e.getMessage());
				return "Exception-------->"+e;
			}
	}
}

	
	

	


