package cn.iankeri.hotel.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.iankeri.hotel.dao.TestAccountDao;
import cn.iankeri.hotel.entities.Admin;
import cn.iankeri.hotel.services.AdminService;
import cn.iankeri.hotel.services.TestAccountService;

public class LoginAction extends ActionSupport implements ServletRequestAware,
ModelDriven<Admin>,Preparable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private TestAccountService testAccountService;
	
	private Admin model;
	
	public void setModel(Admin model) {
		this.model = model;
	}
	
	private HttpServletRequest request;
	
	public String doLogin() {
		//System.out.println(model);
		if(model == null ||
				model.getId() == null || 
				model.getId().toString().trim().equals("")||
				model.getPassword() == null ||
				model.getPassword().trim().equals("")) {
			request.setAttribute("msg", "账号或密码不能为空！");
			return "noLogin";
		}
		Admin admin = adminService.getAdmin(model.getId());
		if(admin != null)
			if(admin.getPassword().equals(model.getPassword())) {
				
				if(admin.getUsable() == 0) {
					request.setAttribute("msg", "账号已被禁用！");
					return "noLogin";
				}
				
				//是否超级管理员
				String saNum = ServletActionContext.getServletContext().getInitParameter("superAdmin");
				
				//是否为预览账号,进行记录操作
				if(admin.getId().toString().equals(ServletActionContext.getServletContext()
						.getInitParameter("previewAdmin")))
					testAccountService.record(request);
				
				if(model.getId().toString().equals(saNum))
					request.getSession().setAttribute("identity", "sa");
				else
					request.getSession().setAttribute("identity", "plain");
				request.getSession().setAttribute("admin", admin);
				return "login";
			}
		request.setAttribute("msg", "账号或密码错误！");
		return "noLogin";
	}
	
	public void prepareDoLogin() {
		model = new Admin();
	}
	
	//退出
	public String doLogout() {
		request.getSession().invalidate();
		return "logout";
	}
	
	public String lockScreen() {
		request.getSession().setAttribute("isLockScreen", true);
		return "lockScreen";
	}
	
	public String freeScreen() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(!model.getPassword().trim().equals(admin.getPassword())) {
			request.setAttribute("msg", "密码错误！");
			return "noFreeScreen";
		}
		request.getSession().setAttribute("isLockScreen", false);
		return "freeScreen";
	}
	
	public void prepareFreeScreen() {
		model = new Admin();
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public Admin getModel() {
		return model;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
	
}
