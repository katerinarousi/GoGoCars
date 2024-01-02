package GoG;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RentalDAO {

    private PreparedStatement stmt = null;
    private ResultSet rs = null;


    /**
     * Retrieves and displays information about a rental specified by its unique renter ID.
     *
     * @param rentalID the unique identifier of the rental to be displayed.
     * @throws Exception
    */  
    public List<Rental> showRental(String hostID) throws Exception {
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


/*       
for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    String columnName = rs.getMetaData().getColumnName(i);
                    String columnValue = rs.getString(i);
                    System.out.println(columnName + ": " + columnValue);
                }
                 
                gia mesa sto rs, paizetai kiolas ti tha kanw telika
*/
