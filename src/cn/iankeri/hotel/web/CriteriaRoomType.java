package cn.iankeri.hotel.web;

import cn.iankeri.hotel.entities.RoomType;

public class CriteriaRoomType {
	private RoomType roomType;
	
	private Integer pageNo;

	public RoomType getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public CriteriaRoomType() {
	}

	public CriteriaRoomType(RoomType roomType, Integer pageNo) {
		super();
		this.roomType = roomType;
		this.pageNo = pageNo;
	}
	
	
}
