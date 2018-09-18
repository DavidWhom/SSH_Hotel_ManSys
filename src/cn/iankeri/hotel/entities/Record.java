package cn.iankeri.hotel.entities;

import java.math.BigDecimal;
import java.util.Date;

public class Record {
	private Integer orderId;
	private BigDecimal price;
	private Date arrivalTime;//预计到达时间
	private Date departureTime;//预计离开时间
	private Date realTime;//实际离开时间
	private Integer states;//
	
	private Room room;
	
	private User user;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Date getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public Date getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}

	public Date getRealTime() {
		return realTime;
	}

	public void setRealTime(Date realTime) {
		this.realTime = realTime;
	}

	public Integer getStates() {
		return states;
	}

	public void setStates(Integer states) {
		this.states = states;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		if(room!=null && user != null)
			return "Record [orderId=" + orderId + ", price=" + price + ", arrivalTime="
			+ arrivalTime +", departureTime=" + departureTime + ", realTime="
			+ realTime + ", states=" + states + ", roomID=" + room.getId() + ", user="
			+ user.getId() + "]";
		else
			return "Record [orderId=" + orderId + ", price=" + price + ", arrivalTime="
					+ arrivalTime +", departureTime=" + departureTime + ", realTime="
					+ realTime + ", states=" + states;
	}
	
}
