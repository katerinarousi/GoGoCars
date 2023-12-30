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

            db.closeConnection();
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
