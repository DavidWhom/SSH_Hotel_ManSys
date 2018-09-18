package cn.iankeri.hotel.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import cn.iankeri.hotel.dao.OrderDao;
import cn.iankeri.hotel.dao.RoomDao;
import cn.iankeri.hotel.dao.impl.RoomDaoImpl;
import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

@Service
public class RoomService {
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private OrderDao orderDao;
	
	public Page<Room> getRoomPage(CriteriaRoom cr){
		return roomDao.getRoomPage(cr);
	}
	
	public Integer getNextValidRoomId() {
		return roomDao.getNextValidRoomId();
	}
	
	public List<RoomType> getRoomTypes(){
		return roomDao.getRoomTypes();
	}
	
	public void saveOrUpdate(Room room) {
		roomDao.saveOrUpdate(room);
	}
	
	//获取指定类型的客房分页
	public Page<Room> getRTRoomPage(Integer typeId, Integer pageNo){
		return roomDao.getRTRoomPage(typeId, pageNo);
	}
	
	public Room getRoom(Integer id) {
		return roomDao.getRoom(id);
	}
	
	public String getRoomJson(Integer id,Integer roomId) {
		String returnData = "";
		Map<String, String> roomMap = new HashMap<>();
		Gson gson = new Gson();
		Room room = roomDao.getRoom(roomId);
		Record record = orderDao.getRecord4BackShow(id);
		System.out.println("record:" + record);
		roomMap.put("roomId", room.getId().toString());
		roomMap.put("roomName", room.getRoomName());
		roomMap.put("peoples", room.getRoomType().getPeoples());
		roomMap.put("price", room.getRoomType().getPrice().toString());
		roomMap.put("net_info", room.getRoomType().getNet_info());
		roomMap.put("bef_info", room.getRoomType().getBef_info());
		roomMap.put("other_info", room.getRoomType().getOther_info());
		if(room.getRoomType().getPark_info())
			roomMap.put("park_info", "1");
		else
			roomMap.put("park_info", "0");
		returnData = gson.toJson(roomMap).toString();	
		return returnData;
	}
}
