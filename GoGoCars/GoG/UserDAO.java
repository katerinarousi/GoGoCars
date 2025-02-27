package GoG;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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

        String query = "SELECT userID, first_name, last_name FROM Users";

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
		String query = "SELECT * FROM users WHERE username=? AND account_password=?";

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
                 rs.getString(8), rs.getString(7) ,rs.getBoolean(9));

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
				user = new User( rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4) );
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
                rs.close();
                state.close();
                db.closeConnection(); 
				throw new Exception("Sorry, username or email already registered");
			}
			String sql2="INSERT INTO users(username,email,account_password,is_host) VALUES (?,?,?,?);";
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

    public void updateUserData(String userID, String firstname, String lastname, String dateOfBirth, String contactNumber) throws Exception {
		BConnection db = new BConnection();
		Connection con;
		String sql= "UPDATE ismgroup14.users SET first_name =?, last_name =?, date_of_birth =?, phone =? WHERE userID =?;";
		try {
			con = db.openConnection();
			PreparedStatement stmt = con.prepareStatement(sql);

            stmt = con.prepareStatement(sql);
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, dateOfBirth);
            stmt.setString(4, contactNumber);
            stmt.setString(5, userID);
        
            stmt.executeUpdate();
            stmt.close();
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

    public Boolean dateComparison(String date) {

        boolean legal = false;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate birthdate = LocalDate.parse(date, formatter);

        // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Check if the user is 21 years or more old
        LocalDate legalAgeDate = currentDate.minusYears(21);
        if (birthdate.isBefore(legalAgeDate)) {
            legal = true;
        }
        
        return legal;
    }

}