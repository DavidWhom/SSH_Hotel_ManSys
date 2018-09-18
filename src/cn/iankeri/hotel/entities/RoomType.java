package cn.iankeri.hotel.entities;

import java.math.BigDecimal;

public class RoomType {
	private Integer id;
	private String roomTypeName;
	private String peoples;
	private BigDecimal price;
	private String net_info;
	private String bef_info;
	private Boolean park_info;
	private String other_info;
	private String roomImg;
	private Integer times;
	
	public String getBef_info() {
		return bef_info;
	}
	public void setBef_info(String bef_info) {
		this.bef_info = bef_info;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
	public String getPeoples() {
		return peoples;
	}
	public void setPeoples(String peoples) {
		this.peoples = peoples;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getNet_info() {
		return net_info;
	}
	public void setNet_info(String net_info) {
		this.net_info = net_info;
	}
	public Boolean getPark_info() {
		return park_info;
	}
	public void setPark_info(Boolean park_info) {
		this.park_info = park_info;
	}
	public String getOther_info() {
		return other_info;
	}
	public void setOther_info(String other_info) {
		this.other_info = other_info;
	}
	public String getRoomImg() {
		return roomImg;
	}
	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}
	public Integer getTimes() {
		return times;
	}
	public void setTimes(Integer times) {
		this.times = times;
	}
	@Override
	public String toString() {
		return "RoomType [id=" + id + ", roomTypeName=" + roomTypeName + ", peoples=" + peoples + ", price=" + price
				+ ", net_info=" + net_info + ", park_info=" + park_info + ", bef_info=" + bef_info + ", other_info="
				+ other_info + ", roomImg=" + roomImg + ", times=" + times + "]";
	}
	
	
}
