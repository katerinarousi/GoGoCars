package GoG;

public class Car{

    private String carID;
	private String carType;
	private float price;
	private String model;
    private boolean isRented;
    private int year;
    private String fuel; 
	private String transmission;
    private boolean isHybrid;

    /**
     * Full constuctor
     *   
     * @param carID
     * @param carType
     * @param price
     * @param model
     * @param isRented
     * @param year
     * @param fuel
     * @param trnsmission
     * @param isHybrid
     * 
     */
    
    public Car(String carID, String carType, float price, String model, boolean isRented, int year, String fuel, String transmission, boolean isHybrid) {        
       this.carID = carID;
       this.carType = carType;
       this.price = price;
       this.model = model;
       this.isRented = isRented;
       this.year = year;
       this.fuel = fuel;
       this.transmission = transmission;
       this.isHybrid = isHybrid;

    }

     public String getCarID() {
        return carID;
    }

    public void setCarID(String carID) {
        this.carID = carID;
    }

    public String getCarType() {
        return carType;
    }

    public void setType(String carType) {
        this.carType = carType;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public boolean isRented(){
        return isRented;
    }

    public void setIsRented(boolean isRented){
        this.isRented = isRented;

    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    public void setFuel(String fuel) {
        this.fuel = fuel;        
    }  

    public String getFuel() {
        return fuel;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }
    
    
    public boolean isHybrid(){
        return isHybrid;
    }

    public void setIsHybrid(boolean isHybrid){
        this.isHybrid = isHybrid;

    }
    
   

    
}