package cn.iankeri.hotel.services;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import cn.iankeri.hotel.dao.OrderDao;
import cn.iankeri.hotel.dao.UserDao;
import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.web.CriteriaUser;
import cn.iankeri.hotel.web.Page;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private OrderDao orderDao;
	public User getUser(Integer id) {
		return userDao.getUser(id);
	}
	
	public Page<User> getUsers(CriteriaUser cu){
		return userDao.getUserPage(cu);
	}
	
	public Page<Record> getUserOrderPage(Integer userId, Integer pageNo){
		return orderDao.getUserOrderPage(userId, pageNo);
	}
	
	public void changeState(Integer id) {
		userDao.changeState(id);
	}
	
	public void saveOrUpdate(User user) {
		userDao.saveOrUpdate(user);
	}
	
	public User setDefaultStyleImg(User model,File styleImgFile,File headImgFile,
			String styleImgFileFileName,String headImgFileFileName) {
		if(styleImgFile != null)
			model.setStyleImg(styleImgFileFileName);
		else
			model.setStyleImg(ServletActionContext.getServletContext().getInitParameter("defaultStyleImg"));
		
		if(headImgFile != null)
			model.setHeadImg(headImgFileFileName);
		else
			model.setHeadImg(ServletActionContext.getServletContext().getInitParameter("defaultHeadImg"));
		return model;
	}
	
	public Integer getNextValidUserId() {
		return userDao.getNextValidUserNum();
	}
	
	public Map<Integer, BigDecimal> getUserOrdersConsume(Integer userId) {
		return orderDao.getUserOrdersConsume(userId);
	}
	
	public Integer getUserOrderTimes(Integer userId) {
		Map<Integer, BigDecimal> consumeMap = getUserOrdersConsume(userId);
		return consumeMap.size();
	}
	
	public BigDecimal getUserTotalConsume(Integer userId) {
		BigDecimal totalMoney = new BigDecimal(0);
		Map<Integer, BigDecimal> consumeMap = getUserOrdersConsume(userId);
		for(Map.Entry<Integer, BigDecimal> entry : consumeMap.entrySet()) {
			totalMoney = totalMoney.add(entry.getValue());
		}
		System.out.println(totalMoney);
		return totalMoney;
	}
	
	public String getUserJson(Integer id) {
		String returnDate = "";
		Map<String, String> userMap = new HashMap<>();
		Gson gson = new Gson();
		User user = getUser(id);
		userMap.put("id", user.getId().toString());
		userMap.put("name", user.getName());
		userMap.put("gender", user.getGender());
		userMap.put("telNum", user.getTelNum());
		userMap.put("email", user.getEmail());
		userMap.put("idCard", user.getIdCard());
		userMap.put("address", user.getAddress());
		userMap.put("password", user.getPassword());
		userMap.put("headImg", user.getHeadImg());
		if(user.getIsVip())
			userMap.put("isVip", "1");
		else
			userMap.put("isVip", "0");
		if(user.getUsable())
			userMap.put("usable", "1");
		else
			userMap.put("usable", "0");
		if(userDao.isUserRoomed(id))
			userMap.put("isRoomed", "0");
		else
			userMap.put("isRoomed", "-1");
		returnDate = gson.toJson(userMap).toString();	
		return returnDate;
	}
}
