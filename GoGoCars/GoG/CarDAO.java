package GoG;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;
import java.text.SimpleDateFormat;

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

    
public List<Car> getSearchCars(String fPickUp,String fDropOff) throws Exception {
        Connection con = null;
        List<Car> carList = new ArrayList<Car>();
        String sql = "SELECT DISTINCT carID FROM rental WHERE carID NOT IN (SELECT DISTINCT carID FROM ismgroup14.rental WHERE (start_datetime <=? AND end_datetime >= ?) OR (start_datetime >= ? AND end_datetime <= ?) OR (start_datetime <= ? AND end_datetime <= ? AND end_datetime >= ?) OR (start_datetime >= ?  AND end_datetime >= ? AND start_datetime <= ?)) AND (? <= ?)  AND (? >= CURDATE());";
        BConnection db = new BConnection();
        try {
            con = db.openConnection();

            PreparedStatement state = con.prepareStatement(sql);

            state.setString(1, fPickUp);
            state.setString(2, fDropOff);
            state.setString(3, fPickUp);
            state.setString(4, fDropOff);
            state.setString(5, fPickUp);
            state.setString(6, fDropOff);
            state.setString(7, fPickUp);
            state.setString(8, fPickUp);
            state.setString(9, fDropOff);
            state.setString(10, fDropOff);
            state.setString(11, fPickUp);
            state.setString(12, fDropOff);
            state.setString(13, fPickUp);

            ResultSet rs = state.executeQuery();


            while(rs.next()) {
                int carID = rs.getInt("carID");
                Car car = getCarByID(carID);
                carList.add(car);
            }

            sql = "SELECT carID FROM cars WHERE carID NOT IN (SELECT rental.carID FROM rental);";

            state =con.prepareStatement(sql);
            rs = state.executeQuery();

            while(rs.next()){

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
            try {
				db.closeConnection();
			} catch (Exception e){

			}	

        }
    }


    public List<Car> getFiltered(List<Car> carsIn, String filter, String value) throws Exception {
        Connection con = null;
        List<Car> carsOut = new ArrayList<Car>();
        List<String> aidis = new ArrayList<String>();
        for (int i=0; i<carsIn.size(); i++ ){
            aidis.add(carsIn.get(i).getCarID());
        }
        String query = "SELECT carID FROM cars WHERE " + filter + " = ?;";
        System.err.println(query);
        BConnection db = new BConnection();
        try {
            con = db.openConnection();
    
            PreparedStatement state = con.prepareStatement(query);
            state.setString(1, value);
    
            ResultSet rs = state.executeQuery();
    
            while (rs.next()) {
                String carID = rs.getString(1);
                if (aidis.contains(carID)) {   
                    carsOut.add(getCarByID(Integer.parseInt(carID)));
                }
                
            }

            rs.close();
            state.close();
            db.closeConnection();
            return carsOut;

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e);
        } finally {
            try {
                db.closeConnection();
            } catch (Exception e) {
    
            }
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
			try {
				db.closeConnection();
			} catch (Exception e){

			}	
        }


    }
    

    public Car findmycar(String carID) throws Exception {
		
		BConnection db = new BConnection();
        Connection conn = null;
		String query = "SELECT model, price FROM cars WHERE carID=?";

		try {

			Car car= null; 
			conn = db.openConnection();
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, carID);
            ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				car = new Car( rs.getString(1), rs.getFloat(2) );
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
    public String formatDateForDatabase(String date) throws Exception {
      
        try {
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        
            java.util.Date parsedDate = inputFormat.parse(date);
            return outputFormat.format(parsedDate);
        }catch(Exception e){
            
            System.err.println(e.getMessage());
            throw new Exception("Error parsing date: " + e.getMessage());
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
			try {
				db.closeConnection();
			} catch (Exception e){

			}	
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