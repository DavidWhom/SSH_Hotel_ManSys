package cn.iankeri.hotel.web;

import cn.iankeri.hotel.entities.Room;

public class CriteriaRoom {
	private Room room;
	private Integer pageNo;
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public CriteriaRoom(Room room, Integer pageNo) {
		super();
		this.room = room;
		this.pageNo = pageNo;
	}
	
	public CriteriaRoom() {

	}
}
