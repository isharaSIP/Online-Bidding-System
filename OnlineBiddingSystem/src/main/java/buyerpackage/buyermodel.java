package buyerpackage;

public class buyermodel {
	private int id;
	private String name;
	private String email;
	private String pwd;
	private String phoneNumber;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public buyermodel() {
		
		this.id =1;
		this.name ="janith";
		this.email ="janih@gmail.com";
		this.pwd = "Janith#123";
		this.phoneNumber = "0773318266";
		
		
		
	}
	public buyermodel(int id, String name, String email, String pwd, String phoneNumber) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.phoneNumber = phoneNumber;
	}
	
	
	

}
