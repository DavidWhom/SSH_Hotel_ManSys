package cn.iankeri.hotel.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.iankeri.hotel.dao.BaseDao;
import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.utils.CriteriaBeanUtils;
import cn.iankeri.hotel.web.CriteriaUser;
import cn.iankeri.hotel.web.Page;

@Repository("userDao")
public class UserDaoImpl extends BaseDao implements cn.iankeri.hotel.dao.UserDao {

	@Override
	public User getUser(Integer id) {
		String hql = "FROM User u WHERE u.id = ?";
		return (User)getSession().createQuery(hql).setInteger(0, id).uniqueResult();
	}

	@Override
	public Integer getNextValidUserNum() {
		String hql = "SELECT MAX(id) FROM User";
		return (Integer)getSession().createQuery(hql).uniqueResult() + 1;
	}

	@Override
	public void saveOrUpdate(User user) {
		getSession().saveOrUpdate(user);
	}

	@Override
	public void changePwd(Integer userId, String newPwd) {
		String hql = "UPDATE User u SET u.password = ? WHERE u.id = ?";
		getSession().createQuery(hql).setString(0, newPwd)
					.setInteger(1, userId)
					.executeUpdate();
	}

	@Override
	public void changeState(Integer id) {
		String hql = "UPDATE User SET usable = 1 - usable WHERE id = ?";
		getSession().createQuery(hql)
					.setInteger(0, id)
					.executeUpdate();
	}

	@Override
	public Page<User> getUserPage(CriteriaUser cu) {
		Page<User> page = new Page<>(cu.getPageNo());
		page.setTotalItemNumber((int) getTotalUserNumber(cu));
		//校验不合法的 pageNo
		cu.setPageNo(page.getPageNo());
		page.setList(getUserPageList(cu, 10));
		return page;
	}

	@Override
	public long getTotalUserNumber(CriteriaUser cu) {
		String hql = "SELECT COUNT(*) FROM User u WHERE " + CriteriaBeanUtils.getUserFilter(cu)
						.toString();
		return (Long)getSession().createQuery(hql).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserPageList(CriteriaUser cu, int pageSize) {
		String hql = "FROM User u WHERE" 
					  + CriteriaBeanUtils.getUserFilter(cu).toString();
		Query query = getSession().createQuery(hql);
		query.setMaxResults(pageSize);
		query.setFirstResult((cu.getPageNo() - 1) * pageSize);
		return query.list();
	}
	

	@Override
	public Boolean isUserRoomed(Integer id) {
		String hql = "SELECT COUNT(*) FROM Record r WHERE r.user.id = ? AND r.states = 0";
		long record= (long) getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		System.out.println("record:" + record);
		if(record > 0)
			return true;
		else
			return false;
	}
}
