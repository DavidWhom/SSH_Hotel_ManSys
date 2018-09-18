package cn.iankeri.hotel.utils;

import java.text.SimpleDateFormat;
import java.util.Map;

import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.User;

public class JsonUtils {
	public static Map<String, String> getUserJsonMap(Map<String, String> map, User user, Boolean isUserRoomed){
		map.put("id", user.getId().toString());
		map.put("name", user.getName());
		map.put("gender", user.getGender());
		map.put("telNum", user.getTelNum());
		map.put("email", user.getEmail());
		map.put("idCard", user.getIdCard());
		map.put("address", user.getAddress());
		map.put("password", user.getPassword());
		map.put("headImg", user.getHeadImg());
		if(user.getIsVip())
			map.put("isVip", "1");
		else
			map.put("isVip", "0");
		if(user.getUsable())
			map.put("usable", "1");
		else
			map.put("usable", "0");
		if(isUserRoomed)
			map.put("isRoomed", "0");
		else
			map.put("isRoomed", "-1");
		return map;
	}
	
	public static Map<String, String> getRoomJsonMap(Map<String, String> map, Room room, Record record){
		map.put("roomId", room.getId().toString());
		map.put("roomName", room.getRoomName());
		map.put("peoples", room.getRoomType().getPeoples());
		map.put("price", room.getRoomType().getPrice().toString());
		map.put("net_info", room.getRoomType().getNet_info());
		map.put("bef_info", room.getRoomType().getBef_info());
		map.put("other_info", room.getRoomType().getOther_info());
		if(room.getRoomType().getPark_info())
			map.put("park_info", "1");
		else
			map.put("park_info", "0");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		map.put("departureTime", sdf.format(record.getDepartureTime()));
		map.put("orderId", record.getOrderId().toString());
		map.put("states", record.getStates().toString());
//		map.put("registerTime", sdf.format(record.getRegisterTime()));
		return map;
	}
}
