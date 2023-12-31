package GoG;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RentalDAO {

    private PreparedStatement stmt = null;
    private ResultSet rs = null;


    
    /**
     * Retrieves and displays information about a rental specified by its unique renter ID.
     *
     * @param rentalID the unique identifier of the rental to be displayed.
     * @throws Exception
    */  
    public List<Rental> showRental(String renterID) throws Exception{
        Connection c = null;
        String query = "select * from Rental where renterID = ?";
        List<Rental> rentals = new ArrayList<Rental>();
        BConnection db = new BConnection();
        Rental rental = null;
        try {
            c = db.openConnection();
            stmt = c.prepareStatement(query);
            stmt.setString(1, renterID);
            
            rs = stmt.executeQuery();

            while (rs.next()) {

                rental = new Rental(        
                                    rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4),
                                    rs.getString(5),
                                    rs.getString(6)                               
                                    ) ;
                rentals.add(rental);
            }

            rs.close();
            stmt.close();

            return rentals;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
			try {
				db.closeConnection();
			} catch (Exception e){

			}	
        }
    }

    public boolean checkAvailability(String carID, String pickUp, String dropOff) throws Exception{
        Connection con = null;
        String sql = "SELECT DISTINCT carID FROM rental WHERE carID=? AND carID NOT IN (SELECT DISTINCT carID FROM ismgroup14.rental WHERE (start_datetime <=? AND end_datetime >= ?) OR (start_datetime >= ? AND end_datetime <= ?) OR (start_datetime <= ? AND end_datetime <= ? AND end_datetime >= ?) OR (start_datetime >= ?  AND end_datetime >= ? AND start_datetime <= ?)) AND (? <= ?);";
        BConnection db = new BConnection();
        try {
            con = db.openConnection();

            PreparedStatement state = con.prepareStatement(sql);

            state.setString(1, carID);
            state.setString(2, pickUp);
            state.setString(3, dropOff);
            state.setString(4, pickUp);
            state.setString(5, dropOff);
            state.setString(6, pickUp);
            state.setString(7, dropOff);
            state.setString(8, pickUp);
            state.setString(9, pickUp);
            state.setString(10, dropOff);
            state.setString(11, dropOff);
            state.setString(12, pickUp);
            state.setString(13, dropOff);

            ResultSet rs = state.executeQuery();


            if(rs.next()) {
                rs.close();
                state.close();
                db.closeConnection();
                return true;
            }

            sql = "SELECT carID FROM cars WHERE carID=? AND carID NOT IN (SELECT rental.carID FROM rental);";

            state = con.prepareStatement(sql);
            state.setString(1, carID);
            rs = state.executeQuery();

            if(rs.next()){
                rs.close();
                state.close();
                db.closeConnection();
                return true;
            }
            
            rs.close();
            state.close();
            db.closeConnection();
            return false;

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e);

        } finally {
			try {
				db.closeConnection();
			} catch (Exception e){

			}	
        }
    
    }

    public void makeReservation(String hostID, String carID, String pickUp, String dropOff, String location) throws Exception {
        BConnection db = new BConnection();
		Connection con = null;
        String sql="INSERT INTO rental(renterID,carID,start_datetime,end_datetime,place) VALUES (?,?,?,?,?);";
        try {
			
            con = db.openConnection();

            PreparedStatement state = con.prepareStatement(sql);

			state = con.prepareStatement(sql);
			state.setString(1, hostID);
			state.setString(2, carID);
			state.setString(3, pickUp);
			state.setString(4, dropOff);
            state.setString(5, location);
		
			state.executeUpdate();
			rs.close();
			state.close();
			db.closeConnection();
			con.close();
		} catch (Exception e){
			e.printStackTrace();
		} finally { 
			try {
				db.closeConnection();
			} catch (Exception e){

			}	
        }    	
		
    }

}


/*       
for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    String columnName = rs.getMetaData().getColumnName(i);
                    String columnValue = rs.getString(i);
                    System.out.println(columnName + ": " + columnValue);
                }
                 
                gia mesa sto rs, paizetai kiolas ti tha kanw telika
*/
