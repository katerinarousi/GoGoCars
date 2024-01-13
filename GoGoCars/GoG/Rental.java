package GoG;
import java.sql.*;

public class Rental {

    private PreparedStatement stmt = null;


    private String rentalID;
	private String startDate;
	private String endDate;
	private String location;
	private String startTime;
    private String endTime;
    private int totalPrice;
    private String renterID;
    private String carID;




    /**
     * Full constuctor -!-!-!-!-!-!-!-!-!-> kat: den eimai sigouri gia ton filo constructor. mipws prepei na einai adeios? 
     *   
     * @param rentalID
     * @param startDate
     * @param endDate
     * @param location     
     * @param startTime
     * @param endTime
     * @param totalPrice
     * 
     */

    
    public Rental(String rentalID,String startDate, String endDate, String location, String startTime, String endTime, int totalPrice) {        
        this.rentalID = rentalID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.location = location;
        this.startTime = startTime;
        this.endTime = endTime;
        this.totalPrice = totalPrice;

    }


    public Rental(String rentalID, String renterID, String carID, String startDate, String endDate, String location){
        this.rentalID = rentalID;
        this.renterID = renterID;
        this.carID = carID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.location = location;
    }

    public Rental(String rentalID, String renterID, String carID, String startDate, String endDate){
        this.rentalID = rentalID;
        this.renterID = renterID;
        this.carID = carID;
        this.startDate = startDate;
        this.endDate = endDate;
      
    }
    /**
     *  Setters - Getters 
     * 
     * */
    public String getRentalID() {
        return rentalID;
    }

    public void setRentalID(String rentalID) {
        this.rentalID = rentalID;
    }
    
    public String getRenterID() {
        return renterID;
    }

    public void setRenterID(String renterID) {
        this.renterID = renterID;
    }
     public String getCarID() {
        return carID;
    }

    public void setCarID(String carID) {
        this.carID = carID;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

}

    
