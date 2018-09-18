package cn.iankeri.hotel.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.iankeri.hotel.dao.AdminDao;
import cn.iankeri.hotel.dao.BaseDao;
import cn.iankeri.hotel.entities.Admin;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.utils.CriteriaBeanUtils;
import cn.iankeri.hotel.web.CriteriaAdmin;
import cn.iankeri.hotel.web.Page;

@Repository("adminDao")
public class AdminDaoImpl extends BaseDao implements AdminDao {

	@Override
	public Page<Admin> getAdminPage(CriteriaAdmin ca) {
		Page<Admin> page = new Page<>(ca.getPageNo());
		page.setTotalItemNumber((int) getTotalAdminNumber(ca));
		ca.setPageNo(page.getPageNo());
		page.setList(getAdminPageList(ca, 10));
		return page;
	}

	@Override
	public long getTotalAdminNumber(CriteriaAdmin ca) {
		String hql = "SELECT COUNT(*) FROM Admin a WHERE " + CriteriaBeanUtils.getAdminFilter(ca)
					.toString();
		return (long)getSession().createQuery(hql).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getAdminPageList(CriteriaAdmin ca, Integer pageSize) {
		String hql = "FROM Admin a WHERE " + CriteriaBeanUtils.getAdminFilter(ca)
					.toString();
		Query query = getSession().createQuery(hql);
		query.setMaxResults(pageSize);
		query.setFirstResult((ca.getPageNo() - 1) * pageSize);
		return query.list();
	}

	@Override
	public void saveOrUpdate(Admin admin) {
		getSession().saveOrUpdate(admin);
	}

	@Override
	public Admin getAdmin(Integer id) {
		String hql = "FROM Admin a WHERE a.id = ?";
		return (Admin) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}

	@Override
	public void changeState(Integer id) {
		String hql = "UPDATE Admin SET usable = 1 - usable WHERE id = ?";
		getSession().createQuery(hql)
					.setInteger(0, id)
					.executeUpdate();
	}

}
