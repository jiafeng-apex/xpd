package com.xinpengdu.web.op.access.controller;

import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

/**
 * 公司运营账号登出控制器
 */
@Controller
@RequestMapping("/op/logout")
public class OpLogoutController {
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView logout(Boolean factoryLogin, String type, HttpServletRequest req, HttpSession session) {
		Boolean midLogin = (Boolean) session.getAttribute(SessionConstants.MID_LOGIN);
//		session.removeAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
//		session.removeAttribute(SessionConstants.COMPANY_USER_UUID);
//		session.removeAttribute(SessionConstants.COMPANY_USER_USERNAME);
//		session.removeAttribute(SessionConstants.COMPANY_USER_COMPANY_CODE);
//		session.removeAttribute(SessionConstants.COMPANY_USER_SCOPE);
//		session.removeAttribute(SessionConstants.SELF_COMPANY);
		session.removeAttribute(SessionConstants.ACCESS_INFO);
		session.removeAttribute(SessionConstants.MID_LOGIN);
        Enumeration e = session.getAttributeNames();
        while (e.hasMoreElements()) {
            String sessionName = (String) e.nextElement();
            if (sessionName.startsWith(ControllerTool.SESSION_PERMISSION_PREFIX)) {
                session.removeAttribute(sessionName);
            }
        }
        if(factoryLogin != null && factoryLogin) {
			String paramText = Tool.isEmpty(type) ? "" : "?type=" + type;
			return new ModelAndView(new RedirectView(req.getContextPath() + "/op/factory/qrCode" + paramText));
		}
		if(midLogin != null && midLogin) {
			return new ModelAndView(new RedirectView(req.getContextPath() + "/op/login/mid"));
		}
		
		//客制化
		String customCompany = (String) session.getAttribute(SessionConstants.CUSTOM_COMPANY);
		if(!Tool.isEmpty(customCompany)) {
			session.removeAttribute(SessionConstants.CUSTOM_COMPANY);
			return new ModelAndView(new RedirectView(req.getContextPath() + "/op/login/" + customCompany));
		}
		
		return new ModelAndView(new RedirectView(req.getContextPath() + "/"));
	}

}
