package cn.iankeri.hotel.web;

import cn.iankeri.hotel.entities.Admin;

public class CriteriaAdmin {
	private Admin admin;
	private Integer pageNo;
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public CriteriaAdmin() {
		// TODO Auto-generated constructor stub
	}
	public CriteriaAdmin(Admin admin, Integer pageNo) {
		super();
		this.admin = admin;
		this.pageNo = pageNo;
	}
	
}
