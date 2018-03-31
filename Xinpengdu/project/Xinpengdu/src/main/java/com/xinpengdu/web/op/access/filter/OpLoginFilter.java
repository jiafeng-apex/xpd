package com.xinpengdu.web.op.access.filter;


import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 过滤掉没有登录的用户
 * @author Administrator
 *
 */
public class OpLoginFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpSession session = request.getSession();
		boolean needRedirect = true;
		AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
		if(accessInfo != null && !Tool.isEmpty(accessInfo.getOperaterId())) {
			chain.doFilter(servletRequest, servletResponse);
			needRedirect = false;
		}
		
		//非授权用户重定向回首页
		if(needRedirect) {
			Cookie[] cookies = ((HttpServletRequest) servletRequest).getCookies();
			if(cookies != null) {
				for(Cookie cookie : cookies) {
					if("JSESSIONID".equals(cookie.getName())) {
						cookie.setMaxAge(0);
						cookie.setPath("/");
						((HttpServletResponse) servletResponse).addCookie(cookie);
					}
				}
			}
			((HttpServletResponse) servletResponse).sendRedirect(request.getContextPath() + "/op/login");
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub

	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
