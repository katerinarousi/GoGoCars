package GoG;

import java.sql.*;

public class DBConnection {


    private static String errorMessages = "";

    private static Connection con = null;

    private static PreparedStatement stmt = null, stmt1 = null;

    private static Statement stmt2 = null;
  
    private static ResultSet rs1 = null, rs2 = null;

    private final String Query = "select * from Cars;";
    
    public static void main(String args[]){
        try{
            open();
        } catch(Exception e){

        }
        getAllStudents();
    }


    public String getErrorMessages() {
        return errorMessages;
    }

  /**
   * Default Constructor.
   *
   */
  public DBConnection() {

  }

  /**
   * Provides a connection with the Database Server. Initializes JDBC driver
   * for MySQL. Establishes a connection with the Database Server.
   *
   * @throws SQLException
   *             (with the appropriate message) if any driver or connection
   *             error occured.
   */
  public static void open() throws SQLException {
    try {
      // for JDBC driver to connect to mysql, the .newInstance() method
      // can be ommited
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (Exception e1) {
      errorMessages = "MySQL Driver error: <br>" + e1.getMessage();
      throw new SQLException(errorMessages);
    }

    try {
      con = DriverManager.getConnection(
        "jdbc:mysql://195.251.249.131:3306/ismgroup14",
        "ismgroup14", "geg2hy"
          );
          System.out.println("CONNECTION DONE!");
    } catch (Exception e2) {
      errorMessages = "Could not establish connection with the Database Server: <br>"
          + e2.getMessage();
      con = null;
      System.err.println("noooooooooooooooooooooooooooooooooooooooooooooo");
      throw new SQLException(errorMessages);
    }

  }

  /**
   * Ends the connection with the database Server. Closes all Statements and
   * ResultSets. Finally, closes the connection with the Database Server.
   *
   * @throws SQLException
   *             (with the appropriate message) if any error occured.
   */
  public void close() throws SQLException {
    try {

      if (stmt != null)
        stmt.close();

      if (stmt1 != null)
        stmt1.close();

      if (rs1 != null)
        rs1.close();

      if (rs2 != null)
        rs2.close();

      if (con != null)
        con.close();

    } catch (Exception e3) {
      errorMessages = "Could not close connection with the Database Server: <br>"
          + e3.getMessage();
      throw new SQLException(errorMessages);
    }

  }

 
  /**
   * Returns the results (all registered students sorted by users critiria) in a ResultSet, or null if
   * any error occured.
   *
   * @return ResultSet
   */
  public static ResultSet getAllStudents() {

    try {
      if (con == null) {
        errorMessages = "You must establish a connection first!";
        System.err.println(errorMessages);
        return null;
      }
      String selectAllStudentsQuery = "";
        selectAllStudentsQuery = "select * from Cars;";

      stmt2 = con.createStatement();
      rs2 = stmt2.executeQuery(selectAllStudentsQuery);
      return rs2;
    } catch (Exception e5) {
      errorMessages = "Error while getting all cars from database!<br>"
          + e5.getMessage();
         System.err.println(errorMessages);

      return null;
    }
  }
}
    

