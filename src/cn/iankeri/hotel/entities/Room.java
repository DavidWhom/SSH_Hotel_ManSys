package cn.iankeri.hotel.entities;

public class Room {
	private Integer id;
	private String roomName;
	private Integer states;
	
	private RoomType roomType;
	
	public RoomType getRoomType() {
		return roomType;
	}
	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	@Override
	public String toString() {
		return "Room [id=" + id + ", roomName=" + roomName + ", states=" + states + ", roomType=" + roomType + "]";
	}
	
	
	
}
