package cn.iankeri.hotel.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.iankeri.hotel.entities.Admin;
import cn.iankeri.hotel.services.AdminService;
import cn.iankeri.hotel.utils.ImageUtils;
import cn.iankeri.hotel.web.CriteriaAdmin;
import cn.iankeri.hotel.web.Page;

public class AdminAction extends ActionSupport implements ServletRequestAware,
ModelDriven<Admin>,Preparable{

	private Admin model;
	
	@Autowired
	private AdminService adminService;
	
	public void setModel(Admin model) {
		this.model = model;
	}
	
	private Integer id;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return id;
	}
	
	private Integer pageNo;
	
	public Integer getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getAdmins() {
//		System.out.println(model);
		if(pageNo == null)
			pageNo = 1;
		CriteriaAdmin ca = new CriteriaAdmin(model, pageNo);
		Page<Admin> page = adminService.getAdminPage(ca);
		request.setAttribute("adminPage", page);
		//System.out.println("getAdmins执行完了...");
		return "admins";
	}
	
	public void prepareGetAdmins() {
		model = new Admin();
	}
	
	/**
	 * 定义ajax需要用到的字符流
	 */
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	//修改管理员状态
	public String chageState() throws UnsupportedEncodingException {
		try {
			adminService.changeState(id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		}catch (Exception e) {
			e.printStackTrace();
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}
	
	public String editAdmin() {
		//System.out.println(model);
		return "editAdmin";
	}
	
	public void prepareEditAdmin() {
		//System.out.println("id:" + id);
		model = adminService.getAdmin(id);
	}
	
	//接收图片的所需参数
	private File styleImg;
	private String styleImgFileName;
	private String styleImgContentType;
	

	public void setStyleImg(File styleImg) {
		this.styleImg = styleImg;
	}
	public void setStyleImgFileName(String styleImgFileName) {
		this.styleImgFileName = styleImgFileName;
	}
	public void setStyleImgContentType(String styleImgContentType) {
		this.styleImgContentType = styleImgContentType;
	}

	public String save() {
		try {
			if(styleImg != null) {
				model.setImgPath(styleImgFileName);
				//上传新图片
				ImageUtils.uploadAdminImg(styleImg, styleImgFileName);
			}
			//保存信息至数据库
			adminService.saveOrUpdate(model);
			request.setAttribute("msg", "管理员" + model.getName() + " 信息修改成功！");
		} catch (IOException e) {
			request.setAttribute("msg", "管理员信息修改失败！");
			e.printStackTrace();
		}
		return "save";
	}
	
	public void prepareSave() {
		model = adminService.getAdmin(id);
	}
	
	public String getAdmin() {
		return "admin";
	}
	
	public String getPwdPage(){
		return "pwdPage";
	}
	
	private String code;
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String changePwd() {
		String checkCode = (String) request.getSession().getAttribute("codeValue");
		//System.out.println("code:"+code + "ccode:" + checkCode);
		if(!code.equalsIgnoreCase(checkCode)) {
			request.setAttribute("codeMsg", "验证码错误！");
			return "errorCheckCode";
		}
		//新密码
		String newPwd = request.getParameter("newPwd");
		model.setPassword(newPwd);
		//System.out.println(model);
		adminService.changePwd(model);
		((Admin)request.getSession().getAttribute("admin")).setPassword(model.getPassword());
		request.setAttribute("msg", "密码修改成功,新密码：" + model.getPassword());
		return "changePwd";
	}
	
	public void prepareChangePwd() {
		model = adminService.getAdmin(id);
	}
	
	
	private HttpServletRequest request;
	
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
