package cn.iankeri.hotel.actions;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class ImgAction extends ActionSupport implements ServletRequestAware{
	private InputStream inputStream;
	private String imgPath;
	
	private HttpServletRequest request;
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	public String readImg() {
        try {
        	String imgRealPath = request.getSession().getServletContext().getRealPath(imgPath);
            inputStream = new FileInputStream(imgRealPath);
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        }
        return SUCCESS;  
    }
	
	public InputStream getInputStream() {  
        return inputStream;  
    }  
  
    public void setInputStream(InputStream inputStream) {  
        this.inputStream = inputStream;  
    }
}
