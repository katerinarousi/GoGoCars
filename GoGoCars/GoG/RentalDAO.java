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
    public List<Map<String, String>> showRental(String hostID) throws Exception {
        Connection con = null;
        String query = "select rentalID, model, last_name, first_name, price, start_datetime, end_datetime " +
                       "from rental, cars, users " +
                       "where rental.carID = cars.carID AND cars.ownerID = ? and rental.renterID = users.userID;";
        
        List<Map<String, String>> resultList = new ArrayList<>();
        BConnection db = new BConnection();
        
        try {
            con = db.openConnection();
            stmt = con.prepareStatement(query);
            stmt.setString(1, hostID);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Map<String, String> resultMap = new HashMap<>();
                resultMap.put("rentalID", rs.getString("rentalID"));
                resultMap.put("model", rs.getString("model"));
                resultMap.put("last_name", rs.getString("last_name"));
                resultMap.put("first_name", rs.getString("first_name"));
                resultMap.put("price", rs.getString("price"));
                resultMap.put("start_datetime", rs.getString("start_datetime"));
                resultMap.put("end_datetime", rs.getString("end_datetime"));

                resultList.add(resultMap);
            }
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

}


/*       
for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    String columnName = rs.getMetaData().getColumnName(i);
                    String columnValue = rs.getString(i);
                    System.out.println(columnName + ": " + columnValue);
                }
                 
                gia mesa sto rs, paizetai kiolas ti tha kanw telika
*/
