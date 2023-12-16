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

    public List<User> getUsersID_first_last_name() throws Exception{

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

    public User authenticate(String username, String password) throws Exception {
		
			
		BConnection db = new BConnection();
        Connection conn = null;
		String query = "SELECT userID, username, email, account_password, first_name, last_name, date_of_birth, is_host FROM users WHERE username=? AND account_password=?";

		try {

			conn = db.openConnection();
			PreparedStatement stmt = conn.prepareStatement(query);

			// setting parameter
			stmt.setString(1, username);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (!rs.next()) {
                rs.close();
                stmt.close();
                db.closeConnection(); 
                throw new Exception("Wrong username or password");
            }

			User user = new User( rs.getString(5), rs.getString(6),
                 rs.getString(3), rs.getString(2), rs.getString(4), rs.getString(1),
                 rs.getInt(7), rs.getBoolean(8));

			rs.close();
            stmt.close();
            db.closeConnection(); 

			return user;
			
		} catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.closeConnection(); 
            } catch (Exception e) {
                
            }
        }
		
	}

    public User findUser(String userID) throws Exception {
		
		BConnection db = new BConnection();
        Connection conn = null;
		String query = "SELECT first_name, last_name, email, date_of_birth FROM users WHERE userID=?";

		try {

			User user = null;
			conn = db.openConnection();
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, userID);
            ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User( rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4) );
            }

			rs.close();
            stmt.close();
            db.closeConnection();

			return user;

		} catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.closeConnection();
            } catch (Exception e) {
                
            }
        }
		
	}

    public void register(User user) throws Exception {
		BConnection db = new BConnection();
		Connection con;
		String query1= "SELECT * FROM users WHERE username=? OR email=?;";
		try {
			con = db.openConnection();
			PreparedStatement state = con.prepareStatement(query1);
			state.setString(1,user.getUsername());
			state.setString(2, user.getEmail());
			ResultSet rs=state.executeQuery();
			if (rs.next()) {
				throw new Exception("Sorry, username or email already registered");
			}
			String sql2="INSERT INTO users(username,email,password,is_host) VALUES (?,?,?,?);";
			state = con.prepareStatement(sql2);
			state.setString(1, user.getUsername());
			state.setString(2, user.getEmail());
			state.setString(3, user.getPassword());
			state.setBoolean(4, user.isHost());
		
			state.executeUpdate();
			rs.close();
			state.close();
			db.closeConnection();
			con.close();
		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally { 
			try {
				db.closeConnection();
			} catch (Exception e){

			}

		}			
		
	}

}