package GoG;

public class Car{

    private String carID;
	private String carType;
	private float price;
	private String model;
    private String ownerID;
    private int year;
    private String fuel; 
	private boolean transmission;
    private boolean isHybrid;

    private String image;

    /**
     * Full constuctor
     *   
     * @param carID
     * @param carType
     * @param price
     * @param model
     * @param ownerID
     * @param year
     * @param fuel
     * @param trnsmission
     * @param isHybrid
     * 
     */
    
    public Car(String carID, String carType, String model , String fuel, boolean isHybrid, boolean transmission, int year, float price, String ownerID, String image) {        
       this.carID = carID;
       this.carType = carType;
       this.model = model;
       this.fuel = fuel;
       this.isHybrid = isHybrid;
       this.transmission = transmission;
       this.year = year;
       this.price = price;
       this.ownerID = ownerID;
       this.image = image;

    }

    public Car() {
        
    }

    public Car(String model , String fuel, boolean isHybrid, boolean transmission, int year, float price, String ownerID) {        
       this.model = model;
       this.fuel = fuel;
       this.isHybrid = isHybrid;
       this.transmission = transmission;
       this.year = year;
       this.price = price;
       this.ownerID = ownerID;

    }

    public Car(String model, float price, String ownerID, String image) {
       this.model = model;
       this.price = price;
       this.ownerID = ownerID;
       this.image = image;

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

    public String getOwnerID(){
        return ownerID;
    }

    public void setOwnerID(String ownerID){
        this.ownerID = ownerID;

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
        String ismanual;
        if (transmission) {
            ismanual="manual";   
        }else{
            ismanual="automatic";
        }
        return ismanual;
    }

    public void setTransmission(boolean transmission) {
        this.transmission = transmission;
    }
    
    
    public String isHybrid(){
        String hybrid= "Not hybrid";
        if (isHybrid) {
            hybrid="hybrid";
        }
        return hybrid;
    }

    public void setIsHybrid(boolean isHybrid){
        this.isHybrid = isHybrid;

    }

    public String getImage() {
        return image;
    }
 
    public void setImage(String image) {
        this.image = image;
    }

    
}