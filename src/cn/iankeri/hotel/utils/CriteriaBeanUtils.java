package cn.iankeri.hotel.utils;

import java.text.SimpleDateFormat;

import cn.iankeri.hotel.web.CriteriaAdmin;
import cn.iankeri.hotel.web.CriteriaOrder;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.CriteriaRoomType;
import cn.iankeri.hotel.web.CriteriaUser;

public class CriteriaBeanUtils {
	public static StringBuffer getUserFilter(CriteriaUser cu) {
		StringBuffer filter = new StringBuffer("");
		int i = 0;
		if(cu != null) {
			if(cu.getUser().getName() != null)
				if(!cu.getUser().getName().trim().equals("")) {
					filter.append(" u.name LIKE '%"+cu.getUser().getName().trim()+"%'");
					i++;
				}
			if(cu.getUser().getId() != null)
				if(cu.getUser().getId() != null) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" u.id LIKE '%"+cu.getUser().getId().toString().trim()+"%'");
					i++;
				}
		}
		if(i == 0)
			filter.append(" 1 = 1");
		return filter;
	}
	
	public static StringBuffer getRoomFilter(CriteriaRoom cr) {
		StringBuffer filter = new StringBuffer("");
		int i = 0;
		if(cr != null) {
			if(cr.getRoom().getId() != null) {
				if(!cr.getRoom().getId().toString().trim().equals("")) {
					filter.append(" r.id LIKE '%" + cr.getRoom().getId().toString().trim() + "%'");
					i++;
				}
			}
			if(cr.getRoom().getRoomName() != null) {
				if(!cr.getRoom().getRoomName().trim().equals("")) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" r.roomName LIKE '%" + cr.getRoom().getRoomName().toString().trim() + "%'");
					i++;
				}
			}
			if(cr.getRoom().getStates() != null) {
				if(!cr.getRoom().getStates().toString().trim().equals("")) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" r.states LIKE '%" + cr.getRoom().getStates().toString().trim() + "%'");
					i++;
				}
			}
		}
		if(i == 0)
			filter.append(" 1 = 1");
		return filter;
	}
	
	public static StringBuffer getRoomTypeFilter(CriteriaRoomType crt) {
		StringBuffer filter = new StringBuffer("");
		int i = 0;
		if(crt != null) {
			if(crt.getRoomType().getId() != null) {
				if(!crt.getRoomType().getId().toString().trim().equals("")) {
					filter.append(" rt.id LIKE '%" + crt.getRoomType().getId().toString().trim() + "%'");
					i++;
				}
			}
			
			if(crt.getRoomType().getPeoples() != null) {
				if(!crt.getRoomType().getPeoples().trim().equals("")) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" rt.peoples LIKE '%" + crt.getRoomType().getPeoples().trim() + "%'");
					i++;
				}
			}
		}
			
		if(i == 0)
			filter.append(" 1 = 1");
		return filter;
	}
	
	public static StringBuffer getRoomOrderFilter(CriteriaOrder co) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer filter = new StringBuffer("");
		int i = 0;
		if(co != null) {
			if(co.getRecord().getOrderId() != null) {
				if(!co.getRecord().getOrderId().toString().trim().equals("")) {
					filter.append(" r.orderId LIKE '%" + co.getRecord().getOrderId().toString().trim() + "%'");
					i++;
				}
			}
			if(co.getRecord().getRoom() != null)
				if(co.getRecord().getRoom().getId() != null) {
					if(!co.getRecord().getRoom().getId().toString().trim().equals("")) {
						if(i!=0)
							filter.append(" AND");
						filter.append(" r.room.id LIKE '%" + co.getRecord().getRoom().getId().toString().trim() + "%'");
						i++;
					}
				}
			if(co.getRecord().getUser() != null)
			if(co.getRecord().getUser().getId() != null) {
				if(!co.getRecord().getUser().getId().toString().trim().equals("")) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" r.user.id LIKE '%" + co.getRecord().getUser().getId().toString().trim() + "%'");
					i++;
				}
			}
			
			if(co.getRecord().getArrivalTime() != null) {
				if(!sdf.format(co.getRecord().getArrivalTime()).equals("")) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" r.arrivalTime LIKE '%" + sdf.format(co.getRecord().getArrivalTime()).toString().trim() + "%'");
					i++;
				}
			}
			
			if(co.getIsOverdue() != null) {
				if(co.getIsOverdue())
					if(i!=0)
						filter.append(" AND");
					filter.append(" now() - r.departureTime > 0 AND r.states = 0");
					i++;
			}
		}
			
		if(i == 0)
			filter.append(" 1 = 1");
		return filter;
	}
	
	public static StringBuffer getAdminFilter(CriteriaAdmin ca) {
		StringBuffer filter = new StringBuffer("");
		int i = 0;
		if(ca != null) {
			if(ca.getAdmin().getId() != null) {
				if(!ca.getAdmin().getId().toString().trim().equals("")) {
					filter.append(" a.id LIKE '%" + ca.getAdmin().getId().toString().trim() + "%'");
					i++;
				}
			}
			
			if(ca.getAdmin().getName() != null) {
				if(!ca.getAdmin().getName().trim().equals("")) {
					if(i!=0)
						filter.append(" AND");
					filter.append(" a.name LIKE '%" + ca.getAdmin().getName().trim() + "%'");
					i++;
				}
			}
			
			if(ca.getAdmin().getUsable() != null) {
				if(i!=0)
					filter.append(" AND");
				filter.append(" a.usable LIKE '%" + ca.getAdmin().getUsable().toString() + "%'");
				i++;
			}
		}
			
		if(i == 0)
			filter.append(" 1 = 1");
		return filter;
	}
}
