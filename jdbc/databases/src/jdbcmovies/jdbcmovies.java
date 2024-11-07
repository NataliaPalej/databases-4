package jdbcmovies;
import java.sql.*;

public class jdbcmovies{
	public static void main (String args[]){ 
	
		//Change URL depending on your database/port/username etc...
		String url = "jdbc:mysql://localhost:3306/alarms";
		String userName = "root";
		String password = "";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			//Load the Driver class
			Class.forName("com.mysql.cj.jdbc.Driver");
			//If you are using any other database, then load the appropriate driver here.
			
			//Create the connection using the static getConnection method
			con = DriverManager.getConnection (url,userName,password);
			
			//Create a Statement class to execute the SQL statement
			stmt = con.createStatement();
			
			//Execute the SQL statement and store the results in a ResultSet
			rs = stmt.executeQuery("SELECT moviename, releasedate FROM movies");
			
			//Loop through the ResultSet, displaying 2 values for each row using the getString method
			while (rs.next())
				System.out.println("Name = " + rs.getString("moviename") + " , Date = " + rs.getString("releasedate"));
		}
		catch (SQLException e) {e.printStackTrace();}
		catch (Exception e) {e.printStackTrace();}
		finally {
                        if (rs!=null){
                                try{rs.close();} catch(Exception e) {e.printStackTrace();} }
                        if (stmt!=null){
                                try{rs.close();} catch(Exception e) {e.printStackTrace();} }  
                        if (con!=null){
                                try{rs.close();} catch(Exception e) {e.printStackTrace();} }
                }
        }
}