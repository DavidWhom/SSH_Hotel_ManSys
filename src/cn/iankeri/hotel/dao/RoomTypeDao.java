package cn.iankeri.hotel.dao;

import java.util.List;
import java.util.Map;

import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.web.CriteriaRoomType;
import cn.iankeri.hotel.web.Page;

public interface RoomTypeDao {
	public RoomType getRoomType(Integer id);
	
	public Page<RoomType> getRoomTypePage(CriteriaRoomType crt);
	
	public long getTotalRoomTypeNumber(CriteriaRoomType crt);
	
	public List<RoomType> getRoomTypePageList(CriteriaRoomType crt,Integer pageSize);
	
	public List<String> getPeoples();
	
	public void saveOrUpdate(RoomType roomType);
	
	public Map<Integer, Long> getRoomLeaves();
	
	public Integer getNextValidRTId();
	
	public Map<Integer, Long> getRoomAll();
}
