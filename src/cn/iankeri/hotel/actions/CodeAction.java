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
		HttpSession session = request.getSession();//��ȡsession
        HttpServletResponse response = ServletActionContext.getResponse();//��ȡresponse

        BufferedImage bimage = ValidateCodeUtil.getCodeImage(session);//���ù������ȡ��֤ͼƬ
        ServletOutputStream out = response.getOutputStream();//��ȡ�����
        ImageIO.write(bimage, "jpeg", out);//��ͼƬд�������
        out.flush();//ˢ����
        out.close();//�ر���
		return null;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
