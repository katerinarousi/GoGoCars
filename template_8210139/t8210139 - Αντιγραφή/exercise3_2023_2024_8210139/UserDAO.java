package exercise3_2023_2024_8210139;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * UserDAO provides all the necessary methods related to users.
 * 
 * @author 
 *
 */
public class UserDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {
		DB db=new DB();
		Connection con;
		List<User> users = new ArrayList<User>();
		String query = "SELECT * FROM users_ex3_8210139_2023_2024;";
		
		try {
            con = db.getConnection();
            PreparedStatement state = con.prepareStatement(query);

            ResultSet rs = state.executeQuery();
			while (rs.next()) {
                users.add(new User(
    				rs.getString("firstname"),
    				rs.getString("lastname"),
    				rs.getString("email"),
    				rs.getString("username"),
    				rs.getString("password")
				));
            }
            rs.close();
            state.close();
            db.close();

            return users;
    
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }       		
	} //End of getUsers

	/**
	 * Search user by username
	 * 
	 * @param username, String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {
		DB db = new DB();
		Connection con;
		String query ="SELECT * FROM users_ex3_8210139_2023_2024 WHERE username=?;";
		try {
			con= db.getConnection();
			PreparedStatement state = con.prepareStatement(query);
			state.setString(1, username);
			ResultSet rs = state.executeQuery();
			if (!rs.next()) {
				rs.close();
				state.close();
				return null;
			}
			return new User(
    			rs.getString("firstname"),
    			rs.getString("lastname"),
   				rs.getString("email"),
    			rs.getString("username"),
    			rs.getString("password")
			);

		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally { 
			try {
				db.close();
			} catch (Exception e){

			}

		}		
	} //End of findUser

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		DB db = new DB();
		Connection con;
		String query = "SELECT * FROM users_ex3_8210139_2023_2024 WHERE username=? AND password=?;";
		try {
			con = db.getConnection();
			PreparedStatement state = con.prepareStatement(query);
			state.setString(1,username);
			state.setString(2,password);
			ResultSet rs = state.executeQuery();

			if (!rs.next()){
				rs.close();
				state.close();
				db.close();
				throw new Exception("Wrong username or password");
			}
			User user = new User(rs.getString("firstname"),rs.getString("lastname"),rs.getString("email"),rs.getString("username"),rs.getString("password"));
			rs.close();
			state.close();
			db.close();
			return user;

		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}
			
		
			
		
	} //End of authenticate
	
	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
		DB db = new DB();
		Connection con;
		String query1= "SELECT * FROM users_ex3_8210139_2023_2024 WHERE username=? OR email=?;";
		try {
			con = db.getConnection();
			PreparedStatement state = con.prepareStatement(query1);
			state.setString(1,user.getUsername());
			state.setString(2, user.getEmail());
			ResultSet rs=state.executeQuery();
			if (rs.next()) {
				throw new Exception("Sorry, username or email already registered");
			}
			String sql2="INSERT INTO users_ex3_8210139_2023_2024(firstname,lastname,email,username,password) VALUES (?,?,?,?,?);";
			state = con.prepareStatement(sql2);
			state.setString(1, user.getFirstname());
			state.setString(2, user.getLastname());
			state.setString(3, user.getEmail());
			state.setString(4, user.getUsername());
			state.setString(5, user.getPassword());
			state.executeUpdate();
			rs.close();
			state.close();
			db.close();
			con.close();
		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally { 
			try {
				db.close();
			} catch (Exception e){

			}

		}		
			
		
			

		
		
		
	}//end of register

} //End of class
