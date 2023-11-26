package GoG;

import java.sql.*;

public class BConnection {


    private Connection conn = null;
    private PreparedStatement stmt = null;


    public Connection openConnection() throws SQLException{

        String url = "jdbc:mysql://195.251.249.131:3306/ismgroup14";
        String username = "ismgroup14";
        final String password = "geg2hy";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (Exception e1) {
            throw new SQLException(e1);
        }
        try {           
            conn = DriverManager.getConnection(url, username, password);
        }
        catch (Exception e2){
            conn = null;
            throw new SQLException(e2);

        }

        return conn;

    }  
    
    public void closeConnection() throws SQLException{

        try {
            if (stmt != null)
              stmt.close();

      

        } catch(Exception e3) {
            throw new SQLException(e3);
        }    
    }
}