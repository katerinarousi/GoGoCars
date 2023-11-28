package GoG;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;

/**
 * UserDAO provides all the necessary methods related to users.
 * 
 */

public class UserDAO {
    /**
     * Returns userID, FirstName, LastName of Users.
     * 
     * @return List with userID, FirstName, LastName of Users.
     * @throws Exception If any error occurs 
     */

    public List<User> getUsersID_First_Last_Name() throws Exception{

        List<User> users = new ArrayList<User>();

        BConnection db = new BConnection();
        Connection conn = null;

        String query = "select userID, first_name, last_name from Users";

        try {
            conn = db.openConnection();
            PreparedStatement stmt = conn.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()){

                users.add( new User( rs.getString(1), rs.getString(2), rs.getString(3)) );
                System.out.println(users);
            }

            rs.close();
            stmt.close();
            db.closeConnection();
            
            return users;

        } catch (Exception e) {

            throw new Exception(e);

        } finally {

            try {

                db.closeConnection();    

            } catch (Exception e) {
                
            }
            
        }
    }
}