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
	//���꿪��
	public void bookNow(Record record);
	
	//�����ɹ���Ϊ�˻���
	public Record getRecord4BackShow(Integer id);
	
	//�ı���������״̬ �� room��ġ�states���ֶ�
	public void changeRoomState(Integer roomId);
	
	//��Ա�˷�
	public void checkOut(Record record);
	
	//��������
	public void renew(Record record);
	
	//��ȡ��Ա��ǰ���ڽ��еĶ���
	public Record getUserRecording(Integer id);
	
	//��ȡ��ǰԤ���Ķ���
	public Record getPreBookRecord(Integer userId);
	
	//�û�Ԥ������סʱ�Ǽ�
	public void checkIn(Record record);
	//����ÿ��������������
	public Map<Integer, BigDecimal> getEveryOrdersConsume();
	
	//����ָ���û�������״��
	public Map<Integer, BigDecimal> getUserOrdersConsume(Integer userId);
	
	//����ָ��������������
	public Map<Integer, BigDecimal> getRoomOrderConsume(Integer roomId);
	
	//BEGIN==========��ҳ��ָ���û��Ķ���ͳ��
	public Page<Record> getUserOrderPage(Integer id,Integer pageNo);
	
	public long getTotalUserOrderNumber(Integer id);
	
	public List<Record> getUserOrderPageList(Integer id,Integer pageSize,Integer pageNo);
	//END
	
	//BEGIN==========��ҳ��ָ������Ķ���ͳ��
	public Page<Record> getRoomOrderPage(CriteriaOrder co);
	
	public long getTotalRoomOrderNumber(CriteriaOrder co);
	
	public List<Record> getRoomOrderPageList(CriteriaOrder co, Integer pageSize);
	//END
	
}
