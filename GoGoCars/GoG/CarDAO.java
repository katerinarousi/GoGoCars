package GoG;

import java.util.List;
import java.util.ArrayList;
import java.util.Base64;
import java.sql.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;



/**
 * CarDAO provides all the necessary methods related to cars.
 *
 */
public class CarDAO{

    /**
     * Returns all luxury cars.
     *
     * @return List the luxury cars for carousel.
     * @throws Exception If any error occurs
     */

    
    public List<Car> getSearchCars(String pick_up,String drop_off) throws Exception {
        Connection con = null;
        List<Car> carList = new ArrayList<Car>();
        String sql = "SELECT carID FROM rental WHERE carID NOT IN (SELECT DISTINCT carID FROM ismgroup14.rental WHERE (start_datetime <=? AND end_datetime >= ?) OR (start_datetime <= ? AND end_datetime >= ?) OR (start_datetime >= ? AND end_datetime <= ?));";
        BConnection db = new BConnection();
        try {
            con= db.openConnection();
            PreparedStatement state = con.prepareStatement(sql);
            state.setString(1, drop_off);
            state.setString(2, pick_up);
            state.setString(3, drop_off);
            state.setString(4, pick_up);
            state.setString(5, drop_off);
            state.setString(6, pick_up);
            ResultSet rs = state.executeQuery();

            if (!rs.next()) {
                rs.close();
                state.close();
                db.closeConnection();
                throw new Exception("Τhere are no cars available on these dates");

            }

            while(rs.next()) {
                int carID = rs.getInt("carID");
                Car car = getCarByID(carID);
                carList.add(car);
            }

            rs.close();
            state.close();
            db.closeConnection();
            return carList;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try{
                db.closeConnection();
            } catch (Exception exception) {
            }
        }

    }
    private Car getCarByID(int carID) throws Exception{
        Connection con = null;
        String sql = "SELECT * FROM ismgroup14.cars WHERE carID=?;";
        BConnection db = new BConnection();
        try {
            con= db.openConnection();
            PreparedStatement state = con.prepareStatement(sql);
            ResultSet rs = state.executeQuery();
            if (!rs.next()) {
				rs.close();
				state.close();
				return null;
			}
            return new Car(
    			rs.getString("model"),
    			rs.getString("fuel"),
   				rs.getBoolean("hybrid"),
    			rs.getBoolean("transmission"),
    			rs.getInt("year_car"),
                rs.getFloat("price"),
                rs.getString("ownerID"));


        } catch (Exception e){
            throw new Exception(e.getMessage());

        }


    }


    public List<Car> getCarouselCars() throws Exception{

        List<Car> cars = new ArrayList<Car>();

        BConnection db = new BConnection();
        Connection conn = null;
        String query = "Select * from Cars Where price >= 30";

        try {
            conn = db.openConnection();
            PreparedStatement stmt = conn.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()){

                String path = (rs.getString(10));
                /*String img = imgToBytes(path); for when i worked with Byte Arrays*/
                cars.add( new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getBoolean(6), rs.getInt(7), rs.getFloat(8), rs.getString(9), path/*img*/));
                System.out.println("image okay");
            }

            rs.close();
            stmt.close();
            db.closeConnection();

            return cars;

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e);

        } finally {
            db.closeConnection();

        }
    }

    /**
     * Transforms image path to byte sequence
     *
     * @return The bytes sequence of the image.
     * @throws Exception If any error occurs
     */
    public String imgToBytes(String path) throws SQLException, IOException {

        try{
            InputStream input = ClassLoader.getSystemResourceAsStream(path);
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];

            int bytesRead = -1;

            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = output.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);

            input.close();
            output.close();
            return base64Image;


        } catch (IOException ex) {
            ex.printStackTrace();
            throw ex;

        }
    }
}