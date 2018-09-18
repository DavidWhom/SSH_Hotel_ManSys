package cn.iankeri.hotel.dao.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.iankeri.hotel.dao.BaseDao;
import cn.iankeri.hotel.dao.OrderDao;
import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.utils.CriteriaBeanUtils;
import cn.iankeri.hotel.utils.MoneyUtils;
import cn.iankeri.hotel.web.CriteriaOrder;
import cn.iankeri.hotel.web.Page;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDao implements OrderDao{

	@Override
	public void bookNow(Record record) {
		getSession().saveOrUpdate(record);
	}

	@Override
	public Record getRecord4BackShow(Integer id) {
		String hql = "FROM Record r WHERE r.user.id = ? AND r.states = 0";
		return (Record) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}

	@Override
	public void changeRoomState(Integer roomId) {
		String hql = "UPDATE Room r SET r.states = 1 - r.states WHERE id = ?";
		getSession().createQuery(hql).setInteger(0, roomId).executeUpdate();
	}

	@Override
	public void checkOut(Record record) {
		getSession().saveOrUpdate(record);
	}

	@Override
	public Record getUserRecording(Integer id) {
		String hql = "FROM Record r LEFT OUTER JOIN FETCH r.room LEFT OUTER JOIN FETCH r.user WHERE r.user.id = ? AND r.states = 0";
		return (Record) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}

	@Override
	public Record getPreBookRecord(Integer userId) {
		String hql = "FROM Record r WHERE r.user.id = ? AND r.states = 0";
		return (Record) getSession().createQuery(hql).setInteger(0, userId).uniqueResult();
	}

	@Override
	public void checkIn(Record record) {
		getSession().saveOrUpdate(record);
	}

	@Override
	public Page<Record> getUserOrderPage(Integer id, Integer pageNo) {
		Page<Record> page = new Page<>(pageNo);
		page.setTotalItemNumber((int) getTotalUserOrderNumber(id));
		System.out.println("id:" + id);
		System.out.println("list:" + getUserOrderPageList(id, 10, pageNo));
		page.setList(getUserOrderPageList(id, 10, pageNo));
		return page;
	}

	@Override
	public long getTotalUserOrderNumber(Integer id) {
		String hql = "SELECT COUNT(*) FROM Record r WHERE r.user.id = ?";
		return (long)getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Record> getUserOrderPageList(Integer id, Integer pageSize,Integer pageNo) {
		String hql = "FROM Record r LEFT OUTER JOIN FETCH r.room "
				+ "LEFT OUTER JOIN FETCH r.user WHERE r.user.id = ?"
				+ "ORDER BY r.states ASC";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		query.setMaxResults(pageSize);
		query.setFirstResult((pageNo-1) * pageSize);
		return query.list();
	}

	@Override
	public Page<Record> getRoomOrderPage(CriteriaOrder co) {
		Page<Record> page = new Page<>(co.getPageNo());
		page.setTotalItemNumber((int)getTotalRoomOrderNumber(co));
		page.setList(getRoomOrderPageList(co,10));
		return page;
	}

	@Override
	public long getTotalRoomOrderNumber(CriteriaOrder co) {
		String hql = "SELECT COUNT(*) FROM Record r WHERE " + CriteriaBeanUtils.getRoomOrderFilter(co)
					.toString();
		return (long) getSession().createQuery(hql).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Record> getRoomOrderPageList(CriteriaOrder co, Integer pageSize) {
		String hql = "FROM Record r LEFT OUTER JOIN FETCH r.room "
				+ "LEFT OUTER JOIN FETCH r.user LEFT OUTER JOIN FETCH r.room.roomType "
				+ "WHERE " + CriteriaBeanUtils.getRoomOrderFilter(co)
					.toString() + " ORDER BY  r.realTime,r.departureTime DESC";
		Query query = getSession().createQuery(hql);
		query.setMaxResults(pageSize);
		query.setFirstResult((co.getPageNo() - 1) * pageSize);
		return query.list();
	}

	@Override
	public void renew(Record record) {
		getSession().saveOrUpdate(record);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, BigDecimal> getEveryOrdersConsume() {
		Map<Integer, Record> map = new HashMap<>();
		String hql1 = "SELECT orderId FROM Record";
		List<Integer> orderIds = getSession().createQuery(hql1).list();
		for(int i = 0; i < orderIds.size(); i++) {
			String hql2 = "FROM Record WHERE orderId = ?";
			map.put(orderIds.get(i), 
					(Record)getSession().createQuery(hql2).setInteger(0, orderIds.get(i)).uniqueResult());
		}
		Map<Integer, BigDecimal> map_ = new HashMap<>();
		for(int i = 0; i < orderIds.size(); i++) {
			map_.put(orderIds.get(i), MoneyUtils.getTotalPrice(map.get(orderIds.get(i))));
		}
		return map_;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, BigDecimal> getUserOrdersConsume(Integer userId) {
		Map<Integer, Record> map = new HashMap<>();
		String hql1 = "SELECT orderId FROM Record r WHERE r.user.id = ?";
		List<Integer> orderIds = getSession().createQuery(hql1).setInteger(0, userId).list();
		for(int i = 0; i < orderIds.size(); i++) {
			String hql2 = "FROM Record r WHERE r.orderId = ? AND r.user.id = ?";
			map.put(orderIds.get(i), 
					(Record)getSession().createQuery(hql2).setInteger(0, orderIds.get(i))
					.setInteger(1, userId).uniqueResult());
		}
		Map<Integer, BigDecimal> map_ = new HashMap<>();
		for(int i = 0; i < orderIds.size(); i++) {
			map_.put(orderIds.get(i), MoneyUtils.getTotalPrice(map.get(orderIds.get(i))));
		}
		return map_;
	}

	@Override
	public Map<Integer, BigDecimal> getRoomOrderConsume(Integer roomId) {
		Map<Integer, Record> map = new HashMap<>();
		String hql1 = "SELECT orderId FROM Record r WHERE r.room.id = ?";
		List<Integer> orderIds = getSession().createQuery(hql1).setInteger(0, roomId).list();
		for(int i = 0; i < orderIds.size(); i++) {
			String hql2 = "FROM Record r WHERE r.orderId = ? AND r.room.id = ?";
			map.put(orderIds.get(i), 
					(Record)getSession().createQuery(hql2).setInteger(0, orderIds.get(i))
					.setInteger(1, roomId).uniqueResult());
		}
		Map<Integer, BigDecimal> map_ = new HashMap<>();
		for(int i = 0; i < orderIds.size(); i++) {
			map_.put(orderIds.get(i), MoneyUtils.getTotalPrice(map.get(orderIds.get(i))));
		}
		return map_;
	}
	
	
}
