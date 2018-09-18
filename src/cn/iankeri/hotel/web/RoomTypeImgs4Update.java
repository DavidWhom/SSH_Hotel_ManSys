package cn.iankeri.hotel.web;

import java.io.File;

public class RoomTypeImgs4Update {
	
	public Boolean[] isUpdate = new Boolean[]{false,false,false,false,false};
	public Boolean isNeededUploadImg = false;
	
	private File roomTypeImage1;
	private String roomTypeImage1FileName;
	private String roomTypeImage1ContentType;
	
	private File roomTypeImage2;
	private String roomTypeImage2FileName;
	private String roomTypeImage2ContentType;
	
	private File roomTypeImage3;
	private String roomTypeImage3FileName;
	private String roomTypeImage3ContentType;
	
	private File roomTypeImage4;
	private String roomTypeImage4FileName;
	private String roomTypeImage4ContentType;
	
	private File roomTypeImage5;
	private String roomTypeImage5FileName;
	private String roomTypeImage5ContentType;
	public File getRoomTypeImage1() {
		return roomTypeImage1;
	}
	public void setRoomTypeImage1(File roomTypeImage1) {
		isNeededUploadImg = true;
		isUpdate[0] = true;
		this.roomTypeImage1 = roomTypeImage1;
	}
	public String getRoomTypeImage1FileName() {
		return roomTypeImage1FileName;
	}
	public void setRoomTypeImage1FileName(String roomTypeImage1FileName) {
		this.roomTypeImage1FileName = roomTypeImage1FileName;
	}
	public String getRoomTypeImage1ContentType() {
		return roomTypeImage1ContentType;
	}
	public void setRoomTypeImage1ContentType(String roomTypeImage1ContentType) {
		this.roomTypeImage1ContentType = roomTypeImage1ContentType;
	}
	public File getRoomTypeImage2() {
		return roomTypeImage2;
	}
	public void setRoomTypeImage2(File roomTypeImage2) {
		isNeededUploadImg = true;
		isUpdate[1] = true;
		this.roomTypeImage2 = roomTypeImage2;
	}
	public String getRoomTypeImage2FileName() {
		return roomTypeImage2FileName;
	}
	public void setRoomTypeImage2FileName(String roomTypeImage2FileName) {
		this.roomTypeImage2FileName = roomTypeImage2FileName;
	}
	public String getRoomTypeImage2ContentType() {
		return roomTypeImage2ContentType;
	}
	public void setRoomTypeImage2ContentType(String roomTypeImage2ContentType) {
		this.roomTypeImage2ContentType = roomTypeImage2ContentType;
	}
	public File getRoomTypeImage3() {
		return roomTypeImage3;
	}
	public void setRoomTypeImage3(File roomTypeImage3) {
		isNeededUploadImg = true;
		isUpdate[2] = true;
		this.roomTypeImage3 = roomTypeImage3;
	}
	public String getRoomTypeImage3FileName() {
		return roomTypeImage3FileName;
	}
	public void setRoomTypeImage3FileName(String roomTypeImage3FileName) {
		this.roomTypeImage3FileName = roomTypeImage3FileName;
	}
	public String getRoomTypeImage3ContentType() {
		return roomTypeImage3ContentType;
	}
	public void setRoomTypeImage3ContentType(String roomTypeImage3ContentType) {
		this.roomTypeImage3ContentType = roomTypeImage3ContentType;
	}
	public File getRoomTypeImage4() {
		return roomTypeImage4;
	}
	public void setRoomTypeImage4(File roomTypeImage4) {
		isNeededUploadImg = true;
		isUpdate[3] = true;
		this.roomTypeImage4 = roomTypeImage4;
	}
	public String getRoomTypeImage4FileName() {
		return roomTypeImage4FileName;
	}
	public void setRoomTypeImage4FileName(String roomTypeImage4FileName) {
		this.roomTypeImage4FileName = roomTypeImage4FileName;
	}
	public String getRoomTypeImage4ContentType() {
		return roomTypeImage4ContentType;
	}
	public void setRoomTypeImage4ContentType(String roomTypeImage4ContentType) {
		this.roomTypeImage4ContentType = roomTypeImage4ContentType;
	}
	public File getRoomTypeImage5() {
		return roomTypeImage5;
	}
	public void setRoomTypeImage5(File roomTypeImage5) {
		isNeededUploadImg = true;
		isUpdate[4] = true;
		this.roomTypeImage5 = roomTypeImage5;
	}
	public String getRoomTypeImage5FileName() {
		return roomTypeImage5FileName;
	}
	public void setRoomTypeImage5FileName(String roomTypeImage5FileName) {
		this.roomTypeImage5FileName = roomTypeImage5FileName;
	}
	public String getRoomTypeImage5ContentType() {
		return roomTypeImage5ContentType;
	}
	public void setRoomTypeImage5ContentType(String roomTypeImage5ContentType) {
		this.roomTypeImage5ContentType = roomTypeImage5ContentType;
	}
}
