package cn.iankeri.hotel.dao;

import java.util.List;

import cn.iankeri.hotel.entities.Admin;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.web.CriteriaAdmin;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

public interface AdminDao {
	//BEGIN======��ҳ����ȡ���й���Ա��Ϣ
	public Page<Admin> getAdminPage(CriteriaAdmin ca);
	
	public long getTotalAdminNumber(CriteriaAdmin ca);
	
	public List<Admin> getAdminPageList(CriteriaAdmin ca,Integer pageSize);
	//END======��ҳ����ȡ���й���Ա��Ϣ
	
	public void saveOrUpdate(Admin admin);
	
	public Admin getAdmin(Integer id);
	
	public void changeState(Integer id);
}
