package cn.iankeri.hotel.filters;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.iankeri.hotel.entities.Admin;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD, 
				DispatcherType.INCLUDE, 
				DispatcherType.ERROR
		}
					, urlPatterns = { "/*" })
public class LoginFilter implements Filter {
	private String previewAdmin;
	private String isAllowPreview;
	private String superAdmin;
	private String redirectPage;
	private String unCheckedUrls;
	private String noPlainAuthroity;
	private String error_404;
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		String servletPath = req.getServletPath();//����contextPath �Ľ� servletPath
//		System.out.println(servletPath);
		//��̬��Դ����
		if(servletPath.endsWith(".png")||servletPath.endsWith(".css")||servletPath.endsWith(".woff2")
				||servletPath.endsWith(".woff")||servletPath.endsWith(".ttf")||servletPath.endsWith(".js")
				||servletPath.endsWith(".jpg")||servletPath.endsWith(".jpeg")) {
			chain.doFilter(request, response);
			return;
		}
		//�����¼���ɷ��ʵ�ҳ��
		List<String> urls = Arrays.asList(unCheckedUrls.split(","));
		if(urls.contains(servletPath)) {
			chain.doFilter(request, response);
			return;
		}
		
		//����û�û�е�¼
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		if(admin == null) {//���û�õ�¼���ض��򵽵�¼ҳ��
			resp.getWriter().write("<script type='text/JavaScript'>window.open('" + req.getContextPath()+redirectPage + "','_top'); </script>");
			return;
		}
		
		//ȷ���Ƿ�ΪԤ��ϵͳ�Ĳ����˺�,�����˺Ų���ִ��һ���漰���޸����ݱ�Ĳ�����
		if(req.getSession().getAttribute("isPreview") == null)
			if(admin.getId().toString().equals(previewAdmin))
				req.getSession().setAttribute("isPreview", false);
			else
				req.getSession().setAttribute("isPreview", true);
		
		//����֮��
		if(req.getSession().getAttribute("isLockScreen")!=null) {			
			Boolean isLock = (Boolean) req.getSession().getAttribute("isLockScreen");
			if(isLock) {
				resp.getWriter().write("<script type='text/JavaScript'>window.open('" + req.getContextPath() + "/lockscreen.jsp','_top'); </script>");
				return;
			}
		}
		//Ȩ��У�飺��ͨ����Ա���߱���Ȩ�޹����Ĺ���
		//1.��ȡ��ǰ�û������,У�����Ƿ�����˷ǹ���ģ��
		String identity = (String) req.getSession().getAttribute("identity");
		if(identity.equals("plain")) {
			List<String> noPlainAuthroityUrl = Arrays.asList(noPlainAuthroity.split(","));
			if(!noPlainAuthroityUrl.contains(servletPath)) {
				chain.doFilter(request, response);
				return;
			}
		}else {
			chain.doFilter(request, response);
			return;
		}
		
		resp.getWriter().write("<script type='text/JavaScript'>window.open('" + req.getContextPath()+error_404 + "','_top'); </script>");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		ServletContext servletContext = fConfig.getServletContext();
		previewAdmin = servletContext.getInitParameter("previewAdmin");
		isAllowPreview = servletContext.getInitParameter("isAllowPreview");
		superAdmin = servletContext.getInitParameter("superAdmin");
		redirectPage = servletContext.getInitParameter("redirectPage");
		unCheckedUrls = servletContext.getInitParameter("unCheckedUrls");
		noPlainAuthroity = servletContext.getInitParameter("noPlainAuthroity");
		error_404 = servletContext.getInitParameter("error-404");
	}

}
