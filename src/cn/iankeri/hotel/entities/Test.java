package cn.iankeri.hotel.entities;

import java.util.Date;

public class Test {
	private Integer id;
	private String ipAddress;
	private Date loginTime;
	private String hostName;
	private String port;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public Test() {
		// TODO Auto-generated constructor stub
	}
	public Test(Integer id, String ipAddress, Date loginTime, String hostName, String port) {
		super();
		this.id = id;
		this.ipAddress = ipAddress;
		this.loginTime = loginTime;
		this.hostName = hostName;
		this.port = port;
	}
	
}
