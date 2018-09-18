package cn.iankeri.hotel.dao;

import java.util.List;

import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

public interface RoomDao {
	
	//BEGIN==========��ҳ�����з���
	public Page<Room> getRoomPage(CriteriaRoom cr);
	
	public long getTotalRoomNumber(CriteriaRoom cr);
	
	public List<Room> getRoomPageList(CriteriaRoom cr,Integer pageSize);
	
	//END==========��ҳ
	
	//������һ�����õķ�����
	public Integer getNextValidRoomId();
	
	//�������޸ķ�����Ϣ
	public void saveOrUpdate(Room room);
	
	//��ȡ���еķ�������
	public List<RoomType> getRoomTypes();
	
	//BEGIN==========��ҳ����ȡ�ض������µ����з���
	public Page<Room> getRTRoomPage(Integer typeId, Integer pageNo);
	
	public long getTotalRTRoomNumber(Integer typeId, Integer pageNo);
	
	public List<Room> getRTRoomPageList(Integer typeId, Integer pageNo, Integer pageSize);
	//END==========��ҳ
	
	//����id��ȡָ���������Ϣ
	public Room getRoom(Integer id);
}
