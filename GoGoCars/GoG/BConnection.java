package GoG;

import java.sql.*;

public class BConnection {


    private final String dbServer = "195.251.249.131";
	private final String dbServerPort = "3306";
	private final String dbName = "ismgroup14";
	private final String dbusername = "ismgroup14";
	private final String dbpassword = "geg2hy";
    
    private Connection conn = null;
    private PreparedStatement stmt = null;


    public Connection openConnection() throws SQLException{
        
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } 
        catch (Exception e1) {
            throw new SQLException(e1);
        }
        
        
        try {           
            conn = DriverManager.getConnection("jdbc:mysql://" 
            + dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);
        }
        catch (Exception e2){
            conn = null;
            throw new SQLException(e2);
        }
        return conn;
    }  
    
    public void closeConnection() throws SQLException{

        try {
            if (conn != null)
                conn.close();

      

        } catch(Exception e3) {
            throw new SQLException(e3);
        }    
    }
}