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