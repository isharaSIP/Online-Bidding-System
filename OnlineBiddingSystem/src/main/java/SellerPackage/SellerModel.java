package SellerPackage;

public class SellerModel {

	private int id;
	private String name;
	private String nic;
	private String province;
	private String district;
	private String mobile;
	private String email;
	private String password;
	
	public SellerModel(int id, String name, String nic, String province, String district, String mobile, String email, String password) {
		super();
		this.id = id;
		this.name = name;
		this.nic = nic;
		this.province = province;
		this.district = district;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
	}	
	

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

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
