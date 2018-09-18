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
		//��ʼ��״̬
		model.setStates(0);
		model.setArrivalTime(new Date());
		
		//�ı�ָ�������״̬
		orderDao.changeRoomState(model.getRoom().getId());
		
		//��ʼ����
		orderDao.bookNow(model);
	}
	
	public void checkOut(Record model) {
		//��ʼ��
		model.setStates(1);
		model.setRealTime(new Date());
		
		//�ı�÷����״̬
		orderDao.changeRoomState(model.getRoom().getId());
		
		//�˷�
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
		//��ʼ��
		model.setStates(1);
//		model.setRegisterTime(new Date());
		//�ı�ָ�������״̬
		orderDao.changeRoomState(model.getRoom().getId());
		//�Ǽ�
		orderDao.checkIn(model);
	}
	
	public Page<Record> getRoomOrderPage(CriteriaOrder co){
		return orderDao.getRoomOrderPage(co);
	}
	
	//�˷�ǰ��Ҫ��ȡ�û���Ϣ & ���û���������Ϣ ��������json����---�Ǽ�ǰҲ��Ҫ��ȡ��һ��Ϣ
	public String getCheckOutJson(Integer userId, Integer roomId) {
		String returnData = "";
		//�û���json
		Map<String, String> map = new HashMap<>();
		User user = userDao.getUser(userId);
		map = JsonUtils.getUserJsonMap(map, user, userDao.isUserRoomed(userId));
		
		//����� json
		Room room = roomDao.getRoom(roomId);
		Record record = orderDao.getRecord4BackShow(userId);
		System.out.println("recordOnCheckOutJson:" + record);
		map = JsonUtils.getRoomJsonMap(map, room, record);
		
		//���� json ����
		Gson gson = new Gson();
		returnData = gson.toJson(map).toString();
		
		return returnData;
	}
	
	public String getRedisterJson(Integer userId, Integer roomId,Record record) {
		String returnData = "";
		//�û���json
		Map<String, String> map = new HashMap<>();
		User user = userDao.getUser(userId);
		map = JsonUtils.getUserJsonMap(map, user, userDao.isUserRoomed(userId));
		
		//����� json
		Room room = roomDao.getRoom(roomId);
		map = JsonUtils.getRoomJsonMap(map, room, record);
		
		//���� json ����
		Gson gson = new Gson();
		returnData = gson.toJson(map).toString();
		
		return returnData;
	}
}
