package cn.iankeri.hotel.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.iankeri.hotel.dao.BaseDao;
import cn.iankeri.hotel.dao.RoomTypeDao;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.utils.CriteriaBeanUtils;
import cn.iankeri.hotel.web.CriteriaRoomType;
import cn.iankeri.hotel.web.Page;

@Repository("roomTypeDao")
public class RoomTypeDaoImpl extends BaseDao implements RoomTypeDao {

	@Override
	public RoomType getRoomType(Integer id) {
		String hql = "FROM RoomType rt WHERE rt.id = ?";
		return (RoomType) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}

	@Override
	public Page<RoomType> getRoomTypePage(CriteriaRoomType crt) {
		Page<RoomType> page = new Page<>(crt.getPageNo());
		page.setTotalItemNumber((int) getTotalRoomTypeNumber(crt));
		crt.setPageNo(page.getPageNo());
		page.setList(getRoomTypePageList(crt, 10));
		return page;
	}

	@Override
	public long getTotalRoomTypeNumber(CriteriaRoomType crt) {
		String hql = "SELECT COUNT(*) FROM RoomType rt WHERE " + 
				CriteriaBeanUtils.getRoomTypeFilter(crt).toString();
		return (Long)getSession().createQuery(hql).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RoomType> getRoomTypePageList(CriteriaRoomType crt, Integer pageSize) {
		String hql = "FROM RoomType rt WHERE " + CriteriaBeanUtils.getRoomTypeFilter(crt)
				.toString() + " ORDER BY rt.times DESC";
		Query query = getSession().createQuery(hql);
		query.setMaxResults(pageSize);
		query.setFirstResult((crt.getPageNo() - 1) * pageSize);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPeoples() {
		String hql = "SELECT DISTINCT(peoples) FROM RoomType rt";
		return getSession().createQuery(hql).list();
	}

	@Override
	public void saveOrUpdate(RoomType roomType) {
		getSession().saveOrUpdate(roomType);
	}

	@Override
	public Map<Integer, Long> getRoomLeaves() {
		String hql1 = "SELECT id FROM RoomType";
		Map<Integer, Long> roomLeaves = new HashMap<>();
		@SuppressWarnings("unchecked")
		List<Integer> roomTypeId = getSession().createQuery(hql1).list();
		for(int i = 0; i < roomTypeId.size(); i++) {
			String hql2 = "SELECT COUNT(*) FROM Room r WHERE r.roomType.id = ? AND r.states = 0";
			roomLeaves.put(roomTypeId.get(i),
					(Long)getSession().createQuery(hql2).setInteger(0, roomTypeId.get(i)).uniqueResult());
		}
		return roomLeaves;
	}
	
	@Override
	public Map<Integer, Long> getRoomAll() {
		String hql1 = "SELECT id FROM RoomType";
		Map<Integer, Long> roomAll = new HashMap<>();
		@SuppressWarnings("unchecked")
		List<Integer> roomTypeId = getSession().createQuery(hql1).list();
		for(int i = 0; i < roomTypeId.size(); i++) {
			String hql2 = "SELECT COUNT(*) FROM Room r WHERE r.roomType.id = ?";
			roomAll.put(roomTypeId.get(i),
					(Long)getSession().createQuery(hql2).setInteger(0, roomTypeId.get(i)).uniqueResult());
		}
		return roomAll;
	}
	

	@Override
	public Integer getNextValidRTId() {
		String hql = "SELECT MAX(id) FROM RoomType";
		return (Integer)getSession().createQuery(hql).uniqueResult() + 1;
	}



}
