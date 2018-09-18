package cn.iankeri.hotel.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.iankeri.hotel.dao.BaseDao;
import cn.iankeri.hotel.dao.RoomDao;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.utils.CriteriaBeanUtils;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

@Repository("roomDao")
public class RoomDaoImpl extends BaseDao implements RoomDao{

	@Override
	public Page<Room> getRoomPage(CriteriaRoom cr) {
		Page<Room> page = new Page<>(cr.getPageNo());
		page.setTotalItemNumber((int)getTotalRoomNumber(cr));
		cr.setPageNo(page.getPageNo());
		page.setList(getRoomPageList(cr, 10));
		return page;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Room> getRoomPageList(CriteriaRoom cr, Integer pageSize) {
		String hql = "FROM Room r LEFT OUTER JOIN FETCH r.roomType WHERE " + CriteriaBeanUtils.getRoomFilter(cr).toString()
					+ "ORDER BY r.roomType.price asc";
		Query query = getSession().createQuery(hql);
		query.setMaxResults(pageSize);
		query.setFirstResult((cr.getPageNo() - 1) * pageSize);
		return query.list();
	}
	@Override
	public long getTotalRoomNumber(CriteriaRoom cr) {
		String hql = "SELECT COUNT(*) FROM Room r WHERE " + CriteriaBeanUtils.getRoomFilter(cr)
		.toString();
		return (Long) getSession().createQuery(hql).uniqueResult();
	}


	@Override
	public Page<Room> getRTRoomPage(Integer typeId, Integer pageNo) {
		Page<Room> page = new Page<>(pageNo);
		page.setTotalItemNumber((int)getTotalRTRoomNumber(typeId, pageNo));
		pageNo = page.getPageNo();
		page.setList(getRTRoomPageList(typeId, pageNo, 10));
		return page;
	}

	@Override
	public long getTotalRTRoomNumber(Integer typeId, Integer pageNo) {
		String hql = "SELECT COUNT(*) FROM Room r WHERE r.roomType.id = ?";
		return (Long)getSession().createQuery(hql).setInteger(0, typeId).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Room> getRTRoomPageList(Integer typeId, Integer pageNo, Integer pageSize) {
		String hql = "FROM Room r LEFT OUTER JOIN FETCH r.roomType WHERE r.roomType.id = ? ORDER BY r.id ASC";
		Query query = getSession().createQuery(hql).setInteger(0, typeId);
		query.setMaxResults(pageSize);
		query.setFirstResult( (pageNo - 1) * pageSize );
		return query.list();
	}
	
	
	@Override
	public Integer getNextValidRoomId() {
		String hql = "SELECT MAX(id) FROM Room";
		return (Integer)getSession().createQuery(hql).uniqueResult() + 1;
	}

	@Override
	public void saveOrUpdate(Room room) {
		getSession().saveOrUpdate(room);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RoomType> getRoomTypes() {
		String hql = "FROM RoomType";
		return getSession().createQuery(hql).list();
	}

	@Override
	public Room getRoom(Integer id) {
		String hql = "FROM Room r LEFT OUTER JOIN FETCH r.roomType WHERE r.id = ?";
		return (Room) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}
}
