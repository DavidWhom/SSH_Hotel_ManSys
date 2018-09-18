package cn.iankeri.hotel.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.iankeri.hotel.dao.AdminDao;
import cn.iankeri.hotel.entities.Admin;
import cn.iankeri.hotel.web.CriteriaAdmin;
import cn.iankeri.hotel.web.Page;

@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;

	public void saveOrUpdate(Admin model) {
		adminDao.saveOrUpdate(model);
	}
	
	public Page<Admin> getAdminPage(CriteriaAdmin ca){
		return adminDao.getAdminPage(ca);
	}
	
	public Admin getAdmin(Integer id) {
		return adminDao.getAdmin(id);
	}
	
	public void changeState(Integer id) {
		adminDao.changeState(id);
	}
	
	public void changePwd(Admin model) {
		adminDao.saveOrUpdate(model);
	}
}
