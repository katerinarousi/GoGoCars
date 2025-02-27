package GoG;

public class User {
    private String firstname;
	private String lastname;
	private String email;
	private String username;
	private String password;
    private String userID;
    private String phone;
    private String dob;
    private boolean isHost;


    /**
     * Full constuctor
     *   
     * @param firstname
     * @param lastname
     * @param email
     * @param username
     * @param password
     * @param userID
     * @param phone
     * @param dob
     * @param isHost
     */
    
    public User(String firstname, String lastname, String email, String username, String password, String userID, String phone, String dob, boolean isHost) {        
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.username = username;
        this.password = password;
        this.userID = userID;
        this.phone = phone;
        this.dob = dob;
        this.isHost = isHost;
    }

    public User(String firstname, String lastname, String email, String username, String password, String userID, String dob, boolean isHost) {        
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.username = username;
        this.password = password;
        this.userID = userID;
        this.dob = dob;
        this.isHost = isHost;
    }

    public User(String firstname, String lastname, String email, String dob) {        
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.dob = dob;
    }
    
    public User(String userID, String firstname, String lastname) {        
        this.firstname = firstname;
        this.lastname = lastname;
        this.userID = userID;
    }

    public User(String username, String email, String password, boolean isHost) {        
        this.username = username;
        this.email = email;
        this.password = password;
        this.isHost = isHost;
    }


    
    /* -!-!-!-!-!-!-> kat: apla gia test treximatos */
    public static void main(String[] args) throws Exception{
             
        CarDAO test = new CarDAO();
        System.out.println(test.getFiltered(test.getCarouselCars(), "carType", "Sedan" ));

        
    }
    /**
     *  Setters - Getters 
     * 
     * */

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setPassword(String password) {
        this.password = password;        
    }  

    public String getPassword() {
        return password;
    }

    public String getUserID(){
        return userID;
    }

    public void setUserID(String userID){
        this.userID = userID;
    }

    public String getPhone(){
        return phone;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }

    public String getDob(){
        return dob;
    }

    public void setDob(String dob){
        this.dob = dob;
    }

    
    public boolean isHost(){
        return isHost;
    }

    public void setIsHost(boolean isHost){
        this.isHost = isHost;

    }
    
    
    public void Login(){

    }

    public void Register(){

    }

    public void Logout(){

    }

}
