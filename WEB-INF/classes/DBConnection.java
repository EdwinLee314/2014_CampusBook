package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class DBConnection
{
	private static String dbDriver;
	private static String dbLocation;
	private static String dbUsername;
	private static String dbPassword;
	Connection connection;
	
	public DBConnection() {
		dbDriver  ="com.mysql.jdbc.Driver";
		dbLocation="jdbc:mysql://latcs7.cs.latrobe.edu.au/j70li";
		dbUsername="";
		dbPassword="";
		connection = null;
	}
	
	public Connection getConnection() throws Exception
	{		
		try{
			Class.forName( dbDriver );
			connection = DriverManager.getConnection( dbLocation, dbUsername,dbPassword );
		}
		catch( ClassNotFoundException cnfe ){
			System.out.println( "DBCONNECTION: DB_DRIVER_NOT_FOUND: " + cnfe );
		}
		catch( SQLException sqle ){
			System.out.println( "DBCONNECTION: SQL_EXCEPTION: " + sqle );
		}
		finally{}
		return connection;
		
	}
	
	 // insert records
    public boolean insert(String sql, Object... args) throws Exception{
        PreparedStatement pstmt = (PreparedStatement) getConnection().prepareStatement(sql);
        for(int i = 0; i < args.length; i++) {
            pstmt.setObject(i + 1, args[i]); 
        }
        if(pstmt.executeUpdate() != 1)
            return false;
        return true;
    }
    
    // execute query
    public ResultSet query(String sql, Object...args) throws Exception{
        PreparedStatement pstmt = (PreparedStatement) getConnection().prepareStatement(sql);
        for(int i=0; i< args.length; i++) {
            pstmt.setObject(i+1, args[i]);
        }
        return pstmt.executeQuery();
    }
    
    public void modify(String sql, Object...args) throws Exception{
        PreparedStatement pstmt = (PreparedStatement)getConnection().prepareStatement(sql);
        for(int i = 0; i< args.length; i++) {
            pstmt.setObject(i+1, args[i]);
        }
        pstmt.executeUpdate();
        pstmt.close();
    }
    
	public void close()throws Exception{
		if(this.connection != null  && !this.connection.isClosed()){ //avoid NullPointerException
			try{
				this.connection.close(); //close database
			}
			catch(Exception e){
				throw e;
			}
		}
	}
}