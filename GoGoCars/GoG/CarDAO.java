package GoG;

import java.util.List;
import java.util.ArrayList;
import java.util.Base64;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.text.ParseException;



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
        String sql = "SELECT DISTINCT carID FROM rental WHERE carID NOT IN (SELECT DISTINCT carID FROM ismgroup14.rental WHERE (start_datetime <=? AND end_datetime >= ?) OR (start_datetime >= ? AND end_datetime <= ?) OR (start_datetime <= ? AND end_datetime <= ?) OR (start_datetime >=?  AND end_datetime <= ?));";
        BConnection db = new BConnection();
        try {
            con= db.openConnection();

            String f_pick_up = formatDateForDatabase(pick_up);
            String f_drop_off = formatDateForDatabase(drop_off);

            PreparedStatement state = con.prepareStatement(sql);
            state.setString(2, f_drop_off);
            state.setString(1, f_pick_up);
            state.setString(4, f_drop_off);
            state.setString(3, f_pick_up);
            state.setString(6, f_drop_off);
            state.setString(5, f_pick_up);
            ResultSet rs = state.executeQuery();


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
            e.printStackTrace();
            throw new Exception(e);

        } finally {
            db.closeConnection();

        }
    }



    public Car getCarByID(int carID) throws Exception{
        Connection con = null;
        String sql = "SELECT * FROM ismgroup14.cars WHERE carID=?;";
        BConnection db = new BConnection();
        try {
            con= db.openConnection();
            PreparedStatement state = con.prepareStatement(sql);
            state.setInt(1,carID);
            ResultSet rs = state.executeQuery();
            Car car = null;
            if (rs.next()) {
                car = new Car(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getBoolean(5),
                    rs.getBoolean(6),
                    rs.getInt(7),
                    rs.getFloat(8),
                    rs.getString(9),
                    rs.getString(10)
                );
            }
           

            rs.close();
            state.close();

            return car;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            db.closeConnection();
        }


    }
    public String formatDateForDatabase(String date) throws ParseException {
        
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
    
        java.util.Date parsedDate = inputFormat.parse(date);
        return outputFormat.format(parsedDate);
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
/*
    /**
     * Transforms image path to byte sequence
     *
     * @return The bytes sequence of the image.
     * @throws Exception If any error occurs
     */
 /*   public String imgToBytes(String path) throws SQLException, IOException {

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
*/
    public Car findCar(String carID) throws Exception {
		
		BConnection db = new BConnection();
        Connection conn = null;
		String query = "SELECT model, price, ownerID, car_image FROM cars WHERE carID =?";

		try {

			Car car = null;
			conn = db.openConnection();
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, carID);
            ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				car = new Car( rs.getString(1), rs.getFloat(2), rs.getString(3), rs.getString(4) );
            }

			rs.close();
            stmt.close();
            db.closeConnection();

			return car;

		} catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.closeConnection();
            } catch (Exception e) {
                
            }
        }
		
	}
}