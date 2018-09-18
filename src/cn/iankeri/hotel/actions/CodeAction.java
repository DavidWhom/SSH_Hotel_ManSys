package cn.iankeri.hotel.actions;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import cn.iankeri.hotel.utils.ValidateCodeUtil;

public class CodeAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;
	
	public String getCodeImage() throws Exception {
		HttpSession session = request.getSession();//获取session
        HttpServletResponse response = ServletActionContext.getResponse();//获取response

        BufferedImage bimage = ValidateCodeUtil.getCodeImage(session);//调用工具类获取验证图片
        ServletOutputStream out = response.getOutputStream();//获取输出流
        ImageIO.write(bimage, "jpeg", out);//将图片写到输出流
        out.flush();//刷新流
        out.close();//关闭流
		return null;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
