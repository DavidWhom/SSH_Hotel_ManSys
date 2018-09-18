package cn.iankeri.hotel.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.StrutsUploadedFile;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.services.UserService;
import cn.iankeri.hotel.utils.ImageUtils;
import cn.iankeri.hotel.web.CriteriaUser;
import cn.iankeri.hotel.web.Page;

public class UserAction extends ActionSupport implements ServletRequestAware,
	ModelDriven<User>,Preparable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService userService;
	
	private Integer id;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getUser() {
		Page<Record> userOrderPage = userService.getUserOrderPage(id, 1);
		//System.out.println(userOrderPage.getList());
		request.setAttribute("consumes", userService.getUserOrdersConsume(id));
		request.setAttribute("times", userService.getUserOrderTimes(id));
		request.setAttribute("totalMoney", userService.getUserTotalConsume(id));
		request.setAttribute("userOrderPage", userOrderPage);
		return "getUser";
	}
	
	public void prepareGetUser() {
		model = userService.getUser(id);
	}
	/**
	 * 定义ajax需要用到的字符流
	 */
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	/**
	 * AJAX 修改会员的账号状态
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String chageState() throws UnsupportedEncodingException {
		try {
			userService.changeState(id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		}catch (Exception e) {
			e.printStackTrace();
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}
	//值栈栈顶对象与 paramPrepareParam 拦截器结合使用
	private User model;
	
	public void setModel(User model) {
		this.model = model;
	}
	//接收页码
	private Integer pageNo;
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	/*
	 * 获取会员信息的分页
	 */
	public String getUsers() {
		if(pageNo == null)
			pageNo = 1;
		CriteriaUser cu = new CriteriaUser(model, pageNo);
		Page<User> page = userService.getUsers(cu);
		//Test
//		System.out.println(Arrays.asList(page.getList()));
		request.setAttribute("userPage", page);
		return "getUsers";
	}
	
	public void prepareGetUsers() {
		model = new User();
	}
	
	public String editUser() {
		return "edit";
	}
	
	public void prepareEditUser() {
		model = userService.getUser(id);
	}
	
	public String save() {
		try {			
			//System.out.println("model:" + model);
			if(styleImgFile != null)
				model.setStyleImg(styleImgFileFileName);
			if(headImgFile != null)
				model.setHeadImg(headImgFileFileName);
			//保存新用户信息至数据库
			userService.saveOrUpdate(model);
			//保存证件照
			if(headImgFile != null)
				ImageUtils.uploadHeadImgImg(headImgFile, headImgFileFileName);
			//保存个性头像
			if(styleImgFile != null)
				ImageUtils.uploadStyleImgImg(styleImgFile, styleImgFileFileName);
			request.setAttribute("msg", "用户 " + model.getName() + " 信息修改成功！");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "用户修改失败！");
		}
		return "save";
	}
	
	public void prepareSave() {
		if(id!=null)
			model = userService.getUser(id);
	}
	
	/**
	 * 添加用户信息，主要在于图片文件的上传
	 * @return
	 */
	//接收证件照
	private File headImgFile;
	private String headImgFileFileName;
	private String headImgFileContentType;
	
	public void setHeadImgFile(File headImgFile) {
		this.headImgFile = headImgFile;
	}
	
	public void setHeadImgFileFileName(String headImgFileFileName) {
		this.headImgFileFileName = headImgFileFileName;
	}
	
	public void setHeadImgFileContentType(String headImgFileContentType) {
		this.headImgFileContentType = headImgFileContentType;
	}
	//接收个性头像
	private File styleImgFile;
	private String styleImgFileFileName;
	private String styleImgFileContentType;
	
	public void setStyleImgFile(File styleImgFile) {
		this.styleImgFile = styleImgFile;
	}
	
	public void setStyleImgFileFileName(String styleImgFileFileName) {
		this.styleImgFileFileName = styleImgFileFileName;
	}
	
	public void setStyleImgFileContentType(String styleImgFileContentType) {
		this.styleImgFileContentType = styleImgFileContentType;
	}
	
	public String saveUser() {
		try {			
			model = userService.setDefaultStyleImg(model, styleImgFile,
							headImgFile, styleImgFileFileName, headImgFileFileName);
			//保存新用户信息至数据库
			//System.out.println("有无文件处理完" + model);
			//密码默认和账号一致
			model.setPassword(userService.getNextValidUserId().toString());
			//执行保存操作
			userService.saveOrUpdate(model);
			//保存证件照和个性头像
			ImageUtils.uploadUserImg(headImgFile, headImgFileFileName,
					styleImgFile, styleImgFileFileName);
			request.setAttribute("msg","新用户 " + model.getName() + " 添加成功！");
		} catch (Exception e) {
			request.setAttribute("msg", "用户添加失败！");
		}
		return "saveUser";
	}
	
	public void prepareSaveUser() {
		model = new User();
	}
	
	public String addUser() {
		return "add";
	}
	
	public void prepareAdd() {
		model = new User();
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public User getModel() {
		return model;
	}

	private HttpServletRequest request;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
