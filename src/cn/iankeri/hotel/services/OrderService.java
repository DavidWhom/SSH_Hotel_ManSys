package cn.iankeri.hotel.services;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import cn.iankeri.hotel.dao.OrderDao;
import cn.iankeri.hotel.dao.RoomDao;
import cn.iankeri.hotel.dao.UserDao;
import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.utils.DateUtils;
import cn.iankeri.hotel.utils.JsonUtils;
import cn.iankeri.hotel.utils.MoneyUtils;
import cn.iankeri.hotel.web.CriteriaOrder;
import cn.iankeri.hotel.web.Page;

@Service
public class OrderService {
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoomDao roomDao;
	
	public void bookNow(Record model) {
		//初始化状态
		model.setStates(0);
		model.setArrivalTime(new Date());
		
		//改变指定房间的状态
		orderDao.changeRoomState(model.getRoom().getId());
		
		//开始订购
		orderDao.bookNow(model);
	}
	
	public void checkOut(Record model) {
		//初始化
		model.setStates(1);
		model.setRealTime(new Date());
		
		//改变该房间的状态
		orderDao.changeRoomState(model.getRoom().getId());
		
		//退房
		orderDao.checkOut(model);
	}
	
	public Record getRecord4BackShow(Integer id) {
		return orderDao.getRecord4BackShow(id);
	}
	
	public void renew(Record model) {
		orderDao.renew(model);
	}
	
	public BigDecimal getTotalPrice(Record model) {
		return MoneyUtils.getTotalPrice(model);
	}
	
	public Map<Integer, BigDecimal> getEveryOrdersConsume(){
		return orderDao.getEveryOrdersConsume();
	}
	
	public Map<Integer, BigDecimal> getRoomOrderConsume(Integer roomId){
		return orderDao.getRoomOrderConsume(roomId);
	}
	
	public Record getUserRecording(Integer userId) {
		return orderDao.getUserRecording(userId);
	}
	
	public Record getPreBookRecord(Integer id) {
		return orderDao.getPreBookRecord(id);
	}
	
	public void checkIn(Record model) {
		//初始化
		model.setStates(1);
//		model.setRegisterTime(new Date());
		//改变指定房间的状态
		orderDao.changeRoomState(model.getRoom().getId());
		//登记
		orderDao.checkIn(model);
	}
	
	public Page<Record> getRoomOrderPage(CriteriaOrder co){
		return orderDao.getRoomOrderPage(co);
	}
	
	//退房前需要获取用户信息 & 该用户开房的信息 ——构造json数组---登记前也需要获取这一信息
	public String getCheckOutJson(Integer userId, Integer roomId) {
		String returnData = "";
		//用户的json
		Map<String, String> map = new HashMap<>();
		User user = userDao.getUser(userId);
		map = JsonUtils.getUserJsonMap(map, user, userDao.isUserRoomed(userId));
		
		//房间的 json
		Room room = roomDao.getRoom(roomId);
		Record record = orderDao.getRecord4BackShow(userId);
		System.out.println("recordOnCheckOutJson:" + record);
		map = JsonUtils.getRoomJsonMap(map, room, record);
		
		//构造 json 数组
		Gson gson = new Gson();
		returnData = gson.toJson(map).toString();
		
		return returnData;
	}
	
	public String getRedisterJson(Integer userId, Integer roomId,Record record) {
		String returnData = "";
		//用户的json
		Map<String, String> map = new HashMap<>();
		User user = userDao.getUser(userId);
		map = JsonUtils.getUserJsonMap(map, user, userDao.isUserRoomed(userId));
		
		//房间的 json
		Room room = roomDao.getRoom(roomId);
		map = JsonUtils.getRoomJsonMap(map, room, record);
		
		//构造 json 数组
		Gson gson = new Gson();
		returnData = gson.toJson(map).toString();
		
		return returnData;
	}
}
