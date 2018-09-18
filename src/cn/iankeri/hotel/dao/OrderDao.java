package cn.iankeri.hotel.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.web.CriteriaOrder;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

public interface OrderDao {
	//到店开房
	public void bookNow(Record record);
	
	//订购成功后为了回显
	public Record getRecord4BackShow(Integer id);
	
	//改变各个房间的状态 即 room表的【states】字段
	public void changeRoomState(Integer roomId);
	
	//会员退房
	public void checkOut(Record record);
	
	//房间续订
	public void renew(Record record);
	
	//获取会员当前正在进行的订单
	public Record getUserRecording(Integer id);
	
	//获取提前预定的订单
	public Record getPreBookRecord(Integer userId);
	
	//用户预定后入住时登记
	public void checkIn(Record record);
	//计算每个订单的总消费
	public Map<Integer, BigDecimal> getEveryOrdersConsume();
	
	//计算指定用户的消费状况
	public Map<Integer, BigDecimal> getUserOrdersConsume(Integer userId);
	
	//计算指定房间的消费情况
	public Map<Integer, BigDecimal> getRoomOrderConsume(Integer roomId);
	
	//BEGIN==========分页：指定用户的订单统计
	public Page<Record> getUserOrderPage(Integer id,Integer pageNo);
	
	public long getTotalUserOrderNumber(Integer id);
	
	public List<Record> getUserOrderPageList(Integer id,Integer pageSize,Integer pageNo);
	//END
	
	//BEGIN==========分页：指定房间的订单统计
	public Page<Record> getRoomOrderPage(CriteriaOrder co);
	
	public long getTotalRoomOrderNumber(CriteriaOrder co);
	
	public List<Record> getRoomOrderPageList(CriteriaOrder co, Integer pageSize);
	//END
	
}
