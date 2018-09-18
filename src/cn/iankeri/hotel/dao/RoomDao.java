package cn.iankeri.hotel.dao;

import java.util.List;

import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

public interface RoomDao {
	
	//BEGIN==========分页：所有房间
	public Page<Room> getRoomPage(CriteriaRoom cr);
	
	public long getTotalRoomNumber(CriteriaRoom cr);
	
	public List<Room> getRoomPageList(CriteriaRoom cr,Integer pageSize);
	
	//END==========分页
	
	//返回下一个可用的房间编号
	public Integer getNextValidRoomId();
	
	//新增或修改房间信息
	public void saveOrUpdate(Room room);
	
	//获取所有的房间类型
	public List<RoomType> getRoomTypes();
	
	//BEGIN==========分页：获取特定类型下的所有房间
	public Page<Room> getRTRoomPage(Integer typeId, Integer pageNo);
	
	public long getTotalRTRoomNumber(Integer typeId, Integer pageNo);
	
	public List<Room> getRTRoomPageList(Integer typeId, Integer pageNo, Integer pageSize);
	//END==========分页
	
	//根据id获取指定房间的信息
	public Room getRoom(Integer id);
}
