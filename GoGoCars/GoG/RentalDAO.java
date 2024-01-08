package GoG;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;


public class RentalDAO {

    private PreparedStatement stmt = null;
    private ResultSet rs = null;


    /**
     * Retrieves and displays information about a rental specified by its unique renter ID.
     *
     * @param rentalID the unique identifier of the rental to be displayed.
     * @throws Exception
    */  
   

    public List<Rental> showRental(String hostID) throws Exception{
        Connection c = null;
        String carQuery = "select carID from Cars where ownerID = ?";
        List<String> carsOfHost = new ArrayList<String>();
        BConnection db = new BConnection();
        try{
            c = db.openConnection();
            stmt = c.prepareStatement(carQuery);
            stmt.setString(1, hostID);
            rs = stmt.executeQuery();
            while(rs.next()){
                carsOfHost.add(rs.getString(1));
            }
            rs.close();
            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            db.closeConnection();
        }
            
        String rentalQuery = "select * from Rental where carID = ?";
        List<Rental> rentals = new ArrayList<Rental>();
        Rental rental = null;
        try {
            c = db.openConnection();
            stmt = c.prepareStatement(rentalQuery);
            for (int i =0; i < carsOfHost.size(); i++){
                stmt.setString(1, carsOfHost.get(i));
                rs = stmt.executeQuery();
                while (rs.next()) {

                    rental = new Rental(        
                                        rs.getString(1),
                                        rs.getString(2),
                                        rs.getString(3),
                                        rs.getString(4),
                                        rs.getString(5),
                                        rs.getString(6)                               
                                        );
                    rentals.add(rental);
                }

            }
                    
            rs.close();
            stmt.close();

            return rentals;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            db.closeConnection();
        }
    }

    public int getStatus(String startDate, String endDate) throws ParseException{
        /* 1 for Completed, 2 for In Progress, 3 for Upcoming */
        int status = 0;

        Date currentDate = new Date(); 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date start = sdf.parse(startDate);
        Date end = sdf.parse(endDate);

        if (end.before(currentDate) && end.after(currentDate)){
            status = 2;
        } else if (start.after(currentDate)){
            status = 3;
        } else if (start.before(currentDate) ){
            status = 2;
        }       
        return status;
    }

    public void makeRental(int renterID, int carID, String startDate, String endDate, String startTime, String endTime,  String location){
        
        String query = "insert into rental (renterID, carID, start_datetime, end_datetime, place) values (?,?,?,?,?)";

        BConnection obj = new BConnection();
        try {
            Connection c = obj.openConnection();
            stmt = c.prepareStatement(query);
            stmt.setInt(1, renterID);
            stmt.setInt(2, carID);
            stmt.setString(3, startDate + " " + startTime);
            stmt.setString(4, endDate + " " + endTime);
            stmt.setString(5, location);

            
            stmt.executeUpdate();
            stmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
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

    public boolean checkAvailability(String carID, String pickUp, String dropOff) throws Exception{
        Connection con = null;
        String sql = "SELECT DISTINCT carID FROM rental WHERE carID=? AND carID NOT IN (SELECT DISTINCT carID FROM ismgroup14.rental WHERE (start_datetime <=? AND end_datetime >= ?) OR (start_datetime >= ? AND end_datetime <= ?) OR (start_datetime <= ? AND end_datetime <= ? AND end_datetime >= ?) OR (start_datetime >= ?  AND end_datetime >= ? AND start_datetime <= ?)) AND (? <= ?) AND (? >= CURDATE());";
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
            state.setString(14, pickUp);

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

}




/*       
for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    String columnName = rs.getMetaData().getColumnName(i);
                    String columnValue = rs.getString(i);
                    System.out.println(columnName + ": " + columnValue);
                }
                 
                gia mesa sto rs, paizetai kiolas ti tha kanw telika
*/

 /*public List<Rental> showRental(String hostID) throws Exception {
        Connection con = null;
        String query = "select rentalID,renterID,carID, start_datetime, end_datetime " +
                       "from rental" +
                       "where cars.ownerID = ?;";
        
        List<Rental> rentals = new ArrayList<>();
        BConnection db = new BConnection();
        
        try {
             Rental rental;
            con = db.openConnection();
            stmt = con.prepareStatement(query);
            stmt.setString(1, hostID);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                rental = new Rental(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
        );
        rentals.add(rental);
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            db.closeConnection();
        }
        
        return rentals;
    }
}
*/