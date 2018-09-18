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
		
		String servletPath = req.getServletPath();//不带contextPath 的叫 servletPath
//		System.out.println(servletPath);
		//静态资源放行
		if(servletPath.endsWith(".png")||servletPath.endsWith(".css")||servletPath.endsWith(".woff2")
				||servletPath.endsWith(".woff")||servletPath.endsWith(".ttf")||servletPath.endsWith(".js")
				||servletPath.endsWith(".jpg")||servletPath.endsWith(".jpeg")) {
			chain.doFilter(request, response);
			return;
		}
		//无须登录即可访问的页面
		List<String> urls = Arrays.asList(unCheckedUrls.split(","));
		if(urls.contains(servletPath)) {
			chain.doFilter(request, response);
			return;
		}
		
		//如果用户没有登录
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		if(admin == null) {//如果没用登录就重定向到登录页面
			resp.getWriter().write("<script type='text/JavaScript'>window.open('" + req.getContextPath()+redirectPage + "','_top'); </script>");
			return;
		}
		
		//确认是否为预览系统的测试账号,测试账号不能执行一切涉及到修改数据表的操作。
		if(req.getSession().getAttribute("isPreview") == null)
			if(admin.getId().toString().equals(previewAdmin))
				req.getSession().setAttribute("isPreview", false);
			else
				req.getSession().setAttribute("isPreview", true);
		
		//锁屏之后
		if(req.getSession().getAttribute("isLockScreen")!=null) {			
			Boolean isLock = (Boolean) req.getSession().getAttribute("isLockScreen");
			if(isLock) {
				resp.getWriter().write("<script type='text/JavaScript'>window.open('" + req.getContextPath() + "/lockscreen.jsp','_top'); </script>");
				return;
			}
		}
		//权限校验：普通管理员不具备【权限管理】的功能
		//1.获取当前用户的身份,校验其是否访问了非功能模块
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
