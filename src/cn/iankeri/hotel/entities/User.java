package cn.iankeri.hotel.entities;

public class User {
	private Integer id;
	private String name;
	private String gender;
	private String telNum;
	private String email;
	private String idCard;
	private String address;
	private String password;
	private String headImg;
	private String styleImg;
	private Boolean isVip;
	private Boolean usable;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public String getStyleImg() {
		return styleImg;
	}
	public void setStyleImg(String styleImg) {
		this.styleImg = styleImg;
	}
	public Boolean getIsVip() {
		return isVip;
	}
	public void setIsVip(Boolean isVip) {
		this.isVip = isVip;
	}
	public Boolean getUsable() {
		return usable;
	}
	public void setUsable(Boolean usable) {
		this.usable = usable;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String name, String gender, String telNum, String email, String idCard, String address,
			String password, String headImg, String styleImg, Boolean isVip, Boolean usable) {
		super();
		this.name = name;
		this.gender = gender;
		this.telNum = telNum;
		this.email = email;
		this.idCard = idCard;
		this.address = address;
		this.password = password;
		this.headImg = headImg;
		this.styleImg = styleImg;
		this.isVip = isVip;
		this.usable = usable;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", gender=" + gender + ", telNum=" + telNum + ", email=" + email
				+ ", idCard=" + idCard + ", address=" + address + ", password=" + password + ", headImg=" + headImg
				+ ", styleImg=" + styleImg + ", isVip=" + isVip + ", usable=" + usable + "]";
	}
	
}
