package cn.iankeri.hotel.dao;

import java.util.List;

import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.web.CriteriaUser;
import cn.iankeri.hotel.web.Page;

public interface UserDao {
	public User getUser(Integer id);
	
	public void saveOrUpdate(User user);
	
	public void changePwd(Integer userId,String newPwd);
	
	public Integer getNextValidUserNum();
	
	public void changeState(Integer id);
	
	public Page<User> getUserPage(CriteriaUser cu);
	
	public long getTotalUserNumber(CriteriaUser cu);
	
	public List<User> getUserPageList(CriteriaUser cu, int pageSize);
	
	public Boolean isUserRoomed(Integer id);
}
