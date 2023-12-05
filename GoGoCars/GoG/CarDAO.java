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

                //ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
                //String path = classLoader.getResource(rs.getString(10)).getPath();
                String path = (rs.getString(10));
                String img = imgToBytes(path);
                cars.add( new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getBoolean(6), rs.getInt(7), rs.getFloat(8), rs.getString(9), img));
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